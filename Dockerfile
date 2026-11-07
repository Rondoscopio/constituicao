# syntax=docker/dockerfile:1.7
# Toolchain de qualidade: cada alvo é uma imagem independente.
# Os tags explícitos são atualizados pelo Renovate; revisar também os digests.
FROM node:22.16.0-bookworm-slim@sha256:048ed02c5fd52e86fda6fbd2f6a76cf0d4492fd6c6fee9e2c463ed5108da0e34 AS base
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
      typescript@5.9.3 @typescript-eslint/parser@8.46.0 \
    && npm rebuild --prefix /opt/quality @ast-grep/cli
COPY tooling/eslint.config.mjs /opt/quality/eslint.config.mjs
COPY tooling/tests/gerador.test.mjs /opt/quality/tests/gerador.test.mjs
ENV PATH="/opt/quality/node_modules/.bin:${PATH}"
USER 10001:10001
CMD ["sh", "-ec", "eslint -c /opt/quality/eslint.config.mjs scripts/gerar_documento.mjs && ast-grep scan --config sgconfig.yml scripts && jscpd --min-lines 8 --min-tokens 60 --threshold 20 --ignore 'parts/**,CONSTITUICAO-COMPLETA.md,INDICE.md' scripts && cd /opt/quality && vitest run --root /opt/quality"]

FROM golang:1.25.6-bookworm@sha256:f4490d7b261d73af4543c46ac6597d7d101b6e1755bcdd8c5159fda7046b6b3e AS go-build
RUN GOBIN=/out go install github.com/rhysd/actionlint/cmd/actionlint@v1.7.12 \
    && GOBIN=/out go install mvdan.cc/sh/v3/cmd/shfmt@v3.12.0

FROM base AS workflows
COPY --from=go-build /out/actionlint /usr/local/bin/actionlint
COPY --from=go-build /out/shfmt /usr/local/bin/shfmt
USER 10001:10001
CMD ["sh", "-ec", "actionlint .github/workflows/*.yml"]

# Os alvos seguintes reutilizam imagens oficiais, sem copiá-las para um monólito.
FROM ghcr.io/zizmorcore/zizmor:1.31.1@sha256:42d409dbb851d4c5d35a058cf042b828bea1e3f2884378c526eb0974780e18d9 AS zizmor
WORKDIR /workspace

FROM ghcr.io/hadolint/hadolint:v2.12.0-debian@sha256:27173fe25e062448490a32de410c08491c626a0bef360aa2ce5d5bdd9384b50d AS hadolint
WORKDIR /workspace

FROM ghcr.io/gitleaks/gitleaks:v8.30.0@sha256:691af3c7c5a48b16f187ce3446d5f194838f91238f27270ed36eef6359a574d9 AS gitleaks
WORKDIR /workspace

FROM ghcr.io/google/osv-scanner:v2.7.0@sha256:4f3b7e2c64b9d38a5febc5a7e4a3dfef1d1362f726dea7a2ef4762b46469fcd0 AS osv
WORKDIR /workspace

FROM ghcr.io/aquasecurity/trivy:0.76.2@sha256:8f6bb947dbc528902e11f2f5be52f7b519f6a39d5d148f41166f2040499768fb AS trivy
WORKDIR /workspace

FROM semgrep/semgrep:1.176.0@sha256:12672acdb0949e19f9f6a4c2b288edd0b404f268f0ca7738a2c06f372f50362e AS semgrep
WORKDIR /workspace

FROM ghcr.io/ossf/scorecard:v5.5.0@sha256:3f24714e9366917adb7a05635382c97dfecb14b21eaef3dfa2ea48c8e23e0795 AS scorecard
WORKDIR /workspace
