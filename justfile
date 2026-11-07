# O just apenas orquestra contêineres. Nenhum verificador roda no host.
default: check

check:
    docker compose build docs javascript workflows zizmor hadolint gitleaks semgrep trivy
    docker compose run --rm docs
    docker compose run --rm javascript
    docker compose run --rm workflows
    docker compose run --rm zizmor
    docker compose run --rm hadolint
    docker compose run --rm gitleaks
    docker compose run --rm semgrep
    docker compose run --rm trivy

docs:
    docker compose run --build --rm docs

javascript:
    docker compose run --build --rm javascript

security:
    docker compose run --build --rm gitleaks
    docker compose run --build --rm trivy
    docker compose run --build --rm semgrep

workflow:
    docker compose run --build --rm workflows
    docker compose run --build --rm zizmor

container:
    docker compose run --build --rm hadolint

sbom:
    docker compose build trivy
    docker compose run --rm -T trivy fs --format cyclonedx --output /dev/stdout /workspace > sbom.cdx.json

scorecard:
    docker compose run --build --rm scorecard

generate:
    docker compose run --build --rm --volume "./:/workspace:rw" docs node scripts/gerar_documento.mjs

format-check:
    docker compose run --build --rm docs prettier --check README.md CONTRIBUTING.md SECURITY.md compose.yaml renovate.json
    docker compose run --build --rm javascript biome check /workspace/scripts/gerar_documento.mjs
