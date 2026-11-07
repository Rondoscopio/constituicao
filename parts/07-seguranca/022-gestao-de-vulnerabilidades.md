# Gestão de vulnerabilidades

> **Situação:** minuta para discussão pública. **Versão:** 0.2. **Data:** 2026-11-07.
> **Natureza:** política institucional proposta. Não comprova controles implementados.

## CAPÍTULO I
### DO INVENTÁRIO E DA IDENTIFICAÇÃO

**Art. 1º** O Rondoscópio deverá inventariar sistemas, bibliotecas, containers, serviços, firmware, integrações, provedores, ambientes e componentes de software com responsabilidade e versão conhecidas.

**Art. 2º** O monitoramento de vulnerabilidades utilizará, conforme aplicabilidade:

I - registros CVE para identificação de vulnerabilidades divulgadas;

II - classificações CWE para tipos de fraqueza;

III - CVSS para caracterização da gravidade técnica;

IV - EPSS como indicador probabilístico de exploração em horizonte definido;

V - CISA KEV para vulnerabilidades com evidência de exploração conhecida;

VI - OWASP Top 10 e ASVS para requisitos de desenvolvimento, testes e verificação;

VII - MITRE ATT&CK para contextualização de técnicas observadas, quando pertinente.

Parágrafo único. A existência de um CVE em um componente não comprova explorabilidade da implantação concreta. A ausência de CVE também não garante segurança.

## CAPÍTULO II
### DA PRIORIZAÇÃO E DA CORREÇÃO

**Art. 3º** A correção será priorizada por exposição, possibilidade de exploração, impacto na confidencialidade de fontes, dano potencial, disponibilidade de mitigação e evidências de ataques ativos.

**Art. 4º** As ações poderão incluir atualização, desativação temporária de funcionalidade, segmentação, mitigação de configuração, revisão de permissões e substituição de componente.

**Art. 5º** Dependências deverão ser verificadas quanto à origem, integridade, manutenção e riscos de cadeia de suprimentos, com revisão de atualizações e automatização de testes.

**Art. 6º** Vulnerabilidades descobertas internamente ou relatadas por terceiros serão acompanhadas até correção, aceitação fundamentada do risco ou desativação do recurso, respeitando política de divulgação responsável.

## CAPÍTULO III
### DAS REFERÊNCIAS

**Art. 7º** O OWASP Top 10 é referência de conscientização, não substitui o conjunto verificável de requisitos do ASVS. A organização não alegará conformidade plena sem evidência de avaliação.

**Art. 8º** As versões dos referenciais e ferramentas serão registradas e periodicamente revistas.

## Referências

- [CVE Program](https://www.cve.org/)
- [MITRE CWE](https://cwe.mitre.org/)
- [FIRST CVSS](https://www.first.org/cvss/)
- [FIRST EPSS](https://www.first.org/epss/)
- [CISA KEV](https://www.cisa.gov/known-exploited-vulnerabilities-catalog)
- [OWASP Top 10:2025](https://top10.owasp.org/2025/pt-BR/)
- [OWASP ASVS 5.0](https://asvs.owasp.org/)
- [MITRE ATT&CK](https://attack.mitre.org/)

## Priorização conforme exposição real

A gestão de CVE deverá considerar versões instaladas, exploração conhecida, conectividade externa, privilégios envolvidos e valor dos dados protegidos.

A presença de uma vulnerabilidade em catálogo não comprova que determinada implantação seja explorável, assim como ausência de CVE não equivale a ausência de risco.

As medidas poderão incluir atualização, isolamento, desativação, revisão de configuração e acompanhamento de mitigação documentada.
