# Criptografia simétrica e assimétrica

> **Situação:** minuta para discussão pública. **Versão:** 0.1. **Data:** 2026-11-07.
> **Natureza:** proposta institucional. Não representa implantação ou certificação de controles.

## CAPÍTULO I
### DOS CONCEITOS

**Art. 1º** O Rondoscópio utilizará mecanismos criptográficos padronizados e mantidos, distinguindo os problemas que cada um resolve.

**Art. 2º** Para efeitos desta política:

I - criptografia simétrica utiliza uma chave secreta compartilhada para cifrar e decifrar, com elevada eficiência para grandes volumes de dados;

II - criptografia assimétrica utiliza pares de chaves públicas e privadas e pode ser empregada para acordo ou encapsulamento de chaves, cifragem em esquemas apropriados e assinaturas digitais;

III - criptografia autenticada permite detectar alterações não autorizadas no conteúdo cifrado, dentro das garantias do esquema;

IV - função hash criptográfica produz um resumo de tamanho definido com propriedades próprias de integridade, não sendo um mecanismo de criptografia reversível;

V - assinatura digital permite verificar que uma chave específica assinou um conteúdo não modificado, sem garantir, isoladamente, a verdade de seu conteúdo ou a identidade civil do titular.

## CAPÍTULO II
### DOS USOS E CONTROLES

**Art. 3º** O armazenamento de informações sensíveis deverá, quando aplicável, utilizar cifragem simétrica autenticada de biblioteca madura, com algoritmos e parâmetros considerados adequados à vida útil do dado.

§ 1º A utilização de AES-GCM ou outro modo autenticado exige cuidados com geração de chave, comprimento e unicidade de nonce e contexto da operação.

§ 2º Uma chave de cifragem não deverá ser utilizada indistintamente em tarefas incompatíveis sem regras apropriadas de derivação e separação de finalidades.

**Art. 4º** A proteção e distribuição de chaves de dados poderá utilizar criptografia de envelope e mecanismos assimétricos padronizados, conforme necessidade de controle e recuperação.

**Art. 5º** A autenticação, os certificados TLS, assinaturas de artefatos e comunicações OpenPGP deverão respeitar as particularidades de seus protocolos e evitar construções criptográficas caseiras.

**Art. 6º** A escolha do algoritmo deverá considerar força de segurança, implementação, vida útil da confidencialidade, interoperabilidade, suporte técnico e existência de parâmetros adequados.

## CAPÍTULO III
### DOS LIMITES E DA EVOLUÇÃO

**Art. 7º** A segurança criptográfica dependerá da qualidade das chaves, algoritmos, aleatoriedade, dispositivos, bibliotecas e processos que os operam.

**Art. 8º** O Rondoscópio manterá inventário de usos criptográficos para permitir substituição de algoritmos, migração de padrões e revogação quando necessário.

**Art. 9º** Criptografia assimétrica tradicional baseada em RSA e curvas elípticas deverá ser identificada no planejamento de migração pós-quântica quando a confidencialidade ou a verificabilidade precisarem perdurar por muitos anos.

## Referências

- [OWASP Cryptographic Storage Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Cryptographic_Storage_Cheat_Sheet.html).
- [OWASP Key Management Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Key_Management_Cheat_Sheet).
- [NIST FIPS 197, AES](https://csrc.nist.gov/pubs/fips/197/final).
- [NIST FIPS 203, ML-KEM](https://csrc.nist.gov/pubs/fips/203/final).

## Integridade e proveniência

Cifragem simétrica autenticada, assinatura digital, funções hash e mecanismos assimétricos resolvem problemas distintos; sua combinação deve respeitar os protocolos adotados.

A assinatura não garante veracidade de uma declaração, e hash não garante autoria quando o valor de referência também puder ser adulterado.

A recuperação de material cifrado exigirá planejamento de chaves e prazos sem concessão indiscriminada de privilégios.
