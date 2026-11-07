# Qualidade, scanners e cadeia de suprimentos

Este repositório contém **documentação e dois scripts**; não é um produto web.
O `Dockerfile` define os alvos independentes `docs`, `javascript`,
`workflows`, `zizmor`, `hadolint`, `gitleaks`, `osv`,
`trivy`, `semgrep` e `scorecard`. O Compose é o contrato comum
entre desenvolvimento local e GitHub Actions. `just` é só um
orquestrador e não instala ou executa verificadores no host.

## Execução

- `docker compose run --build --rm docs`: estrutura, links, documento gerado, Markdownlint, yamllint.
- `docker compose run --build --rm javascript`: ESLint/SonarJS, ast-grep, jscpd e Vitest/fast-check.
- `docker compose run --build --rm workflows`: actionlint.
- `docker compose run --build --rm zizmor`: auditoria estática de GitHub Actions.
- `docker compose run --build --rm hadolint`: Dockerfile.
- `docker compose run --build --rm gitleaks`: segredos no conteúdo atual.
- `docker compose run --build --rm osv`: dependências com manifests/lockfiles reconhecidos.
- `docker compose run --build --rm trivy`: vulnerabilidades, segredos e configurações incorretas.
- `docker compose run --build --rm semgrep`: regras SAST locais, sem baixar regras remotas.
- `docker compose run --build --rm scorecard`: pontuação OpenSSF com `GITHUB_TOKEN`.
- `docker compose run --rm -T trivy fs --format cyclonedx --output /dev/stdout /workspace > sbom.cdx.json`: SBOM CycloneDX (depois de buildar o alvo).

`just check` executa os validadores principais via Compose.
`just security` inclui OSV e Trivy.
`just generate` cria índice e documento consolidado, mas exige montagem de escrita (veja nota abaixo).

## Aplicabilidade e limites

- **ESLint + SonarJS** verificam o gerador JS. **Biome** fica disponível para
  JS/JSON, e **Prettier** para Markdown/YAML. Não executamos formatadores
  concorrentes sobre os mesmos tipos de arquivo como gate nesta etapa.
- **Markdownlint** começa com regras básicas de integridade. Os outros
  critérios exigem saneamento editorial gradual, não supressão silenciosa.
- **ast-grep** analisa padrões de JavaScript. **jscpd** é limitado aos
  scripts, excluindo textos jurídicos e arquivos gerados.
- **Vitest + fast-check** testam o gerador sobre fixtures temporários.
- **Knip** está instalado no alvo JS, mas não roda como gate: não há
  package.json/lockfile de aplicação para análise de dependências útil.
- **Stylelint** não foi instalado, pois não há CSS ou SCSS.
- **ShellCheck/shfmt** estão disponíveis no stage de workflows; não há
  scripts shell versionados para analisar. **Hadolint** já verifica instruções RUN.
- **Renovate**: o arquivo de configuração não instala/ativa o GitHub App.
- **Dependency Review** é uma GitHub Action, não um CLI genérico; não
  foi habilitada para não violar a exigência de execução em Docker.
  OSV/Trivy fazem varredura de dependências, mas não são equivalentes ao
  diff de Dependency Review.
- **CycloneDX** é emitido pelo Trivy sob demanda. **Dependency
  Submission** não está habilitado: faltam um formato snapshot validado,
  permissões específicas e integração com a API; não devemos publicar um
  snapshot vazio ou inventado.
- **OpenSSF Scorecard** depende de rede e token, e não comprova ausência de
  vulnerabilidades. A execução agendada começa quando o workflow chegar à main.
- **Gitleaks em modo dir** verifica o snapshot atual, não todo o histórico.
  Use `gitleaks git` após revisar política de histórico e falsos positivos.

## Limitações de reprodutibilidade

Há **tags explícitas** nas imagens e versões diretas das ferramentas e SHA
fixo no checkout da Action. Os digests OCI ainda precisam ser obtidos dos
registries oficiais e registrados para pinagem imutável; o Renovate está
configurado para propor esses PRs. A instalação de dependências npm
transitivas também **não possui lockfile neste primeiro estágio**. Não
trate essas imagens como builds bit a bit reprodutíveis até sanar ambos.

A regra DL3008 do Hadolint está excepcionada para os pacotes Debian
porque as versões APT só devem ser fixadas junto com snapshots imutáveis
do repositório. O erro de uma ferramenta sempre deve falhar o job
correspondente; não foram adicionados `|| true` ou gates fictícios.

## Geração em contêiner

Por padrão a montagem é `read-only`, ideal para o CI.
Para gerar arquivos, execute explicitamente:

```sh
docker compose run --build --rm --volume "./:/workspace:rw" docs node scripts/gerar_documento.mjs
```

Isso modifica somente os dois artefatos versionados na sua cópia de trabalho.
