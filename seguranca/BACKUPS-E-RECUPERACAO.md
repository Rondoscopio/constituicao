# Backups e recuperação

> **Situação:** minuta para discussão pública. **Versão:** 0.1. **Data:** 2026-11-07.

Backups devem ser criptografados, versionados, segregados da infraestrutura de produção e testados por restaurações reais.

A organização definirá RPO e RTO por serviço, responsáveis por recuperação e procedimentos de sucessão. Não é suficiente verificar que arquivos de backup existem.

Deverá existir ao menos uma estratégia independente de perda do provedor ou do equipamento principal, respeitando as políticas de acesso e privacidade.

## Recuperação independente e riscos legais

Backups deverão ser testados regularmente com restauração de dados e avaliação de permissões, não apenas verificação de que o arquivo existe.

A estratégia de cópias fora da infraestrutura principal considerará segurança de chaves, indisponibilidade de provedor, acesso legítimo de sucessores e retenção de dados protegidos.

O espelhamento público de material confidencial não é substituto de backup seguro e dificulta correções e exclusões futuras.
