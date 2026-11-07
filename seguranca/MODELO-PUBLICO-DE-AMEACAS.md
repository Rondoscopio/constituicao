# Modelo público de ameaças

> **Situação:** minuta para discussão pública. **Versão:** 0.3. **Data:** 2026-11-07.
> **Natureza:** política institucional proposta. Não comprova controles implementados.

## CAPÍTULO I
### DO ESCOPO

**Art. 1º** O modelo de ameaças deverá identificar ativos, dependências, atores com capacidades distintas, caminhos de comprometimento, impactos e medidas de mitigação.

§ 1º Serão considerados criminosos comuns, fraudadores, operadores de campanhas de influência, pessoas com acesso legítimo que abusam de permissões e adversários tecnicamente sofisticados, inclusive agentes estatais, quando pertinentes ao contexto.

§ 2º Capacidade de espionagem estatal constitui cenário de planejamento, não evidência de monitoramento específico da organização.

**Art. 2º** A classificação de riscos deverá considerar:

I - probabilidade e evidências de exposição;

II - capacidade e motivação plausíveis do adversário;

III - gravidade do dano às pessoas, aos dados e à continuidade;

IV - efetividade dos controles e possibilidade de detecção;

V - custo operacional, impacto sobre direitos e riscos residuais.

## CAPÍTULO II
### DOS CENÁRIOS DE AMEAÇA

**Art. 3º** A avaliação abrangerá, entre outros cenários:

I - acesso por engenharia social, criação de identidade falsa, infiltração em equipes, manipulação emocional e abuso de relações de confiança;

II - falsificação de remetentes e domínios, DNS/ARP spoofing, redirecionamentos, comprometimento de contas e sessões;

III - ataques de intermediário, emissão ou aceitação indevida de certificados TLS e comprometimento da cadeia de confiança;

IV - ataques a caches de aplicação, CDN ou DNS, comprometimento de software, dependências, atualizações e ambientes de compilação;

V - comprometimento de dispositivos pessoais, extração de metadados e vigilância direcionada;

VI - indisponibilidade, apagamento, sequestro de dados, coerção e ataques a provedores ou colaboradores;

VII - manipulação de relatos públicos, envenenamento de dados e prompt injection em fluxos de inteligência artificial.

**Art. 4º** O risco será reavaliado quando surgirem novas funcionalidades, parceiros, fontes sensíveis, vulnerabilidades relevantes ou incidentes demonstrados.

## CAPÍTULO III
### DOS LIMITES E DA PUBLICIDADE

**Art. 5º** O modelo público apresentará ameaças e compromissos de modo verificável, sem detalhar topologia restrita, dispositivos, acessos de emergência ou identidades protegidas.

**Art. 6º** Investigações de possível espionagem deverão preservar provas e buscar apoio especializado, sem fazer acusações públicas baseadas apenas em suspeita, divergência pessoal ou percepção subjetiva.

**Art. 7º** As análises técnicas poderão utilizar MITRE ATT&CK para descrever comportamentos observáveis e MITRE D3FEND para estudar respostas defensivas, respeitando seus limites de aplicação.

## Referências

- [MITRE ATT&CK Enterprise](https://attack.mitre.org/)
- [MITRE D3FEND](https://d3fend.mitre.org/)
- [T1684: Social Engineering](https://attack.mitre.org/techniques/T1684/)
- [T1557: Adversary-in-the-Middle](https://attack.mitre.org/techniques/T1557/)

## Ameaças institucionais e riscos de continuidade

O modelo de ameaças deverá também acompanhar possíveis conflitos de lealdade, riscos internos, portas dos fundos e suspensão de domínios por estados EPP como clientHold e serverHold. Esses cenários não implicam suspeita automática contra pessoas ou provedores.

O ciclo de inteligência de ameaças buscará evidências e medidas preventivas, detectivas e de resposta. A atividade de contrainteligência será estritamente defensiva e não envolverá vigilância clandestina.

Consulte [Dupla lealdade](DUPLA-LEALDADE-E-RISCOS-INTERNOS.md), [Backdoors](BACKDOORS-E-CADEIA-DE-CONFIANCA.md), [Status EPP](DOMINIOS-REGISTRO-E-STATUS-EPP.md) e [Inteligência de ameaças](INTELIGENCIA-DE-AMEACAS-E-CONTRAINTELIGENCIA.md).
