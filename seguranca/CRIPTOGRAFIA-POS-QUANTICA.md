# Criptografia pós-quântica e agilidade criptográfica

> **Situação:** minuta para discussão pública. **Versão:** 0.1. **Data:** 2026-11-07.
> **Natureza:** proposta institucional. Não representa implantação ou certificação de controles.

## CAPÍTULO I
### DA PROTEÇÃO A LONGO PRAZO

**Art. 1º** O Rondoscópio deverá planejar a proteção de informações e assinaturas cuja confidencialidade ou autenticidade precisem permanecer válidas por longos períodos, considerando a evolução da computação quântica e das tecnologias criptográficas.

**Art. 2º** Criptografia pós-quântica designa algoritmos executados em computadores convencionais e projetados para resistir a ataques conhecidos de computadores clássicos e de futuros computadores quânticos criptograficamente relevantes.

Parágrafo único. Essa expressão não equivale a comunicação quântica, distribuição quântica de chaves ou garantia de segurança absoluta.

**Art. 3º** O projeto avaliará, especialmente, o risco conhecido como *harvest now, decrypt later*, em que comunicações cifradas são copiadas hoje para tentativa de decifração futura.

§ 1º Informações com vida útil de confidencialidade elevada, incluindo identidades de fontes, documentos sigilosos e registros sensíveis, merecem avaliação prioritária.

§ 2º A duração de sigilo exigida por um dado pode ser diferente de seu prazo de retenção.

## CAPÍTULO II
### DOS PADRÕES E DA MIGRAÇÃO

**Art. 4º** O planejamento terá por referência os padrões do NIST:

I - FIPS 203, ML-KEM, para estabelecimento de segredo compartilhado mediante encapsulamento de chave;

II - FIPS 204, ML-DSA, para assinatura digital pós-quântica;

III - FIPS 205, SLH-DSA, para assinatura digital baseada em hash sem estado;

IV - recomendações e revisões posteriores publicadas pelos órgãos competentes, com registro de versão e avaliação da maturidade da implementação.

**Art. 5º** A migração deverá contemplar:

I - inventário das dependências criptográficas e dos locais de uso de RSA, DH, ECDH e ECC;

II - classificação de dados pela duração de sensibilidade;

III - avaliação do suporte real de protocolos, bibliotecas, provedores, hardware e sistemas operacionais;

IV - adoção progressiva de integrações padronizadas, com construções híbridas clássicas e pós-quânticas quando recomendadas;

V - avaliação de compatibilidade, desempenho, tamanhos de chaves e assinaturas, latência e recuperação;

VI - mecanismos de substituição de algoritmo sem reescrever toda a arquitetura;

VII - testes, monitoramento, revisão de novas publicações e retirada segura de mecanismos obsoletos.

**Art. 6º** O emprego de ML-KEM para estabelecer segredos não dispensa criptografia simétrica autenticada para cifrar o conteúdo. Algoritmos pós-quânticos não substituem automaticamente AES nem outras primitivas modernas que mantenham força de segurança apropriada.

**Art. 7º** O projeto deverá evitar sistemas experimentais e algoritmos sem avaliação suficiente em fluxos que protejam fontes ou outros dados sensíveis.

## CAPÍTULO III
### DAS ASSINATURAS E DA CONFIANÇA

**Art. 8º** A migração de assinaturas digitais de documentos, atualizações e identidades institucionais deverá preservar rastreabilidade, validade de versões antigas, vínculos de confiança e capacidade de verificar assinaturas históricas.

**Art. 9º** O suporte a FIDO2, WebAuthn, OpenPGP ou determinado dispositivo físico não deverá ser apresentado automaticamente como resistência pós-quântica; a propriedade dependerá dos algoritmos e implementações concretos.

**Art. 10.** O compromisso institucional será manter agilidade criptográfica e planejamento verificável, sem anunciar segurança pós-quântica antes de testes e confirmação de compatibilidade.

## Referências

- [NIST FIPS 203, ML-KEM](https://csrc.nist.gov/pubs/fips/203/final).
- [NIST FIPS 204, ML-DSA](https://csrc.nist.gov/pubs/fips/204/final).
- [NIST FIPS 205, SLH-DSA](https://csrc.nist.gov/pubs/fips/205/final).
- [NIST IR 8547, Transição para criptografia pós-quântica, outubro de 2026](https://csrc.nist.gov/pubs/ir/8547/final).
- [NIST, projeto de criptografia pós-quântica](https://csrc.nist.gov/Projects/Post-Quantum-Cryptography).
- [OWASP Post-Quantum Cryptography Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Post_Quantum_Cryptography_Cheat_Sheet.html).
