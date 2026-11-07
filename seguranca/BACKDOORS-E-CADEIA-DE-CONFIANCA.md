# Portas dos fundos e cadeia de confiança

> **Situação:** minuta. **Data:** 2026-11-07. **Atualização:** consultar catálogos oficiais, pois suas entradas e versões mudam.

## CAPÍTULO I
### DO CONCEITO

**Art. 1º** O Rondoscópio deverá avaliar a possibilidade de mecanismos clandestinos ou indevidamente mantidos que contornem controles de acesso, autenticação ou integridade, conhecidos como *backdoors*.

Parágrafo único. Interfaces legítimas de administração e mecanismos documentados de acesso emergencial não deverão ser tratados automaticamente como backdoors, mas exigem controles e verificação.

**Art. 2º** Os cenários a considerar abrangem:

I - contas privilegiadas não documentadas e credenciais compartilhadas;

II - alterações maliciosas em software, bibliotecas, imagens, firmware e equipamentos;

III - comprometimento de atualizações, builds, repositórios e pipelines;

IV - chaves, certificados e configurações inseridos sem autorização;

V - componentes de servidor usados para persistência de acesso;

VI - alteração dos mecanismos de recuperação e controle de logs.

## CAPÍTULO II
### DA PREVENÇÃO

**Art. 3º** A integridade dos componentes deverá ser verificada por controles proporcionais ao risco, incluindo análise de proveniência, assinatura digital, verificação de hashes, revisão de mudanças e inventário de dependências.

**Art. 4º** As decisões de acesso privilegiado deverão ser documentadas, aprovadas e auditadas. Credenciais de emergência terão prazo, finalidade, custódia e revisão definidos.

**Art. 5º** Nenhuma assinatura digital prova, por si só, que um artefato é isento de comportamento malicioso. É necessário avaliar a confiança no processo de desenvolvimento, na identidade do signatário e na guarda da chave.

## CAPÍTULO III
### DA DETECÇÃO E DA RESPOSTA

**Art. 6º** Alterações inesperadas de contas, processos, rede, dependências, assinaturas, configurações e privilégios poderão desencadear investigação técnica proporcional.

**Art. 7º** A suspeita de porta dos fundos não autoriza atribuição pública de espionagem sem evidências verificadas.

**Art. 8º** A recuperação deverá tratar a eventual perda de confiança em chaves, sistemas, backups e artefatos, com substituição ou reconstrução segura quando necessário.

## Referências

- [MITRE T1195: Supply Chain Compromise](https://attack.mitre.org/techniques/T1195/)
- [MITRE T1505: Server Software Component](https://attack.mitre.org/techniques/T1505/)
- [SLSA](https://slsa.dev/)
- [OpenSSF](https://openssf.org/)
