# syntax=docker/dockerfile:1.7@sha256:a57df69d0ea827fb7266491f2813635de6f17269be881f696fbfdf2d83dda33e
# Toolchain de qualidade: cada alvo é uma imagem independente.
# Imagens fixadas por digests conferidos nos builds do GitHub Actions.
FROM node:26.13.0-bookworm-slim@sha256:add5c17c14752c54d2f3d519ec46a3815684d41c33f198bcb09fb998f7dcbf68 AS base
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
    && apt-get install -y --no-install-recommends ca-certificates git python3 python3-venv \
    && rm -rf /var/lib/apt/lists/*
RUN useradd --create-home --uid 10001 --shell /usr/sbin/nologin quality
WORKDIR /workspace

FROM base AS node-tools
COPY .config/package.json .config/package-lock.json /opt/quality/
RUN npm ci --prefix /opt/quality --no-audit --no-fund --ignore-scripts \
    && npm rebuild --prefix /opt/quality @ast-grep/cli
ENV PATH="/opt/quality/node_modules/.bin:${PATH}"

FROM node-tools AS docs
COPY .config/python/requirements-docs.txt /opt/quality/requirements-docs.txt
RUN python3 -m venv /opt/yaml \
    && /opt/yaml/bin/pip install --no-cache-dir -r /opt/quality/requirements-docs.txt
ENV PATH="/opt/yaml/bin:${PATH}"
USER 10001:10001
CMD ["sh", "-ec", "python3 .config/scripts/validar_documentacao.py && node .config/scripts/gerar_documento.mjs --check && markdownlint-cli2 --config .config/markdownlint-cli2.yaml && yamllint -c .config/yamllint.yaml .github/workflows .github/ISSUE_TEMPLATE .config/compose.yaml"]

FROM node-tools AS javascript
COPY .config/eslint.config.mjs /opt/quality/eslint.config.mjs
COPY .config/tests/gerador.test.mjs /opt/quality/tests/gerador.test.mjs
USER 10001:10001
CMD ["sh", "-ec", "eslint -c /opt/quality/eslint.config.mjs .config/scripts/gerar_documento.mjs && ast-grep scan --config .config/sgconfig.yml .config/scripts && jscpd --min-lines 8 --min-tokens 60 --threshold 20 --ignore 'parts/**,docs/CONSTITUICAO-COMPLETA.md,docs/INDICE.md' .config/scripts && cd /opt/quality && vitest run --root /opt/quality"]

FROM koalaman/shellcheck:v0.11.0@sha256:61862eba1fcf09a484ebcc6feea46f1782532571a34ed51fedf90dd25f925a8d AS shellcheck-bin

FROM golang:1.27.3-bookworm@sha256:dc0963f32053e4bc451d24d87e3892d42d01021b61f093e98eb95c0352bb84b0 AS go-build
RUN GOBIN=/out go install github.com/rhysd/actionlint/cmd/actionlint@v1.7.12 \
    && GOBIN=/out go install mvdan.cc/sh/v3/cmd/shfmt@v3.14.1

FROM base AS workflows
COPY --from=go-build /out/actionlint /usr/local/bin/actionlint
COPY --from=go-build /out/shfmt /usr/local/bin/shfmt
COPY --from=shellcheck-bin /bin/shellcheck /usr/local/bin/shellcheck
USER 10001:10001
CMD ["sh", "-ec", "actionlint .github/workflows/*.yml"]

# Os alvos seguintes reutilizam imagens oficiais, sem copiá-las para um monólito.
FROM ghcr.io/zizmorcore/zizmor:1.32.0@sha256:3014cc8f68f663935f69b3c3e0e41f5ce102b268d97db13db0f62208747f860d AS zizmor
WORKDIR /workspace

FROM ghcr.io/hadolint/hadolint:v2.15.1-debian@sha256:9a3944b7fddcb947d1ffd90829ac1a6e5c30479223358f249d8b96c7d0019e27 AS hadolint
WORKDIR /workspace

FROM ghcr.io/gitleaks/gitleaks:v8.30.1@sha256:c00b6bd0aeb3071cbcb79009cb16a60dd9e0a7c60e2be9ab65d25e6bc8abbb7f AS gitleaks
WORKDIR /workspace

FROM ghcr.io/google/osv-scanner:v2.7.0@sha256:4f3b7e2c64b9d38a5febc5a7e4a3dfef1d1362f726dea7a2ef4762b46469fcd0 AS osv
WORKDIR /workspace

FROM ghcr.io/aquasecurity/trivy:0.76.2@sha256:8f6bb947dbc528902e11f2f5be52f7b519f6a39d5d148f41166f2040499768fb AS trivy
WORKDIR /workspace

FROM semgrep/semgrep:1.184.0@sha256:cc1b68266f267878b39739373ea9985b9a78e5d64497dd875c8de100b22695ed AS semgrep
WORKDIR /workspace

FROM ghcr.io/ossf/scorecard:v5.6.0@sha256:c0a21a1c33a2d8819937d0a8a62e6f4189c800639abd9f0bfbe61c90c71fae90 AS scorecard
WORKDIR /workspace
