# Criptografia e gestão de chaves

> **Situação:** minuta para discussão pública. **Versão:** 0.1. **Data:** 2026-11-07.

Dados sensíveis devem ser protegidos em repouso e em trânsito com protocolos e algoritmos atuais, acompanhados de gestão do ciclo de vida das chaves.

Chaves não devem ficar acessíveis pelo mesmo conjunto de credenciais do banco e dos backups. Uso de Shamir Secret Sharing pode ser estudado para recuperação de segredos críticos, com divisão de custódia e exercícios de restauração.

Criptografia não substitui controle de acesso nem evita todas as exposições. A escolha técnica exige inventário de ativos, responsabilidades e testes.
