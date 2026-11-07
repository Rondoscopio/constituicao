# Autenticação FIDO2, WebAuthn e chaves físicas

> **Situação:** minuta para discussão pública. **Versão:** 0.1. **Data:** 2026-11-07.
> **Natureza:** proposta institucional. Não representa implantação ou certificação de controles.

## CAPÍTULO I
### DOS FUNDAMENTOS

**Art. 1º** A autenticação de contas administrativas e serviços que tratem informações sensíveis deverá priorizar mecanismos resistentes a phishing, baseados em criptografia assimétrica, com atenção ao ciclo de vida das credenciais.

**Art. 2º** Para esta política:

I - FIDO2 compreende as especificações WebAuthn, mantidas pelo W3C, e CTAP, mantidas pela FIDO Alliance;

II - WebAuthn permite criar e utilizar credenciais de chave pública vinculadas ao identificador do serviço, sem enviar a chave privada ao servidor;

III - CTAP define mecanismos de comunicação entre plataformas e autenticadores externos ou integrados, conforme a implementação;

IV - passkey é uma credencial de autenticação FIDO que pode estar vinculada a um dispositivo ou sincronizada por um provedor compatível;

V - chave física de segurança designa um autenticador de hardware, como modelos compatíveis da família YubiKey, entre outras opções de fabricantes.

§ 1º A YubiKey é um exemplo comercial de autenticador. Não será exigida determinada marca, nem sua simples aquisição será apresentada como garantia de segurança.

§ 2º FIDO2/WebAuthn não se confunde com OpenPGP/GPG, embora dispositivos multifuncionais possam suportar ambos em aplicações e espaços de chaves diferentes.

## CAPÍTULO II
### DA AUTENTICAÇÃO E DO ACESSO

**Art. 3º** Contas administrativas, de gerenciamento de domínios, provedores de hospedagem, sistemas de identidade, repositórios de produção e custódia de segredos deverão utilizar autenticação resistente a phishing sempre que tecnicamente disponível.

§ 1º Para funções críticas será preferida credencial FIDO2 vinculada a autenticador de hardware com verificação local do usuário (PIN ou biometria, conforme disponibilidade), sem depender apenas de códigos por SMS, e-mail ou OTP.

§ 2º A escolha entre passkeys sincronizadas e vinculadas a dispositivo dependerá do risco, do processo de recuperação, da política do provedor e das necessidades de acessibilidade.

**Art. 4º** Em implementações próprias, deverão ser validados os campos exigidos pelo protocolo, incluindo origin, RP ID, desafio, associação da credencial, assinatura, presença do usuário e verificação do usuário quando requerida.

Parágrafo único. Não se deverá desenvolver implementação criptográfica própria quando bibliotecas maduras e mantidas estiverem disponíveis.

**Art. 5º** A implantação deverá incluir:

I - política de inscrição, substituição e revogação de autenticadores;

II - autenticação ou confirmação adicional para mudanças de fatores e credenciais;

III - registro de alterações de métodos de recuperação;

IV - proteção contra tomada de conta por fluxos alternativos mais fracos;

V - inventário de dispositivos autorizados e responsáveis;

VI - controles de sessão e autorização independentes da autenticação inicial.

## CAPÍTULO III
### DA RECUPERAÇÃO E DA CONTINUIDADE

**Art. 6º** Pessoas com acesso crítico deverão possuir meio de recuperação independente do dispositivo principal, preferencialmente outro autenticador físico registrado e guardado separadamente.

§ 1º A custódia e utilização de meios de recuperação deverão ser documentadas, com proteção contra uso unilateral indevido.

§ 2º A recuperação não poderá depender exclusivamente de um dispositivo, telefone, e-mail ou colaborador.

**Art. 7º** A perda, o roubo ou o comprometimento de autenticador deverá desencadear revisão dos acessos, revogação quando aplicável e verificação de alterações de conta.

**Art. 8º** A política observará formas de autenticação acessíveis e proporcionais ao papel, inclusive para colaboradores sem possibilidade de adquirir hardware específico.

## CAPÍTULO IV
### DOS LIMITES

**Art. 9º** FIDO2 oferece resistência importante ao phishing por vinculação ao serviço, mas não elimina comprometimento de endpoint, malware, sessões roubadas, falhas de autorização, coação ou recuperação de conta insegura.

**Art. 10.** A capacidade de um dispositivo guardar credenciais OpenPGP não implica que toda chave utilizada por FIDO2 tenha função de cifrar arquivos, assinar documentos externos ou funcionar como chave GPG.

## Referências

- [FIDO Alliance: Specifications](https://fidoalliance.org/specifications/).
- [FIDO Alliance: Passkeys](https://fidoalliance.org/passkeys/).
- [W3C WebAuthn Level 3, Recommendation de 25/08/2026](https://www.w3.org/TR/webauthn-3/).
- [Yubico: YubiKey FIDO](https://docs.yubico.com/hardware/yubikey/yk-tech-manual/yk5-apps-fido.html).
- [NCSC UK: FIDO2 Security Properties](https://www.ncsc.gov.uk/paper/traditional-user-and-fido2-credentials-personal-use).
