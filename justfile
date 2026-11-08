compose := "docker compose --file .config/compose.yaml"

# O just apenas orquestra contêineres. Nenhum verificador roda no host.
default: check

check:
    {{compose}} build docs javascript workflows zizmor hadolint gitleaks semgrep trivy osv
    {{compose}} run --rm docs
    {{compose}} run --rm javascript
    {{compose}} run --rm workflows
    {{compose}} run --rm zizmor
    {{compose}} run --rm hadolint
    {{compose}} run --rm gitleaks
    {{compose}} run --rm semgrep
    {{compose}} run --rm trivy
    {{compose}} run --rm osv

docs:
    {{compose}} run --build --rm docs

javascript:
    {{compose}} run --build --rm javascript

security:
    {{compose}} run --build --rm gitleaks
    {{compose}} run --build --rm trivy
    {{compose}} run --build --rm osv
    {{compose}} run --build --rm semgrep

workflow:
    {{compose}} run --build --rm workflows
    {{compose}} run --build --rm zizmor

container:
    {{compose}} run --build --rm hadolint

sbom:
    mkdir -p .local
    {{compose}} build trivy
    {{compose}} run --rm -T trivy fs --format cyclonedx --output /dev/stdout /workspace > .local/sbom.cdx.json

scorecard:
    {{compose}} run --build --rm scorecard

generate:
    {{compose}} run --build --rm --volume "./:/workspace:rw" docs node .tools/scripts/gerar_documento.mjs

format-check:
    {{compose}} run --build --rm docs prettier --check README.md .github/CONTRIBUTING.md .github/SECURITY.md .config/compose.yaml .github/renovate.json
    {{compose}} run --build --rm javascript biome check /workspace/.tools/scripts/gerar_documento.mjs
