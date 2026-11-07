# Como contribuir

O repositório aceita sugestões de melhorias, correções, referências e críticas fundamentadas. A discussão pública deve se concentrar nos textos, suas consequências e suas fontes.

Não publique por issues ou pull requests nomes de fontes protegidas, documentos sigilosos, relatos sensíveis, credenciais ou informações pessoais desnecessárias. O GitHub não é o canal de denúncias do Rondoscópio.

Uma proposta deve indicar o trecho alterado, o motivo, as referências pertinentes e os riscos de interpretações equivocadas. Modificações substantivas da Carta Fundadora e das políticas centrais dependerão de procedimento formal de governança ainda em elaboração.

Todos os documentos são minutas enquanto não houver aprovação expressa. Revisores podem solicitar mudanças, identificar conflitos e registrar objeções fundamentadas.


## Ingresso formal e acesso a sistemas internos

Propostas, correções e referências públicas podem ser apresentadas sem tornar o participante membro formal. Não envie documentos pessoais nem declarações de adesão preenchidas por issues ou pull requests.

Pessoas que desejarem exercer função institucional ou acessar recursos internos deverão consultar as minutas do [Termo de Adesão e Compromisso](parts/09-participacao/004-termo-de-adesao-e-compromisso-institucional.md) e do [Processo de Ingresso](parts/09-participacao/005-processo-de-ingresso.md). O mecanismo ainda não está ativo, pois depende de revisão jurídica e da definição dos responsáveis.

A assinatura de uma declaração não concede poderes de representação, acesso a fontes ou admissão automática em associação civil.

## Governança e direito de discordar

As propostas de [Constituição Institucional](parts/00-abertura/001-constituicao.md) e [Código de Conduta](parts/03-governanca/005-codigo-de-conduta.md) reconhecem o direito de criticar decisões, apresentar objeções, propor reformas e solicitar apuração de abuso de poder.

Lealdade à missão não equivale a lealdade a dirigentes. Não haverá acesso obrigatório a informações privadas de colaboradores nem proibição de discordância política legítima.

O [Comitê de Ética e Conduta](parts/03-governanca/006-comite-de-etica-e-conduta.md) e os demais órgãos previstos ainda dependem de instalação efetiva. Não existem canais internos de recurso independentes enquanto a equipe for individual.

## Emendas e prevenção de mudanças abusivas

Reformas constitucionais, revisões de direitos de membros, alterações de quórum e nomeações de órgãos deverão respeitar os limites estabelecidos em [Constituição Institucional](parts/00-abertura/001-constituicao.md) e [Cláusulas de Identidade](parts/03-governanca/008-clausulas-de-identidade-e-limites-a-reforma.md).

Propostas poderão ser criticadas por sua finalidade, efeitos e contexto, inclusive quando apresentadas como melhorias técnicas. Não se admitirá retaliação contra proponentes ou opositores de boa-fé.

A discussão não torna automaticamente aprovada a proposta, e o GitHub não é canal para publicar provas confidenciais, dados pessoais ou denúncias sensíveis.


## Organização e geração do documento completo

Os documentos normativos, editoriais e complementares vivem em `parts/NN-secao/NNN-titulo.md`. A ordem decorre dos prefixos numéricos. Não altere só o arquivo consolidado.

Execute `node scripts/gerar_documento.mjs` para regenerar `INDICE.md` e `CONSTITUICAO-COMPLETA.md`; execute `node scripts/gerar_documento.mjs --check` e `python3 scripts/validar_documentacao.py` antes de solicitar revisão.

As mudanças de caminho realizadas nesta reorganização estão em [Mapa de caminhos anteriores](scripts/legacy-paths.json). Renomear um arquivo numerado exige atualizar os links que apontam para ele.
