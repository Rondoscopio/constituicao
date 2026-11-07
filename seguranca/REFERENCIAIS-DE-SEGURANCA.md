# Referenciais técnicos e normativos de segurança

> **Situação:** minuta para discussão pública. **Versão:** 0.1. **Data:** 2026-11-07.
> **Natureza:** referência normativa e metodológica de segurança, sem alegação de controles já implementados.

Este registro reconhece as referências consideradas na elaboração das políticas. Sua citação não significa certificação, adoção integral, parceria ou endosso.

## Referenciais de ameaça e defesa

- [MITRE ATT&CK](https://attack.mitre.org/): catálogo de táticas e técnicas observadas em ataques. A descrição de uma técnica não comprova autoria.
- [MITRE D3FEND](https://d3fend.mitre.org/): base de conhecimento de técnicas defensivas.
- [MITRE CWE](https://cwe.mitre.org/): classificação de fraquezas de software e hardware.

## Referenciais de aplicação

- [OWASP Top 10:2025](https://top10.owasp.org/2025/pt-BR/): riscos prioritários de aplicações web.
- [OWASP ASVS 5.0](https://asvs.owasp.org/): requisitos técnicos verificáveis.
- [OWASP Web Security Testing Guide](https://owasp.org/www-project-web-security-testing-guide/): orientação de testes de segurança.
- [OWASP Cheat Sheet Series](https://cheatsheetseries.owasp.org/): recomendações sobre mitigação de riscos comuns.
- [OWASP SAMM](https://owaspsamm.org/): avaliação de maturidade de práticas de segurança de software.

## Vulnerabilidades e priorização

- [CVE Program](https://www.cve.org/): identificação pública de vulnerabilidades.
- [NIST NVD](https://nvd.nist.gov/): base de enriquecimento e consulta de vulnerabilidades.
- [FIRST CVSS](https://www.first.org/cvss/): descrição de gravidade técnica.
- [FIRST EPSS](https://www.first.org/epss/): probabilidade estimada de exploração em janela definida.
- [CISA KEV](https://www.cisa.gov/known-exploited-vulnerabilities-catalog): vulnerabilidades com evidência conhecida de exploração ativa.

## Criptografia, identidade e cadeia de suprimentos

- [GnuPG](https://gnupg.org/) e [OpenPGP RFC 9580](https://www.rfc-editor.org/rfc/rfc9580): proteção e assinatura de mensagens e arquivos.
- [Certificate Transparency](https://certificate.transparency.dev/): transparência na emissão de certificados.
- [MDN Security](https://developer.mozilla.org/en-US/docs/Web/Security): segurança de navegadores, TLS e ataques web.
- [SLSA](https://slsa.dev/): integridade de artefatos e proveniência de software.

## Caso documentado: eMudhra, outubro de 2026

O episódio de chaves criptograficamente fracas em autoridades certificadoras intermediárias ilustra a dependência do HTTPS em uma cadeia de confiança. As medidas de bloqueio e atualizações realizadas por navegadores e sistemas ajudaram a reduzir o risco.

- [Mozilla Security Blog, 20 de outubro de 2026](https://blog.mozilla.org/security/2026/10/20/protecting-firefox-users-following-the-compromise-of-emudhra-intermediate-certificates/)
- [Google Security Blog, 20 de outubro de 2026](https://blog.google/security/protecting-chrome-and-android-users-from-compromised-emudhra-intermediate-ca-certificates/)
- [eMudhra, manifestação sobre o incidente](https://emudhra.com/en/post/certificate-security-incident/)

## Política de atualização

A atualização deste documento deverá registrar versão ou data do referencial quando necessária, particularidades de aplicação e ausência de endosso institucional. Os procedimentos operacionais não deverão depender apenas de rótulos, certificações declaradas ou listas de verificação.

## Catálogos oficiais e guias internos

O catálogo [MITRE: táticas, técnicas, mitigação e detecção](MITRE-CATALOGO-DE-TATICAS-MITIGACOES-E-DETECCOES.md) vincula diretamente aos índices completos Enterprise, Mobile e ICS, aos 15 objetivos táticos Enterprise, às listas de detecções e análises, campanhas, grupos e programas de software.

O índice [OWASP: riscos e controles proativos](OWASP-CATALOGOS-PROATIVOS-E-CASOS.md) aponta para Web Top 10:2025, API, Mobile, CI/CD, Serverless, Data, Privacy, LLM, aplicações com agentes, ASVS, WSTG, MASVS e SAMM.

A política de confiança em chaves toma como referência os [encontros e assinaturas do Debian](https://www.debian.org/events/keysigning). Para registro de domínios, a fonte é o [catálogo EPP da ICANN](https://www.icann.org/resources/pages/epp-status-codes-2014-06-16-en). Esses projetos não são parceiros ou certificadores do Rondoscópio.

## Operação, resposta e aprendizado

- [MITRE ATT&CK: matrizes](https://attack.mitre.org/matrices/), [técnicas](https://attack.mitre.org/techniques/), [mitigações](https://attack.mitre.org/mitigations/), [detecção](https://attack.mitre.org/detectionstrategies/) e [analytics](https://attack.mitre.org/analytics/): índices completos e atualizáveis.
- [OWASP Proactive Controls](https://top10proactive.owasp.org/), [Cheat Sheet Series](https://cheatsheetseries.owasp.org/), [ASVS](https://asvs.owasp.org/), [WSTG](https://owasp.org/www-project-web-security-testing-guide/) e [SAMM](https://owaspsamm.org/): prevenção, verificação e evolução de maturidade.
- [OWASP Logging Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Logging_Cheat_Sheet.html): projeto seguro de eventos e logs.
- [NIST SP 800-61 rev. 3](https://csrc.nist.gov/pubs/sp/800/61/r3/final): gestão e resposta a incidentes.
- [CISA, Cybersecurity Incident and Vulnerability Response Playbooks](https://www.cisa.gov/resources-tools/resources/federal-government-cybersecurity-incident-and-vulnerability-response-playbooks): referência de playbooks.

A ligação entre catálogos e controles deverá ser feita por cenários de risco, com evidência de implementação e testes. Nem todas as técnicas e mitigações são aplicáveis a todas as instalações.

## Autenticação resistente a phishing e criptografia futura

- [FIDO Alliance Specifications](https://fidoalliance.org/specifications/): especificações FIDO2, WebAuthn e CTAP e seus mecanismos de autenticação.
- [W3C WebAuthn Level 3, Recomendação de agosto de 2026](https://www.w3.org/TR/webauthn-3/): padrão de credenciais de chave pública para aplicações web.
- [Yubico Technical Manual: FIDO2](https://docs.yubico.com/hardware/yubikey/yk-tech-manual/yk5-apps-fido.html): exemplo documentado de implementação em chave física.
- [OWASP Cryptographic Storage](https://cheatsheetseries.owasp.org/cheatsheets/Cryptographic_Storage_Cheat_Sheet.html): cifragem autenticada, chaves e geradores CSPRNG.
- [OWASP Key Management](https://cheatsheetseries.owasp.org/cheatsheets/Key_Management_Cheat_Sheet): controles de armazenamento, custódia e ciclo de vida das chaves.
- [OWASP Post-Quantum Cryptography](https://cheatsheetseries.owasp.org/cheatsheets/Post_Quantum_Cryptography_Cheat_Sheet.html): inventário e planejamento de migração.
- [NIST FIPS 203](https://csrc.nist.gov/pubs/fips/203/final), [FIPS 204](https://csrc.nist.gov/pubs/fips/204/final) e [FIPS 205](https://csrc.nist.gov/pubs/fips/205/final): padrões pós-quânticos de encapsulamento e assinatura.
- [NIST IR 8547, outubro de 2026](https://csrc.nist.gov/pubs/ir/8547/final): planejamento e transição de criptografia vulnerável à computação quântica.

A referência a padrões atuais não significa que todos os componentes da infraestrutura já os suportem.
