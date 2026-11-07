# Envenenamento de cache e resolução de nomes

> **Situação:** minuta para discussão pública. **Versão:** 0.1. **Data:** 2026-11-07.
> **Natureza:** referência normativa e metodológica de segurança, sem alegação de controles já implementados.

## CAPÍTULO I
### DOS CACHES E DOS RISCOS

**Art. 1º** O Rondoscópio deverá diferenciar cache de DNS, cache de navegador, cache de aplicação e cache compartilhado de CDN ou proxy, considerando que possuem impactos e mecanismos de ataque distintos.

**Art. 2º** Os cenários abrangem:

I - DNS cache poisoning, quando respostas ou registros indevidos alteram a resolução de nomes;

II - web cache poisoning, quando uma resposta influenciada por entrada não confiável é armazenada e distribuída a múltiplos usuários;

III - web cache deception, quando conteúdo privado é indevidamente servido por cache compartilhado;

IV - header injection, Host header abuse, chaves incompletas de cache e comportamentos inconsistentes entre proxy e aplicação;

V - contaminação de dados coletados e indexados que possa alterar documentos, indicadores ou respostas de IA.

## CAPÍTULO II
### DOS CONTROLES

**Art. 3º** O desenvolvimento deverá estabelecer política explícita de cache por tipo de conteúdo, proibindo armazenamento compartilhado de dados confidenciais e respostas personalizadas salvo justificativa técnica estrita.

**Art. 4º** Deverão ser testadas a normalização de parâmetros, o tratamento de cabeçalhos, a construção de chaves de cache, o isolamento de sessões, a invalidação e a consistência entre CDN e origem.

**Art. 5º** A proteção de resolução de nomes poderá envolver validação DNSSEC em resolvedores que a suportem, segurança do registrador, controle de alterações de zona, monitoramento de registros e revisão das dependências DNS.

Parágrafo único. DNSSEC melhora a autenticidade de respostas DNS quando corretamente validado, mas não substitui TLS, nem protege contra comprometimento da conta que controla a zona.

**Art. 6º** Mudanças de regras de cache ou de infraestrutura de resolução deverão ser testadas antes de entrar em produção e revisadas sempre que alterem cabeçalhos, parâmetros ou dados pessoais.

## Referências

- [OWASP Web Security Testing Guide](https://owasp.org/www-project-web-security-testing-guide/)
- [MITRE ATT&CK T1557.001](https://attack.mitre.org/techniques/T1557/001/)
- [OWASP Top 10:2025](https://top10.owasp.org/2025/)

## Verificação de efeitos em cadeia

Testes de CDN, proxies e cache compartilhado deverão observar chaves de cache, cabeçalhos, autenticação e separação de informações privadas e públicas.

O monitoramento de mudanças no DNS incluirá registro de alterações legítimas, segurança da conta do registrador e revisão de configuração.

A prova de um comportamento anômalo requer logs e contexto; não se presumirá ataque intencional sem investigação técnica.
