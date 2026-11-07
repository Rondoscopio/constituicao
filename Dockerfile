# syntax=docker/dockerfile:1.7
# Toolchain de qualidade: cada alvo é uma imagem independente.
# Versões atualizadas; digests serão fixados após resolução no CI.
FROM node:26.13.0-bookworm-slim AS base
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
    && apt-get install -y --no-install-recommends ca-certificates git python3 python3-venv \
    && rm -rf /var/lib/apt/lists/*
RUN useradd --create-home --uid 10001 --shell /usr/sbin/nologin quality
WORKDIR /workspace

FROM base AS docs
RUN npm install --global --no-audit --no-fund --ignore-scripts \
      markdownlint-cli2@0.24.0 prettier@3.9.10
RUN python3 -m venv /opt/yaml \
    && /opt/yaml/bin/pip install --no-cache-dir yamllint==1.38.0
ENV PATH="/opt/yaml/bin:${PATH}"
USER 10001:10001
CMD ["sh", "-ec", "python3 scripts/validar_documentacao.py && node scripts/gerar_documento.mjs --check && markdownlint-cli2 && yamllint -c .yamllint.yaml .github/workflows .github/ISSUE_TEMPLATE compose.yaml"]

FROM base AS javascript
RUN mkdir -p /opt/quality \
    && npm install --prefix /opt/quality --no-audit --no-fund --ignore-scripts \
      eslint@10.14.0 eslint-plugin-sonarjs@4.2.0 \
      @biomejs/biome@2.6.6 @ast-grep/cli@0.51.1 \
      knip@6.44.2 jscpd@5.4.2 \
      vitest@5.1.0 fast-check@4.10.2 \
      typescript@5.9.3 @typescript-eslint/parser@8.72.1 \
    && npm rebuild --prefix /opt/quality @ast-grep/cli
COPY tooling/eslint.config.mjs /opt/quality/eslint.config.mjs
COPY tooling/tests/gerador.test.mjs /opt/quality/tests/gerador.test.mjs
ENV PATH="/opt/quality/node_modules/.bin:${PATH}"
USER 10001:10001
CMD ["sh", "-ec", "eslint -c /opt/quality/eslint.config.mjs scripts/gerar_documento.mjs && ast-grep scan --config sgconfig.yml scripts && jscpd --min-lines 8 --min-tokens 60 --threshold 20 --ignore 'parts/**,CONSTITUICAO-COMPLETA.md,INDICE.md' scripts && cd /opt/quality && vitest run --root /opt/quality"]

FROM koalaman/shellcheck:v0.11.0 AS shellcheck-bin

FROM golang:1.27.3-bookworm AS go-build
RUN GOBIN=/out go install github.com/rhysd/actionlint/cmd/actionlint@v1.7.12 \
    && GOBIN=/out go install mvdan.cc/sh/v3/cmd/shfmt@v3.14.1

FROM base AS workflows
COPY --from=go-build /out/actionlint /usr/local/bin/actionlint
COPY --from=go-build /out/shfmt /usr/local/bin/shfmt
COPY --from=shellcheck-bin /bin/shellcheck /usr/local/bin/shellcheck
USER 10001:10001
CMD ["sh", "-ec", "actionlint .github/workflows/*.yml"]

# Os alvos seguintes reutilizam imagens oficiais, sem copiá-las para um monólito.
FROM ghcr.io/zizmorcore/zizmor:1.32.0 AS zizmor
WORKDIR /workspace

FROM ghcr.io/hadolint/hadolint:v2.15.1-debian AS hadolint
WORKDIR /workspace

FROM ghcr.io/gitleaks/gitleaks:v8.30.1 AS gitleaks
WORKDIR /workspace

FROM ghcr.io/google/osv-scanner:v2.7.0 AS osv
WORKDIR /workspace

FROM ghcr.io/aquasecurity/trivy:0.76.2 AS trivy
WORKDIR /workspace

FROM semgrep/semgrep:1.184.0 AS semgrep
WORKDIR /workspace

FROM ghcr.io/ossf/scorecard:v5.6.0 AS scorecard
WORKDIR /workspace
