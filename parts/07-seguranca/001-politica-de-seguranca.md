# Política de segurança

> **Situação:** minuta para discussão pública. **Versão:** 0.5. **Data:** 2026-11-07.
> **Natureza:** política institucional proposta. Não comprova controles implementados.

## CAPÍTULO I
### DOS OBJETIVOS E DOS PRINCÍPIOS

**Art. 1º** A segurança do Rondoscópio deverá proteger pessoas, fontes, colaboradores, documentos, sistemas e a continuidade das atividades, consideradas a confidencialidade, a integridade, a autenticidade, a disponibilidade e a possibilidade de recuperação.

**Art. 2º** A proteção observará riscos humanos, tecnológicos, jurídicos, físicos e institucionais, incluindo:

I - engenharia social, falsificação de identidade, infiltração, coação, manipulação de confiança e acesso indevido por pessoas internas ou externas;

II - phishing, spear phishing, spoofing, sequestro de domínio ou sessão e ataques de intermediário (MITM ou AiTM);

III - comprometimento de dispositivos, serviços, certificados digitais, infraestrutura de nomes e dependências de terceiros;

IV - injeções, falhas de controle de acesso, envenenamento de cache e outras vulnerabilidades de aplicações e rede;

V - vigilância dirigida, espionagem, obtenção clandestina de informações e tentativas de desestabilização por agentes privados ou estatais, quando justificadas pelo modelo de ameaças;

VI - incêndios, extravio, falhas operacionais, indisponibilidade de provedores, perda de chaves e outras causas não deliberadas.

Parágrafo único. Incluir uma ameaça no modelo não significa afirmar que determinada pessoa, governo ou agência pratica ou praticou espionagem contra o Rondoscópio.

## CAPÍTULO II
### DOS CONTROLES

**Art. 3º** Serão adotados, de acordo com o risco e a capacidade operacional, autenticação resistente a phishing, privilégio mínimo, autorização individualizada, segregação de funções, revisão periódica de acesso e múltiplos responsáveis para decisões sensíveis.

§ 1º Confiança pessoal, relações afetivas ou posição institucional não substituem autorização formal para acesso a fontes, credenciais ou evidências.

§ 2º A observação de comportamento suspeito deverá considerar fatos objetivos, evitar discriminação e respeitar a privacidade dos colaboradores.

**Art. 4º** As comunicações deverão empregar criptografia adequada ao risco, com validação de autenticidade de servidores, remetentes e dispositivos.

§ 1º O uso de HTTPS é obrigatório em serviços web públicos, mas não será descrito como garantia absoluta contra interceptação ou adulteração.

§ 2º Credenciais, chaves privadas, tokens e informações identificadoras de fontes exigem armazenamento e circulação restritos.

**Art. 5º** O desenvolvimento e a operação deverão considerar referências como OWASP ASVS, OWASP Top 10, MITRE ATT&CK e MITRE D3FEND, além de avisos de vulnerabilidade CVE, CISA KEV e critérios contextualizados de priorização.

Parágrafo único. A inclusão de referenciais não significa certificação nem adesão integral antes de avaliação, implementação e verificação.

**Art. 6º** O projeto deverá planejar recuperação, cópias de segurança independentes, resposta a incidentes, atualização de dependências, proteção contra adulteração de registros e eventual continuidade em provedores distintos.

## CAPÍTULO III
### DA PROTEÇÃO DE FONTES E DA TRANSPARÊNCIA

**Art. 7º** Os sistemas que recebam relatos confidenciais deverão possuir avaliação de risco própria e isolamento em relação aos serviços públicos.

**Art. 8º** A publicação dos compromissos de segurança não autoriza divulgar segredos, localizações sensíveis, configurações de acesso ou procedimentos que facilitem ataques.

**Art. 9º** Incidentes e falhas de segurança que afetem pessoas deverão ser tratados com prioridade, incluindo comunicações legalmente devidas e a minimização dos danos.

**Art. 10.** Os procedimentos específicos constam de documentos complementares e deverão ser testados antes do lançamento de serviços que recebam informações sensíveis.

## Referências

