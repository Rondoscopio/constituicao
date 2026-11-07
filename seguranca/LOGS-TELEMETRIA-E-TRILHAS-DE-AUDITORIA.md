# Logs, telemetria e trilhas de auditoria

> **Situação:** minuta para discussão pública. **Versão:** 0.1. **Data:** 2026-11-07.
> **Natureza:** política proposta. A documentação operacional e os segredos permanecerão em ambiente protegido.

## CAPÍTULO I
### DAS FINALIDADES

**Art. 1º** O Rondoscópio deverá manter registros técnicos proporcionais às necessidades de segurança, disponibilidade, integridade de documentos, responsabilização operacional e investigação de incidentes.

Parágrafo único. A existência de logs não autoriza vigilância contínua de colaboradores, denunciantes ou visitantes sem base, finalidade e avaliação de necessidade.

**Art. 2º** O inventário dos registros deverá diferenciar:

I - logs de autenticação, autorização e mudanças de permissões;

II - eventos de aplicações, serviços, plataformas e infraestrutura;

III - registros de alterações de código, configuração, certificados, domínios e artefatos;

IV - eventos de integridade, alertas de malware, falhas e vulnerabilidades;

V - trilhas editoriais de aprovação e alteração de documentos;

VI - telemetria de disponibilidade e desempenho agregada.

## CAPÍTULO II
### DA PROTEÇÃO E DA MINIMIZAÇÃO

**Art. 3º** Os registros serão projetados para não armazenar segredos, tokens, senhas, chaves privadas, documentos confidenciais completos ou dados identificadores de fontes sem necessidade comprovada.

§ 1º Os serviços de denúncias deverão ter política específica de minimização e retenção, inclusive para IP, User-Agent, cabeçalhos de rede, identificadores de dispositivo e metadados de anexos.

§ 2º Logs do portal público não serão reutilizados para identificar usuários pseudônimos ou correlacionar fontes com investigações sem finalidade lícita devidamente avaliada.

**Art. 4º** A integridade dos registros críticos deverá considerar armazenamento de escrita restrita, segregação de acesso, sincronização de tempo, versionamento, retenção definida e verificação criptográfica quando compatível.

§ 1º Hashes e assinaturas digitais podem facilitar verificação de alterações, mas não tornam confiável a origem de registros produzidos por sistema já comprometido.

§ 2º Cópias de segurança de logs deverão respeitar a mesma classificação e prazos de retenção dos registros originais.

## CAPÍTULO III
### DO MONITORAMENTO E DA AUDITORIA

**Art. 5º** Alertas deverão usar sinais verificáveis e regras sujeitas a revisão, com atenção à taxa de falsos positivos, impacto operacional e risco de exposição de pessoas.

**Art. 6º** A auditoria do acesso aos logs deverá ser independente, quando possível, do privilégio de alterá-los.

**Art. 7º** O acesso e a análise de telemetria para investigação de incidente deverão ser justificados, documentados e proporcionais à finalidade.

## Referências

- [OWASP Logging Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Logging_Cheat_Sheet.html).
- [OWASP Top 10:2025](https://top10.owasp.org/2025/).
- [MITRE ATT&CK: Defense Impairment](https://attack.mitre.org/tactics/TA0112/).
- [MITRE ATT&CK: Detection Strategies](https://attack.mitre.org/detectionstrategies/).
