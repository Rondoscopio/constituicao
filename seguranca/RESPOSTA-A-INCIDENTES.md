# Resposta a incidentes

> **Situação:** minuta para discussão pública. **Versão:** 0.3. **Data:** 2026-11-07.
> **Natureza:** política institucional proposta. Não comprova controles implementados.

## CAPÍTULO I
### DO TRATAMENTO

**Art. 1º** Incidentes de segurança deverão ser analisados quanto a sua natureza, gravidade e possíveis impactos sobre fontes, colaboradores, dados, integridade do acervo e continuidade.

**Art. 2º** O processo deverá contemplar:

I - identificação, registro e avaliação do incidente;

II - contenção proporcional, com preservação lícita de evidências;

III - análise de causa e alcance, inclusive em serviços de terceiros;

IV - recuperação segura, revogação de acessos e restauração validada;

V - comunicações e notificações exigidas por lei e pelo risco às pessoas;

VI - revisão dos procedimentos e prevenção de recorrência.

## CAPÍTULO II
### DOS CASOS ESPECÍFICOS

**Art. 3º** Indícios objetivos de infiltração, abuso de confiança, comprometimento de chaves, interceptação, spoofing ou envenenamento de cache serão tratados com avaliação técnica e respeito aos direitos das pessoas envolvidas.

§ 1º A ausência de explicação imediata para um comportamento de sistema não prova espionagem.

§ 2º Medidas sobre colaboradores observarão a proporcionalidade, a confidencialidade e a possibilidade de contestação.

**Art. 4º** Em incidentes envolvendo fontes protegidas, a redução do risco à pessoa precederá a conveniência de tornar público o incidente.

**Art. 5º** As informações compartilhadas após um incidente deverão evitar detalhes que possibilitem nova exploração antes da mitigação.

## CAPÍTULO III
### DA PREPARAÇÃO

**Art. 6º** Os contatos, funções, exercícios, caminhos de escalonamento e acessos de emergência serão definidos em documentos operacionais protegidos antes do lançamento de serviços sensíveis.

**Art. 7º** O plano será revisto após incidentes relevantes e exercícios de recuperação.

## CAPÍTULO IV
### DOS REGISTROS E DAS EVIDÊNCIAS

**Art. 8º** A resposta deverá utilizar registros técnicos necessários e proporcionais à investigação do incidente, protegendo logs contra adulteração e acesso indevido.

**Art. 9º** A preservação de evidências digitais não deverá resultar em divulgação injustificada de dados de fontes, colaboradores ou terceiros.

## CAPÍTULO V
### DA REVISÃO PÓS-INCIDENTE

**Art. 10.** Incidentes relevantes deverão ser examinados em revisão posterior, com cronologia, impactos, causa técnica, fatores organizacionais, eficácia da resposta e providências futuras.

**Art. 11.** O relatório pós-incidente deverá separar fatos observados de hipóteses, identificar lacunas de detecção e preservar dados confidenciais.

**Art. 12.** As medidas corretivas deverão possuir responsáveis e critérios de verificação, sem considerar encerrado o aprendizado apenas porque o serviço foi restaurado.

## Documentos complementares

- [Logs e telemetria](LOGS-TELEMETRIA-E-TRILHAS-DE-AUDITORIA.md).
- [Post-mortem e lições aprendidas](POST-MORTEM-E-LICOES-APRENDIDAS.md).
- [Detecção contínua e antecipação](DETECCAO-CONTINUA-E-ANTECIPACAO-DEFENSIVA.md).
- [MITRE: detecções e mitigações](MITRE-CATALOGO-DE-TATICAS-MITIGACOES-E-DETECCOES.md).

## Incidentes que afetem a governança

O plano contemplará também comprometimento de contas institucionais, manipulação de permissões, eliminação de registros de decisão e tentativa de concentrar poder por abuso de emergência.

A resposta técnica poderá restringir acesso de modo provisório para proteger pessoas e sistemas, mas não substituirá destituição formal sem defesa e revisão.

Incidentes que exponham fontes exigirão prioridade de proteção, acompanhamento jurídico e comunicação conforme responsabilidades concretas.
