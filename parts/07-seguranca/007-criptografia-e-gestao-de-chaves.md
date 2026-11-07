# Criptografia e gestão de chaves

> **Situação:** minuta para discussão pública. **Versão:** 0.4. **Data:** 2026-11-07.
> **Natureza:** política institucional proposta. Não comprova controles implementados.

## CAPÍTULO I
### DOS OBJETIVOS E DO EMPREGO

**Art. 1º** Informações sensíveis deverão ser protegidas em trânsito e em repouso por protocolos e algoritmos adequados, com gestão de chaves, autenticação e controle de acesso compatíveis com os riscos.

**Art. 2º** Os mecanismos de proteção poderão incluir:

I - TLS e HTTPS para comunicações web e APIs, com configuração atualizada e validação de certificados;

II - criptografia de volumes, bancos, arquivos e backups, com segregação de chaves;

III - criptografia de ponta a ponta para comunicações que exijam proteção contra intermediários;

IV - OpenPGP, por implementações como GnuPG (GPG), para casos de troca de arquivos, mensagens e assinatura digital em que haja compatibilidade e operação segura;

V - assinaturas digitais e hashes criptográficos para verificar integridade, autoria atribuída a uma chave e proveniência de artefatos;

VI - autenticação forte, preferencialmente resistente a phishing, para contas e ações críticas.

§ 1º GPG é uma implementação de padrões de criptografia e assinaturas. A existência de uma chave PGP não demonstra a identidade civil de seu titular sem verificação independente da vinculação.

§ 2º Um hash isolado permite comparar bytes, mas não prova autoria nem autenticidade da origem se o valor de referência puder ser adulterado.

§ 3º Uma assinatura digital verifica que determinada chave assinou conteúdo íntegro. Não comprova, sem outras evidências, que as informações contidas nele sejam verdadeiras ou que a chave pertença à pessoa alegada.

## CAPÍTULO II
### DA CADEIA DE CONFIANÇA

**Art. 3º** A segurança de HTTPS depende também da segurança do dispositivo cliente, da validação dos certificados, das autoridades certificadoras, das chaves privadas e dos mecanismos de atualização e revogação.

**Art. 4º** Deverão ser considerados incidentes de emissão indevida, chaves fracas ou comprometidas, inclusão de autoridades certificadoras não confiáveis, redirecionamento de tráfego e comprometimento de aplicações cliente.

Parágrafo único. O caso eMudhra de outubro de 2026 evidencia a possibilidade de comprometer a confiança em conexões HTTPS mesmo sem conhecer a chave privada do servidor legítimo. Isso não implica que toda conexão HTTPS esteja vulnerável ou que tenha ocorrido exploração contra determinado usuário.

**Art. 5º** A arquitetura deverá considerar, conforme risco e compatibilidade, Certificate Transparency, revisão de cadeias de certificados, mecanismos de revogação, HSTS, segurança do DNS, controles de emissão de certificados e atualização de sistemas e repositórios de confiança.

## CAPÍTULO III
### DA CUSTÓDIA, DO CICLO DE VIDA E DAS LIMITAÇÕES

**Art. 6º** Chaves privadas e materiais de recuperação deverão ter custódia definida, acesso restrito, rotação motivada por risco, revogação e recuperação testada.

**Art. 7º** Poderá ser estudada divisão de segredos para recuperação de ativos críticos, mediante controles que impeçam concentração de todas as partes em uma pessoa ou dispositivo.

**Art. 8º** A criptografia não protege contra toda forma de vazamento, especialmente quando uma extremidade está comprometida, a chave é exposta ou o próprio conteúdo revela a identidade da fonte.

**Art. 9º** Nenhuma ferramenta será apresentada como proteção absoluta contra adversários avançados ou ordens judiciais válidas.

## Referências

