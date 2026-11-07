# Confiança em chaves OpenPGP e cerimônia de verificação

> **Situação:** minuta para discussão pública. **Versão:** 0.2. **Data:** 2026-11-07.
> **Aplicação:** compromisso proposto, sujeito a avaliação de risco, capacidade operacional e aprovação institucional.

## CAPÍTULO I
### DAS CHAVES E DAS IDENTIDADES

**Art. 1º** O Rondoscópio distinguirá o compartilhamento de chaves públicas da custódia de chaves privadas, bem como a obtenção de uma chave da verificação de sua associação a uma pessoa ou função institucional.

§ 1º A **chave pública** poderá ser distribuída livremente por servidores de chaves, sites, repositórios ou outros canais, desde que sua autenticidade seja verificada antes de lhe ser atribuída confiança.

§ 2º A **chave privada** não será compartilhada como mecanismo de formação de confiança, inclusive em encontros presenciais. Sua custódia ficará restrita ao titular ou ao serviço autorizado, segundo política específica de recuperação e segregação.

§ 3º A assinatura criptográfica confirma a vinculação do conteúdo a uma chave e sua integridade, não a veracidade dos fatos nele narrados.

**Art. 2º** A aceitação de uma chave para operações críticas exigirá confirmação de sua impressão digital completa (fingerprint), verificação da identidade ou função alegada e registro de como essa confirmação ocorreu.

Parágrafo único. A simples importação de uma chave, o reconhecimento do nome ou e-mail exibido ou a presença de uma chave em servidor público não constituem verificação suficiente de identidade.

## CAPÍTULO II
### DA VERIFICAÇÃO PESSOAL E DA REDE DE CONFIANÇA

**Art. 3º** Para certificação pessoal de chaves vinculadas a colaboradores com acesso sensível, será **preferido encontro presencial**, no qual o participante apresente evidências de identidade adequadas à sua função e confirme pessoalmente a impressão digital da chave.

§ 1º A inspiração para esse procedimento é a prática documentada de assinatura de chaves do projeto Debian, em que participantes verificam pessoalmente a identidade e a fingerprint antes de assinar uma chave OpenPGP.

§ 2º A verificação presencial não deverá exigir que o titular entregue a chave privada, a senha ou o dispositivo de custódia.

§ 3º Quando encontro presencial não for viável, uma alternativa de verificação remota poderá ser admitida por política de risco específica, mediante canal independente autenticado e evidências equivalentes, com registro explícito de suas limitações.

**Art. 4º** A certificação de chaves dependerá de critérios de confiança proporcionais às permissões:

I - contato informativo ou colaboração não privilegiada, sujeito a verificações ordinárias;

II - contribuição assinada ou revisão documental, com identificação e fingerprint verificadas;

III - assinatura de releases, publicações oficiais ou autorizações críticas, com confirmação reforçada e aprovações independentes;

IV - acesso a fontes protegidas, recuperação de segredos ou poder de alterar sistemas de confiança, com controles próprios e necessidade de conhecimento.

§ 1º A assinatura da chave por terceira pessoa não transfere, por si só, direitos de acesso ao Rondoscópio.

§ 2º A autoridade editorial, administrativa e técnica seguirá atribuições e revogações independentes da rede OpenPGP de confiança.

## CAPÍTULO III
### DA CUSTÓDIA, DO CICLO DE VIDA E DA REVOGAÇÃO

**Art. 5º** O projeto deverá considerar chave primária de certificação mantida fora dos dispositivos cotidianos, subchaves específicas para assinatura, autenticação e criptografia quando pertinentes e armazenamento protegido de materiais de recuperação.

**Art. 6º** A política deverá definir publicação de fingerprints institucionais, troca de chaves, expiração, substituição, revogação e aviso de comprometimento.

§ 1º Certificados ou declarações de revogação deverão ser preparados e protegidos adequadamente.

§ 2º A substituição de uma chave de publicação institucional deverá ser comunicada por canais independentes previamente reconhecidos, evitando que um único site ou uma única conta comprometida consiga impor uma nova identidade.

**Art. 7º** A assinatura de documentos pelo Rondoscópio exigirá mecanismos de preservação e verificação das versões assinadas.

## Referências

- [Debian, Keysigning](https://www.debian.org/events/keysigning)
- [Debian, processo de identificação de novos membros](https://www.debian.org/devel/join/nm-step2)
- [Debian, documentação do chaveiro](https://wiki.debian.org/DebianKeyring)
- [Debian, uso de subchaves](https://wiki.debian.org/Subkeys)
- [OpenPGP RFC 9580](https://www.rfc-editor.org/rfc/rfc9580)
- [GnuPG](https://gnupg.org/)

## Relação entre OpenPGP e autenticação FIDO2

Uma chave FIDO2/WebAuthn é gerada e utilizada para autenticação do serviço ao qual está vinculada. Uma chave OpenPGP é utilizada em operações apropriadas de criptografia, assinatura e certificação. Embora alguns dispositivos físicos, incluindo certos modelos YubiKey, implementem ambas as funcionalidades, **elas não são a mesma chave nem o mesmo protocolo**.

A cerimônia de verificação presencial inspirada no Debian diz respeito à confiança na identidade e impressão digital de uma chave OpenPGP. Não substitui o cadastro e a validação de credenciais WebAuthn pelo serviço.

Consulte [Autenticação FIDO2, WebAuthn e chaves físicas](009-autenticacao-fido2-webauthn-e-chaves-fisicas.md).

## Confiança distribuída e prevenção de personificação

A autenticação da identidade associada a uma chave não deverá depender exclusivamente de um endereço de e-mail ou de um único site sujeito a comprometimento.

As cerimônias inspiradas no Debian preferirão a confirmação pessoal de identidade e fingerprint para funções críticas, sem obrigar entrega de chave privada ou pagamento por hardware de marca específica.

Mudanças inesperadas de chave de publicação institucional deverão receber confirmação por canais independentes e registro de revogação.