- [OWASP Top 10:2025](https://top10.owasp.org/2025/pt-BR/)
- [OWASP ASVS 5.0](https://asvs.owasp.org/)
- [MITRE ATT&CK](https://attack.mitre.org/)
- [CISA KEV](https://www.cisa.gov/known-exploited-vulnerabilities-catalog)

## CAPÍTULO IV
### DA CONFIANÇA, DA CONTINUIDADE E DA ANTECIPAÇÃO DEFENSIVA

**Art. 11.** O programa de segurança deverá contemplar conflitos de lealdade e possíveis riscos internos, sem presumir que relações pessoais, opiniões políticas ou vínculos profissionais constituam prova de ameaça.

**Art. 12.** A integridade dos sistemas será protegida contra portas dos fundos, comprometimento de dependências, abuso de credenciais e alterações não autorizadas da cadeia de confiança.

**Art. 13.** A custódia das chaves OpenPGP deverá separar chaves públicas e privadas e exigir verificação reforçada da identidade e da fingerprint antes da certificação de pessoas com responsabilidades críticas.

Parágrafo único. A prática de verificação presencial adotada como referência no projeto Debian não significa compartilhamento físico de chaves privadas.

**Art. 14.** Os estados de domínio `clientHold` e `serverHold`, estabelecidos por registradores e registros, respectivamente, integrarão as avaliações de risco de disponibilidade e autenticidade dos serviços públicos.

**Art. 15.** O programa poderá adotar inteligência de ameaças e contrainteligência exclusivamente defensiva, fundamentadas em coleta lícita, indicadores verificáveis, prevenção proativa e proteção dos direitos das pessoas.

**Art. 16.** Os controles preventivos, detectivos e de resposta deverão ser relacionados aos catálogos MITRE e OWASP aplicáveis, com registros de evidência, testes e risco residual, sem alegar cobertura integral ainda não implementada.

## Políticas complementares

- [Dupla lealdade e riscos internos](005-dupla-lealdade-e-riscos-internos.md)
- [Portas dos fundos e cadeia de confiança](006-backdoors-e-cadeia-de-confianca.md)
- [Confiança OpenPGP e cerimônia de chaves](008-confianca-openpgp-e-cerimonia-de-chaves.md)
- [Proteção de domínios, clientHold e serverHold](019-dominios-registro-e-status-epp.md)
- [Inteligência de ameaças e contrainteligência defensiva](023-inteligencia-de-ameacas-e-contrainteligencia.md)
- [MITRE: táticas, detecções e mitigações](025-mitre-catalogo-de-taticas-mitigacoes-e-deteccoes.md)
- [OWASP: catálogos e controles proativos](026-owasp-catalogos-proativos-e-casos.md)

## CAPÍTULO V
### DO MONITORAMENTO, DA PREVENÇÃO E DO APRENDIZADO

**Art. 17.** A organização deverá definir registros técnicos, monitoramento e trilhas de auditoria proporcionais ao risco, evitando coleta indiscriminada de dados de pessoas e fontes.

**Art. 18.** O programa deverá integrar prevenção, detecção, resposta a incidentes, recuperação, revisão posterior e validação das medidas corretivas.

**Art. 19.** A antecipação defensiva compreenderá identificação de exposição, priorização de vulnerabilidades, análise de hipóteses de ataque, testes autorizados e acompanhamento das técnicas e mitigações dos referenciais MITRE e OWASP.

**Art. 20.** Incidentes relevantes deverão produzir registro e avaliação pós-incidente, com lições aprendidas, medidas, responsáveis e verificação de eficácia, sem atribuições de espionagem ou dolo sem evidências.

Parágrafo único. A publicidade dos resultados deverá respeitar privacidade, necessidade, confidencialidade de fontes e riscos de facilitar novas explorações.

## Referências operacionais propostas

- [Logs, telemetria e trilhas de auditoria](024-logs-telemetria-e-trilhas-de-auditoria.md).
- [Detecção contínua e antecipação defensiva](018-deteccao-continua-e-antecipacao-defensiva.md).
- [Resposta a incidentes](030-resposta-a-incidentes.md).
- [Post-mortem e lições aprendidas](027-post-mortem-e-licoes-aprendidas.md).
- [Inteligência de ameaças e contrainteligência](023-inteligencia-de-ameacas-e-contrainteligencia.md).

## CAPÍTULO VI
### DA AUTENTICAÇÃO E DA AGILIDADE CRIPTOGRÁFICA

**Art. 21.** Para funções críticas, a autenticação deverá priorizar mecanismos resistentes a phishing, incluindo FIDO2/WebAuthn e autenticadores físicos compatíveis quando apropriados, com procedimentos de recuperação testados.

**Art. 22.** A geração de chaves, tokens e segredos não poderá depender de fontes de aleatoriedade previsíveis ou métodos caseiros, devendo utilizar geradores criptograficamente seguros.

**Art. 23.** O uso de criptografia simétrica e assimétrica deverá respeitar algoritmos padronizados, finalidade, custódia das chaves e requisitos de integridade e confidencialidade.

**Art. 24.** O planejamento de longo prazo deverá considerar vulnerabilidades futuras de algoritmos assimétricos clássicos, padrões pós-quânticos, dependências criptográficas e transição progressiva sem promessas de segurança absoluta.

§ 1º A proteção de fontes com confidencialidade duradoura terá prioridade na avaliação dos riscos de armazenamento de dados cifrados para decifração futura.

§ 2º A adoção de criptografia pós-quântica não dispensa segurança da implementação, autenticação, atualização e controle de acesso.

## Políticas de autenticação e criptografia

- [FIDO2, WebAuthn e chaves físicas](009-autenticacao-fido2-webauthn-e-chaves-fisicas.md).
- [Aleatoriedade, entropia e geração de segredos](012-aleatoriedade-entropia-e-geracao-de-segredos.md).
- [Criptografia simétrica e assimétrica](010-criptografia-simetrica-e-assimetrica.md).
- [Criptografia pós-quântica](011-criptografia-pos-quantica.md).

## CAPÍTULO VII
### DA CONTINUIDADE E DA RESILIÊNCIA INSTITUCIONAL

**Art. 25.** A proteção compreenderá abuso de normas, infiltração em cadeia decisória, perda de domínios, comprometimento de conta administrativa e ataques técnicos ou jurídicos.

**Art. 26.** Respostas defensivas não autorizarão invasão de terceiros ou espionagem clandestina.

**Art. 27.** Testes de continuidade verificarão recuperação de credenciais, provedores e publicação, sem replicação indiscriminada de dados de fontes.

Consulte [Proteção contra Captura](../03-governanca/012-protecao-contra-captura-institucional.md).