- [OpenPGP RFC 9580](https://www.rfc-editor.org/rfc/rfc9580)
- [GnuPG](https://gnupg.org/)
- [Mozilla: proteção após o incidente eMudhra](https://blog.mozilla.org/security/2026/10/20/protecting-firefox-users-following-the-compromise-of-emudhra-intermediate-certificates/)
- [Google: proteção contra certificados eMudhra](https://blog.google/security/protecting-chrome-and-android-users-from-compromised-emudhra-intermediate-ca-certificates/)

## CAPÍTULO IV
### DAS CERIMÔNIAS DE CONFIANÇA OPENPGP

**Art. 10.** A chave pública poderá ser divulgada livremente. A chave privada permanecerá sob custódia autorizada e não será compartilhada para comprovar identidade.

**Art. 11.** A atribuição de confiança a uma chave usada para operações sensíveis dependerá de verificação da fingerprint completa e de confirmação independente da identidade ou função do titular.

§ 1º Será preferido encontro presencial para certificação de chaves críticas, conforme a tradição documentada do Debian, sem impedir alternativas remotas autenticadas quando avaliadas e aprovadas.

§ 2º A presença física do participante não implica entrega da chave privada ou da respectiva senha.

**Art. 12.** Chaves primárias, subchaves, expiração, revogação e comprovação de substituição deverão seguir política específica, com separação de custódia e procedimentos de recuperação.

Consulte [Confiança OpenPGP e cerimônia de chaves](008-confianca-openpgp-e-cerimonia-de-chaves.md).

## CAPÍTULO V
### DA AUTENTICAÇÃO, ALEATORIEDADE E TRANSIÇÃO PÓS-QUÂNTICA

**Art. 13.** Os acessos críticos deverão priorizar autenticação FIDO2/WebAuthn resistente a phishing, com avaliação de autenticadores físicos, métodos de recuperação e proteção contra fluxos alternativos inseguros.

**Art. 14.** A geração de chaves, desafios, nonces e tokens deverá utilizar geradores criptograficamente seguros e mecanismos adequados de gestão da entropia.

**Art. 15.** A instituição distinguirá:

I - cifragem simétrica autenticada, adequada a grandes volumes de dados;

II - mecanismos de chaves assimétricas, empregados para acordos de chave, autenticação e assinatura segundo o protocolo;

III - funções hash, que não constituem cifragem reversível;

IV - assinaturas digitais, que verificam integridade e associação a uma chave, mas não atestam isoladamente a verdade do conteúdo;

V - mecanismos pós-quânticos de estabelecimento de chaves e assinatura, conforme padrões reconhecidos.

**Art. 16.** A política de longo prazo deverá manter inventário de algoritmos e dependências criptográficas e considerar riscos de coleta presente de informações para decifração futura.

**Art. 17.** A migração para padrões pós-quânticos será gradual e baseada em suporte real de bibliotecas e protocolos, testes e condições de interoperabilidade.

**Art. 18.** Nenhuma credencial FIDO2 ou chave GPG será descrita como resistente a computadores quânticos apenas por sua modalidade física ou pelo nome da ferramenta.

Consulte [Autenticação FIDO2](009-autenticacao-fido2-webauthn-e-chaves-fisicas.md), [Aleatoriedade e entropia](012-aleatoriedade-entropia-e-geracao-de-segredos.md), [Criptografia simétrica e assimétrica](010-criptografia-simetrica-e-assimetrica.md) e [Criptografia pós-quântica](011-criptografia-pos-quantica.md).

## Aplicação à preservação institucional

Chaves utilizadas para assinar documentos, builds e comunicados não deverão permanecer exclusivamente sob custódia de uma pessoa sem possibilidade de recuperação legítima.

A separação entre chave primária, subchaves, credenciais de autenticação e segredos de backup deve corresponder a responsabilidades e procedimentos distintos.

O plano de substituição de algoritmos contemplará validação de versões históricas e proteção de fontes com confidencialidade duradoura.
