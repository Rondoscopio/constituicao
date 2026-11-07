# Detecção contínua, antecipação defensiva e validação

> **Situação:** minuta para discussão pública. **Versão:** 0.1. **Data:** 2026-11-07.
> **Natureza:** política proposta. A documentação operacional e os segredos permanecerão em ambiente protegido.

## CAPÍTULO I
### DA PREPARAÇÃO PROATIVA

**Art. 1º** O Rondoscópio deverá avaliar de forma contínua riscos futuros previsíveis, buscando reduzir as condições que permitam o comprometimento de contas, software, documentos e fontes.

**Art. 2º** A atuação preventiva considerará:

I - inventário atualizado de ativos, usuários privilegiados, dependências e superfícies expostas;

II - análise de configurações e alterações de serviços, certificados e domínios;

III - priorização de vulnerabilidades por exposição, gravidade, exploração conhecida e impacto;

IV - simulações controladas de comprometimento e recuperação em ambientes próprios;

V - modelagem de cenários de ataque antes de introduzir novas funcionalidades;

VI - validação de controles criptográficos, cópias de segurança e mecanismos de detecção;

VII - revisão de riscos operacionais e humanos após mudanças relevantes.

## CAPÍTULO II
### DA DETECÇÃO BASEADA EM HIPÓTESES

**Art. 3º** A equipe poderá conduzir *threat hunting* defensivo, mediante hipóteses técnicas delimitadas, fontes de telemetria autorizadas e investigação proporcional.

§ 1º As hipóteses deverão indicar o comportamento esperado, os dados necessários e as evidências que as confirmariam ou enfraqueceriam.

§ 2º Não será permitida coleta indiscriminada de dados pessoais para tentar descobrir suposta deslealdade sem elementos objetivos.

**Art. 4º** As estratégias de detecção deverão considerar:

I - cobertura de técnicas e objetivos adversários relevantes no MITRE ATT&CK;

II - indicação de lacunas, alarmes, falsos positivos e limitações da telemetria;

III - ensaios autorizados para verificar se sinais são observados;

IV - testes após correções, novas versões e alteração das dependências;

V - mecanismos de resposta seguros contra uso indevido ou execução automática excessiva.

**Art. 5º** As técnicas de defesa poderão ser mapeadas ao MITRE D3FEND, enquanto os controles de aplicações serão fundamentados no OWASP ASVS, Cheat Sheets e requisitos aplicáveis.

## CAPÍTULO III
### DA ANTECIPAÇÃO E DO LIMITE LEGAL

**Art. 6º** Antecipar ações de adversários significa proteger recursos antes do ataque, e não realizar operações ofensivas contra indivíduos ou serviços externos.

**Art. 7º** Qualquer teste intrusivo dependerá de autorização expressa, definição de escopo e preparação para consequências operacionais.

## Referências

- [MITRE ATT&CK](https://attack.mitre.org/).
- [MITRE Detection Strategies](https://attack.mitre.org/detectionstrategies/).
- [MITRE Analytics](https://attack.mitre.org/analytics/).
- [MITRE D3FEND](https://d3fend.mitre.org/).
- [OWASP ASVS](https://asvs.owasp.org/).
- [CISA KEV](https://www.cisa.gov/known-exploited-vulnerabilities-catalog).

## Exercícios e medida de eficácia

As hipóteses de detecção serão avaliadas por testes autorizados, telemetria disponível, falsos positivos, falhas de cobertura e custo operacional.

A estratégia de antecipação deverá priorizar riscos demonstrados e dependências críticas antes de empregar recursos em cenários sofisticados sem evidências de exposição.

Os resultados alimentarão correção de configuração, gestão de vulnerabilidades, revisão de acesso e exercícios de recuperação.
