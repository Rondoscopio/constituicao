# Proteção de domínios, registros e estados EPP

> **Situação:** minuta para discussão pública. **Versão:** 0.1. **Data:** 2026-11-07.
> **Aplicação:** compromisso proposto, sujeito a avaliação de risco, capacidade operacional e aprovação institucional.

## CAPÍTULO I
### DOS RISCOS DO DOMÍNIO

**Art. 1º** O Rondoscópio deverá considerar os nomes de domínio, os registradores, os registros de domínio de topo, os servidores DNS, os certificados digitais e as contas administrativas como dependências críticas de continuidade e autenticidade.

**Art. 2º** A gestão de risco compreenderá:

I - perda ou comprometimento da conta do registrador;

II - alteração não autorizada de contatos, delegação ou registros DNS;

III - vencimento, litígio, suspensão contratual, procedimento regulatório ou judicial e outras causas de indisponibilidade;

IV - uso indevido de nomes semelhantes para personificação e golpes;

V - alteração dos estados de registro, inclusive **clientHold** e **serverHold**.

## CAPÍTULO II
### DOS ESTADOS CLIENTHOLD E SERVERHOLD

**Art. 3º** O estado **clientHold** é definido no protocolo EPP pelo registrador e instrui o registro a não ativar o domínio no DNS. Pode ocorrer, conforme o domínio e suas regras, em situações como litígios, falta de pagamento ou procedimentos de exclusão.

**Art. 4º** O estado **serverHold** é definido pela entidade operadora do registro (registry) e impede a ativação do domínio no DNS, observadas as regras do domínio de topo.

§ 1º Os estados mencionados nos arts. 3º e 4º podem impedir a resolução normal do domínio, mesmo quando o servidor de origem permanece operacional.

§ 2º A manutenção de DNSSEC, HTTPS, cache, CDN ou de espelhos sob o **mesmo domínio** não impede necessariamente os efeitos de um hold na delegação.

§ 3º Os efeitos observáveis podem variar temporariamente por causa de caches DNS, comportamento de resolvedores e do momento da atualização da zona.

**Art. 5º** clientHold e serverHold não equivalem, por definição, a exclusão do registro, transferência do domínio ou prova de censura. A causa concreta deverá ser verificada junto ao registrador ou registro competente.

## CAPÍTULO III
### DA PREVENÇÃO E DA CONTINUIDADE

**Art. 6º** A instituição deverá manter, conforme viabilidade:

I - inventário dos domínios, registradores, contatos de recuperação e vencimentos;

II - autenticação forte e segregação das credenciais de registro, DNS e hospedagem;

III - proteção contra transferência e exclusão indevidas, inclusive mecanismos de lock quando disponíveis e adequados;

IV - monitoramento de mudanças de RDAP/WHOIS e estados EPP, delegação, registros DNS e emissão de certificados;

V - renovação e pagamentos com redundância operacional adequada;

VI - procedimentos documentados de contestação administrativa, correção de dados e resposta a notificações;

VII - meios alternativos de divulgar **endereços oficiais previamente verificados**, sem induzir o público a confiar em domínios improvisados ou imitadores.

**Art. 7º** Poderão ser mantidos domínios ou pontos de publicação alternativos sob provedores e dependências distintos, com divulgação e assinaturas institucionais verificáveis.

§ 1º A presença de alternativas não autoriza descumprir ordens judiciais válidas.

§ 2º A independência de infraestrutura deverá ser testada, inclusive quanto ao registro de domínio e à autoridade sobre DNS, para que uma falha única não interrompa todos os pontos de acesso.

**Art. 8º** A recuperação de um domínio suspenso deverá ser tratada como incidente de disponibilidade, autenticidade e comunicação, com avaliação da origem e dos requisitos de regularização.

## Referências

- [ICANN, EPP Status Codes](https://www.icann.org/resources/pages/epp-status-codes-2014-06-16-en)
- [ICANN, Domain Name Registration Data / RDAP](https://www.icann.org/rdap)
- [IANA, Root Zone Database](https://www.iana.org/domains/root/db)
- [RFC 5731, EPP Domain Name Mapping](https://www.rfc-editor.org/rfc/rfc5731)
