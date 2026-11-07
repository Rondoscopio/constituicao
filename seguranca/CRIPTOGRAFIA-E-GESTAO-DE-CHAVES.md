# Criptografia e gestão de chaves

> **Situação:** minuta para discussão pública. **Versão:** 0.2. **Data:** 2026-11-07.
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
