# Autenticidade, spoofing e interceptação

> **Situação:** minuta para discussão pública. **Versão:** 0.1. **Data:** 2026-11-07.
> **Natureza:** referência normativa e metodológica de segurança, sem alegação de controles já implementados.

## CAPÍTULO I
### DOS RISCOS DE IDENTIDADE E TRÁFEGO

**Art. 1º** A plataforma deverá considerar falsificação de origem e identidade em múltiplas camadas, incluindo e-mail, domínio, DNS, mensagens, rede local, serviço e pessoa que solicita uma ação.

**Art. 2º** Os riscos relevantes compreendem:

I - e-mail spoofing, personificação e domínios visualmente semelhantes;

II - DNS spoofing, envenenamento de resolução de nomes e comprometimento de registros ou contas do registrador;

III - ARP spoofing, DHCP spoofing, redes Wi-Fi impostoras e ataques de intermediário;

IV - sequestro ou fixação de sessão, captura de tokens e comprometimento de cookies;

V - emissão fraudulenta ou aceitação indevida de certificados digitais;

VI - comprometimento do dispositivo, instalação de autoridades certificadoras adversárias, proxies indevidos e extensões maliciosas.

## CAPÍTULO II
### DOS CONTROLES DE AUTENTICIDADE

**Art. 3º** Os serviços deverão utilizar criptografia TLS atualizada, verificação adequada de certificados, HSTS onde aplicável, cookies seguros, proteção de sessões e controle rigoroso de autenticação.

**Art. 4º** A proteção de domínios e e-mails deverá considerar:

I - autenticação resistente a phishing e proteção de contas do registrador e DNS;

II - registros SPF, DKIM e políticas DMARC configuradas e verificadas para domínios que enviem e-mail;

III - monitoramento de certificados emitidos e medidas como CAA e Certificate Transparency quando adequadas;

IV - verificação de remetentes e solicitações críticas por meio de canais previamente conhecidos;

V - atualização e controle de sistemas operacionais, navegadores, clientes e repositórios de certificados confiáveis.

Parágrafo único. SPF, DKIM e DMARC reduzem determinadas formas de fraude de e-mail, mas não eliminam personificação visual, contas comprometidas ou mensagens enviadas de domínios maliciosos próprios.

## CAPÍTULO III
### DOS LIMITES DO HTTPS

**Art. 5º** HTTPS corretamente validado oferece proteção forte contra interceptação e alteração de tráfego por intermediários na rede, mas não impede todos os ataques, especialmente quando o dispositivo, o sistema de confiança ou os servidores estão comprometidos.

**Art. 6º** O incidente eMudhra de outubro de 2026 será considerado caso documentado de falha na infraestrutura de certificados.

§ 1º A falha envolveu chaves recuperáveis de oito certificados de autoridades certificadoras intermediárias, o que criou a possibilidade de emitir certificados falsos aparentemente confiáveis.

§ 2º A eMudhra informou que os intermediários afetados não haviam emitido certificados públicos para usuários finais, e autoridades de confiança e fornecedores de navegadores adotaram medidas de bloqueio e revogação.

§ 3º O caso demonstra um risco tecnicamente possível. Não será descrito como prova de espionagem real de um cidadão, organização ou país específico.

## Referências

- [Mozilla, 20/10/2026: incidente eMudhra](https://blog.mozilla.org/security/2026/10/20/protecting-firefox-users-following-the-compromise-of-emudhra-intermediate-certificates/)
- [Google, 20/10/2026: proteção de Chrome e Android](https://blog.google/security/protecting-chrome-and-android-users-from-compromised-emudhra-intermediate-ca-certificates/)
- [eMudhra: esclarecimentos públicos do incidente](https://emudhra.com/en/post/certificate-security-incident/)
- [MITRE ATT&CK T1557](https://attack.mitre.org/techniques/T1557/)
- [MDN: ataques de intermediário](https://developer.mozilla.org/en-US/docs/Web/Security/Attacks/MITM)

## Limitações da cadeia de confiança

HTTPS validado oferece proteção robusta, mas pode falhar diante de comprometimento do cliente, autoridade certificadora ou configuração de confiança.

A avaliação de spoofing deverá considerar DNS, e-mail, registrador, certificados, nomes semelhantes e redes locais, com verificação independente em ações críticas.

O caso eMudhra deverá ser citado como risco documentado envolvendo certificados, sem ser apresentado como prova de interceptação contra uma pessoa específica.
