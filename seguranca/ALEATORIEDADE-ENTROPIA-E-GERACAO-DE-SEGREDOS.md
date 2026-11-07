# Aleatoriedade, entropia e geração de segredos

> **Situação:** minuta para discussão pública. **Versão:** 0.1. **Data:** 2026-11-07.
> **Natureza:** proposta institucional. Não representa implantação ou certificação de controles.

## CAPÍTULO I
### DOS RISCOS DE ALEATORIEDADE FRACA

**Art. 1º** A geração de chaves, identificadores de sessão, nonces, códigos de recuperação, tokens, credenciais, segredos e desafios de autenticação deverá utilizar fontes de aleatoriedade criptograficamente seguras.

**Art. 2º** É vedado empregar geradores pseudoaleatórios comuns, funções de embaralhamento, datas, contadores, nomes, dados previsíveis ou procedimentos caseiros como fontes exclusivas de segredos críticos.

§ 1º Uma sequência que parece aleatória visualmente não é necessariamente imprevisível.

§ 2º Caracteres digitados ao acaso por uma pessoa, identificadores sequenciais, hashes de dados públicos e UUIDs de origem não comprovada não serão considerados substitutos de entropia suficiente.

**Art. 3º** A segurança deverá considerar:

I - entropia real disponibilizada pela plataforma;

II - qualidade, manutenção e configuração do gerador criptográfico;

III - riscos na inicialização, especialmente em imagens clonadas, dispositivos e ambientes virtualizados;

IV - correta geração e uso de nonces e vetores de inicialização, conforme o algoritmo;

V - reutilização acidental de valores e chaves;

VI - verificações durante rotação, restauração e recuperação de sistemas.

## CAPÍTULO II
### DOS CONTROLES

**Art. 4º** Serão utilizadas interfaces de CSPRNG mantidas pelo sistema operacional ou por bibliotecas criptográficas reconhecidas, com configuração adequada à plataforma.

§ 1º Funções como Math.random em JavaScript não são apropriadas para gerar material secreto. Devem ser usadas APIs criptográficas mantidas e adequadas ao ambiente, como os geradores seguros oferecidos pelo runtime ou sistema operacional.

§ 2º Algoritmos, bibliotecas e parâmetros não deverão ser escolhidos por preferência estética, velocidade isolada ou exemplos copiados sem avaliação.

**Art. 5º** A proteção de chaves e tokens deverá observar tempo de vida, revogação, armazenamento, não exposição em URLs ou logs, transporte seguro e uso no contexto correto.

**Art. 6º** O projeto deverá avaliar e testar a geração de segredos nas rotinas de instalação, restauração de backup, clonagem de máquinas e criação de novos ambientes.

## CAPÍTULO III
### DAS LIMITAÇÕES

**Art. 7º** O emprego de CSPRNG é necessário, mas não suficiente: uma chave bem gerada pode ser comprometida por armazenamento indevido, vulnerabilidade da aplicação, canal inseguro ou autorização excessiva.

**Art. 8º** A qualidade da aleatoriedade deverá ser considerada nos processos de assinatura digital, geração de chaves e certificados, autenticação FIDO e criptografia pós-quântica, conforme as exigências de cada mecanismo.

## Referências

- [OWASP Cryptographic Storage Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Cryptographic_Storage_Cheat_Sheet.html).
- [OWASP Key Management Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Key_Management_Cheat_Sheet).
- [NIST SP 800-90A](https://csrc.nist.gov/pubs/sp/800/90/a/r1/final).
- [NIST SP 800-90B](https://csrc.nist.gov/pubs/sp/800/90/b/final).
