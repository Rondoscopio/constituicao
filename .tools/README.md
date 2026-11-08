# Qualidade, scanners e cadeia de suprimentos

Este repositório contém **documentação e dois scripts**; não é um produto web.
O `.tools/container/Dockerfile` define os alvos independentes `docs`, `javascript`,
`workflows`, `zizmor`, `hadolint`, `gitleaks`, `osv`,
`trivy`, `semgrep` e `scorecard`. O Compose é o contrato comum
entre desenvolvimento local e GitHub Actions. `just` é só um
orquestrador e não instala ou executa verificadores no host.

## Execução

- `docker compose --file .config/compose.yaml run --build --rm docs`: estrutura, links, documento gerado, Markdownlint, yamllint.
- `docker compose --file .config/compose.yaml run --build --rm javascript`: ESLint/SonarJS, ast-grep, jscpd e Vitest/fast-check.
- `docker compose --file .config/compose.yaml run --build --rm workflows`: actionlint.
- `docker compose --file .config/compose.yaml run --build --rm zizmor`: auditoria estática de GitHub Actions.
- `docker compose --file .config/compose.yaml run --build --rm hadolint`: Dockerfile.
- `docker compose --file .config/compose.yaml run --build --rm gitleaks`: segredos no conteúdo atual.
- `docker compose --file .config/compose.yaml run --build --rm osv`: audita as dependências com base no lockfile npm de `.tools/`.
- `docker compose --file .config/compose.yaml run --build --rm trivy`: vulnerabilidades, segredos e configurações incorretas.
- `docker compose --file .config/compose.yaml run --build --rm semgrep`: regras SAST locais, sem baixar regras remotas.
- `docker compose --file .config/compose.yaml run --build --rm scorecard`: pontuação OpenSSF com `GITHUB_TOKEN`.
- `docker compose --file .config/compose.yaml run --rm -T trivy fs --format cyclonedx --output /dev/stdout /workspace > sbom.cdx.json`: SBOM CycloneDX (depois de buildar o alvo).

`just check` executa os validadores principais via Compose.
`just security` inclui Trivy e OSV, ambos validam o lockfile npm agora versionado.
`just generate` cria índice e documento consolidado, mas exige montagem de escrita (veja nota abaixo).

## Aplicabilidade e limites

- **ESLint + SonarJS** verificam o gerador JS. **Biome** fica disponível para
  JS/JSON, e **Prettier** para Markdown/YAML. Não executamos formatadores
  concorrentes sobre os mesmos tipos de arquivo como gate nesta etapa.
- **Markdownlint** começa com regras básicas de integridade. Os outros
  critérios exigem saneamento editorial gradual, não supressão silenciosa.
- **ast-grep** analisa padrões de JavaScript. Seu postinstall, necessário para instalar o binário nativo, é executado isoladamente com npm rebuild. **jscpd** é limitado aos
  scripts, excluindo textos jurídicos e arquivos gerados.
- **Vitest + fast-check** testam o gerador sobre fixtures temporários.
- **OSV-Scanner** agora é obrigatório no CI e lê o lockfile criado em `.tools/`.
- **Knip** está instalado no alvo JS, mas não roda como gate: o manifesto de
  tooling é de ferramentas CLI, não descreve dependências da aplicação.
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

Há **tags e digests conferidos** nas imagens, versões diretas das ferramentas e SHA
fixo no checkout da Action. Os digests OCI, incluindo o Scorecard, estão fixados com os manifests verificados nos builds do GitHub Actions. Renovate deverá
propor atualizações de tag e digest após revisão. As dependências npm são fixadas por `.tools/package-lock.json` e instaladas com `npm ci`. As correções de vulnerabilidades transitivas são aplicadas por `overrides` no `.tools/package.json`. O Renovate também reconhece as duas dependências de ferramentas Go declaradas em `go install`.\nAs dependências Python estão fixadas por versão em `.tools/python/requirements-docs.txt`. Restam os pacotes APT e os índices externos de pacotes, que não constituem snapshots imutáveis.

A regra DL3008 do Hadolint está excepcionada para os pacotes Debian
porque as versões APT só devem ser fixadas junto com snapshots imutáveis
do repositório. O erro de uma ferramenta sempre deve falhar o job
correspondente; não foram adicionados `|| true` ou gates fictícios.

## Geração em contêiner

Por padrão a montagem é `read-only`, ideal para o CI.
Para gerar arquivos, execute explicitamente:

```sh
docker compose --file .config/compose.yaml run --build --rm --volume "./:/workspace:rw" docs node src/gerar_documento.mjs
```

Isso modifica somente os dois artefatos versionados na sua cópia de trabalho.

## CI e ruleset

O workflow único de integração contínua é `.github/workflows/ci.yml`.
A matriz `quality` executa cada stage obrigatório definido no `.tools/container/Dockerfile`
por meio do Docker Compose. O job final, chamado exatamente **`gate`**,
tem `needs: [quality]` e `if: always()` para falhar também quando a
matriz falha ou é ignorada. O próprio `gate` não roda um analisador no
host: ele somente agrega o resultado fornecido pelo GitHub Actions.
Todos os analisadores continuam dentro dos contêineres.

No **GitHub → Settings → Rules → Rulesets**, edite ou crie um ruleset
para a branch `main`, habilite **Require status checks to pass** e
selecione **`gate`** como required check, preferencialmente com a origem
GitHub Actions. Não selecione cada instância da matriz: os nomes das
ferramentas podem mudar sem afetar a configuração do ruleset.

O contexto `gate` só aparece para seleção quando o novo workflow tiver
sido executado pelo GitHub. A exigência efetiva também depende das
permissões e da ativação do ruleset. O workflow independente
`scorecard.yml` é agendado e, portanto, não compõe o gate do PR.

## Organização dos arquivos

As regras e configurações declarativas ficam em `.config/`, incluindo Docker Compose, ESLint, Semgrep, ast-grep, Markdownlint e os demais linters. Os scripts executáveis, testes, dependências e imagens Docker ficam em `.tools/`. O `CODEOWNERS` fica na raiz, um dos locais reconhecidos automaticamente pelo GitHub.

## CodeQL: análise de código em diretórios ocultos

O gerador permanece em `.tools/scripts/gerar_documento.mjs`. Sua localização
reflete a organização documental do projeto: a raiz não precisa conter `src/`.

O CodeQL em modo **default setup** pode não descobrir arquivos JavaScript em
pastas ocultas. Para analisar o código real e manter a proteção da `main`,
o repositório precisa aplicar a configuração versionada em
`.github/codeql/codeql-config.yml` por meio da propriedade personalizada
`github-codeql-config-file` com o valor
`./.github/codeql/codeql-config.yml`.

Essa propriedade é configurada no GitHub, nas propriedades personalizadas
da organização/repositório. Apenas adicionar o arquivo YAML **não** ativa
automaticamente a configuração. O acesso administrativo do GitHub é necessário
para definir a propriedade; o fluxo de CI deste repositório não deve
contornar o CodeQL ou simular uma análise.

Após aplicar a propriedade, um novo CodeQL deve analisar JavaScript/TypeScript
e Python com sucesso e ser aceito pelo ruleset antes do merge. O `gate`
do CI Docker continua independente dessa verificação.
