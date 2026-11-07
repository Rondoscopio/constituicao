# MITRE: catálogo de táticas, técnicas, mitigação e detecção

> **Situação:** minuta. **Data:** 2026-11-07. **Atualização:** consultar catálogos oficiais, pois suas entradas e versões mudam.

A documentação do Rondoscópio deverá consultar os índices oficiais completos do MITRE em vez de tentar reproduzir manualmente milhares de entradas. As páginas originais mantêm identificadores, relações, plataformas, revisões e evidências. A interpretação do catálogo deve estar vinculada à versão consultada.

## 1. ATT&CK Enterprise: todas as táticas da matriz de outubro de 2026

A lista de 15 táticas abaixo corresponde ao índice [Enterprise Tactics](https://attack.mitre.org/tactics/enterprise/) consultado para esta proposta:

| ID | Tática | Referência |
| --- | --- | --- |
| TA0043 | Reconnaissance | [MITRE](https://attack.mitre.org/tactics/TA0043/) |
| TA0042 | Resource Development | [MITRE](https://attack.mitre.org/tactics/TA0042/) |
| TA0001 | Initial Access | [MITRE](https://attack.mitre.org/tactics/TA0001/) |
| TA0002 | Execution | [MITRE](https://attack.mitre.org/tactics/TA0002/) |
| TA0003 | Persistence | [MITRE](https://attack.mitre.org/tactics/TA0003/) |
| TA0004 | Privilege Escalation | [MITRE](https://attack.mitre.org/tactics/TA0004/) |
| TA0005 | Stealth | [MITRE](https://attack.mitre.org/tactics/TA0005/) |
| TA0112 | Defense Impairment | [MITRE](https://attack.mitre.org/tactics/TA0112/) |
| TA0006 | Credential Access | [MITRE](https://attack.mitre.org/tactics/TA0006/) |
| TA0007 | Discovery | [MITRE](https://attack.mitre.org/tactics/TA0007/) |
| TA0008 | Lateral Movement | [MITRE](https://attack.mitre.org/tactics/TA0008/) |
| TA0009 | Collection | [MITRE](https://attack.mitre.org/tactics/TA0009/) |
| TA0011 | Command and Control | [MITRE](https://attack.mitre.org/tactics/TA0011/) |
| TA0010 | Exfiltration | [MITRE](https://attack.mitre.org/tactics/TA0010/) |
| TA0040 | Impact | [MITRE](https://attack.mitre.org/tactics/TA0040/) |

As táticas são objetivos adversários. Uma técnica pode apoiar diferentes táticas; não se deve confundir enumeração de técnicas com sequência obrigatória de ataque.

## 2. Índices completos e atualizáveis

| Categoria | Catálogo oficial |
| --- | --- |
| Matriz Enterprise | [Enterprise](https://attack.mitre.org/matrices/enterprise/) |
| Matriz Mobile, Android e iOS | [Mobile](https://attack.mitre.org/matrices/mobile/) |
| Matriz de sistemas de controle industrial | [ICS](https://attack.mitre.org/matrices/ics/) |
| Todas as técnicas e subtécnicas | [Techniques](https://attack.mitre.org/techniques/) |
| Todas as mitigações | [Mitigations](https://attack.mitre.org/mitigations/) |
| Mitigações Enterprise | [Enterprise Mitigations](https://attack.mitre.org/mitigations/enterprise/) |
| Estratégias de detecção | [Detection Strategies](https://attack.mitre.org/detectionstrategies/) |
| Analíticas por plataforma | [Analytics](https://attack.mitre.org/analytics/) |
| Grupos observados na documentação | [Groups](https://attack.mitre.org/groups/) |
| Software e ferramentas documentadas | [Software](https://attack.mitre.org/software/) |
| Campanhas documentadas | [Campaigns](https://attack.mitre.org/campaigns/) |
| Histórico de mudanças | [Updates](https://attack.mitre.org/resources/updates/) |
| Dados para integração e versão de referência | [ATT&CK Resources](https://attack.mitre.org/resources/) |
| Modelo de técnicas defensivas | [MITRE D3FEND](https://d3fend.mitre.org/) |
| Técnicas adversárias contra sistemas de IA | [MITRE ATLAS](https://atlas.mitre.org/) |

A categorização anterior por *Data Sources* está descontinuada para novas inclusões desde o ATT&CK v18. Deve ser consultada apenas como referência histórica; o modelo mais recente prioriza *Detection Strategies* e *Analytics*. [Aviso oficial](https://attack.mitre.org/datasources/).

## 3. Estudos de detecção e prevenção associados aos riscos do Rondoscópio

| Cenário | Técnicas e estratégias oficiais de referência |
| --- | --- |
| Engenharia social | [T1684](https://attack.mitre.org/techniques/T1684/), [T1566](https://attack.mitre.org/techniques/T1566/) |
| Interceptação e MITM | [T1557](https://attack.mitre.org/techniques/T1557/), [DET0296](https://attack.mitre.org/detectionstrategies/DET0296/) |
| ARP cache poisoning | [DET0387](https://attack.mitre.org/detectionstrategies/DET0387/) |
| Abuso de conta e identidade | [T1098](https://attack.mitre.org/techniques/T1098/), [DET0096](https://attack.mitre.org/detectionstrategies/DET0096/) |
| Cadeia de suprimentos | [T1195](https://attack.mitre.org/techniques/T1195/) |
| Backdoors em componentes de servidores | [T1505](https://attack.mitre.org/techniques/T1505/) |
| Exfiltração | [TA0010](https://attack.mitre.org/tactics/TA0010/), [DET0397](https://attack.mitre.org/detectionstrategies/DET0397/) |
| Detecção e resposta proativas | [M1019](https://attack.mitre.org/mitigations/M1019/), [M1056](https://attack.mitre.org/mitigations/M1056/) |

Cada descrição do ATT&CK oferece links para relações com procedimentos e, onde disponíveis, mitigação e detecção. O Rondoscópio deverá criar seu próprio mapeamento entre a técnica, o ativo afetado, sinais observáveis, telemetria autorizada, cobertura existente e teste de eficácia.

## 4. Como transformar o catálogo em controles

Para cada técnica aplicável, registrar:

1. **Ativo e condição de exposição.** Qual parte da plataforma ou pessoa pode ser afetada.
2. **Cenário observável.** Qual comportamento se pretende prevenir ou detectar, evitando inferir autoria a partir da técnica.
3. **Controle preventivo.** Qual medida reduz a oportunidade de comprometimento.
4. **Estratégia de detecção.** Que dados, obtidos de forma autorizada, sustentam alerta verificável.
5. **Mitigação e resposta.** Qual providência proporcional pode ser aplicada.
6. **Validação.** Como o controle será testado em infraestrutura própria ou autorizada.
7. **Risco residual.** O que não é coberto e com qual prioridade deverá ser reavaliado.

Não será apresentada conformidade com todas as técnicas de um catálogo apenas porque seus links estão disponíveis.

## Aplicação e atualização

Os catálogos de táticas, técnicas, mitigações e detecções deverão ser acompanhados em sua fonte oficial, com versão ou data de consulta registrada em avaliações.

Cada técnica considerada relevante será vinculada ao ativo, hipótese observável, mitigação aplicável, telemetria de detecção e teste de eficácia, sem afirmar cobertura universal.

O mapeamento de ATT&CK não substitui análise de riscos humanos, institucionais e jurídicos, que exigem procedimentos próprios.
