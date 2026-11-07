# syntax=docker/dockerfile:1.7
# Toolchain de qualidade: cada alvo é uma imagem independente.
# Os tags explícitos são atualizados pelo Renovate; revisar também os digests.
FROM node:22.16.0-bookworm-slim AS base
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
    && apt-get install -y --no-install-recommends ca-certificates git python3 python3-venv shellcheck \
    && rm -rf /var/lib/apt/lists/*
RUN useradd --create-home --uid 10001 --shell /usr/sbin/nologin quality
WORKDIR /workspace

FROM base AS docs
RUN npm install --global --no-audit --no-fund --ignore-scripts \
      markdownlint-cli2@0.24.0 prettier@3.6.2
RUN python3 -m venv /opt/yaml \
    && /opt/yaml/bin/pip install --no-cache-dir yamllint==1.37.1
ENV PATH="/opt/yaml/bin:${PATH}"
USER 10001:10001
CMD ["sh", "-ec", "python3 scripts/validar_documentacao.py && node scripts/gerar_documento.mjs --check && markdownlint-cli2 && yamllint -c .yamllint.yaml .github/workflows .github/ISSUE_TEMPLATE compose.yaml"]

FROM base AS javascript
RUN mkdir -p /opt/quality \
    && npm install --prefix /opt/quality --no-audit --no-fund --ignore-scripts \
      eslint@9.31.0 eslint-plugin-sonarjs@3.0.5 \
      @biomejs/biome@2.1.2 @ast-grep/cli@0.39.0 \
      knip@5.61.0 jscpd@4.0.5 \
      vitest@3.2.4 fast-check@4.3.0 \
      typescript@5.9.3 @typescript-eslint/parser@8.46.0
COPY tooling/eslint.config.mjs /opt/quality/eslint.config.mjs
COPY tooling/tests/gerador.test.mjs /opt/quality/tests/gerador.test.mjs
ENV PATH="/opt/quality/node_modules/.bin:${PATH}"
USER 10001:10001
CMD ["sh", "-ec", "eslint -c /opt/quality/eslint.config.mjs scripts/gerar_documento.mjs && sg scan --config sgconfig.yml scripts && jscpd --min-lines 8 --min-tokens 60 --threshold 20 --ignore 'parts/**,CONSTITUICAO-COMPLETA.md,INDICE.md' scripts && cd /opt/quality && vitest run --root /opt/quality"]

FROM golang:1.25.6-bookworm AS go-build
RUN GOBIN=/out go install github.com/rhysd/actionlint/cmd/actionlint@v1.7.12 \
    && GOBIN=/out go install mvdan.cc/sh/v3/cmd/shfmt@v3.12.0

FROM base AS workflows
COPY --from=go-build /out/actionlint /usr/local/bin/actionlint
COPY --from=go-build /out/shfmt /usr/local/bin/shfmt
USER 10001:10001
CMD ["sh", "-ec", "actionlint .github/workflows/*.yml"]

# Os alvos seguintes reutilizam imagens oficiais, sem copiá-las para um monólito.
FROM ghcr.io/zizmorcore/zizmor:1.31.1 AS zizmor
WORKDIR /workspace

FROM ghcr.io/hadolint/hadolint:v2.12.0-debian AS hadolint
WORKDIR /workspace

FROM ghcr.io/gitleaks/gitleaks:v8.30.0 AS gitleaks
WORKDIR /workspace

FROM ghcr.io/google/osv-scanner:v2.7.0 AS osv
WORKDIR /workspace

FROM ghcr.io/aquasecurity/trivy:0.76.2 AS trivy
WORKDIR /workspace

FROM semgrep/semgrep:1.176.0 AS semgrep
WORKDIR /workspace

FROM ghcr.io/ossf/scorecard:v5.5.0 AS scorecard
WORKDIR /workspace
