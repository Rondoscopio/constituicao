# Segurança de aplicações e cadeia de suprimentos

> **Situação:** minuta para discussão pública. **Versão:** 0.1. **Data:** 2026-11-07.
> **Natureza:** referência normativa e metodológica de segurança, sem alegação de controles já implementados.

## CAPÍTULO I
### DO DESENVOLVIMENTO SEGURO

**Art. 1º** O Rondoscópio deverá desenvolver seus sistemas considerando a segurança desde a concepção, inclusive em APIs, coleta, ingestão, análise e distribuição de documentos.

**Art. 2º** O processo deverá considerar:

I - modelagem de ameaças e revisão de arquitetura;

II - controle de acesso e segregação de dados por finalidade;

III - validação de entradas, parametrização de consultas e tratamento seguro de saídas;

IV - controle de sessões, autenticação resistente a phishing e proteção contra CSRF e sequestro de sessão;

V - proteção contra SSRF, injeções, execução indevida de arquivos e exposição acidental em logs;

VI - política de cache, segurança de CDN e resolução DNS;

VII - proteção contra prompt injection, manipulação de documentos coletados e acesso indevido a ferramentas por agentes de IA;

VIII - testes de segurança proporcionais à exposição e sensibilidade.

**Art. 3º** O OWASP Top 10 servirá de referência inicial de risco e o OWASP ASVS, de referência para requisitos verificáveis.

Parágrafo único. A adoção de uma lista de verificação não dispensa revisão de arquitetura, testes nem auditoria adequada.

## CAPÍTULO II
### DA CADEIA DE SUPRIMENTOS

**Art. 4º** Dependências e artefatos distribuídos deverão ter origem conhecida e integridade verificável quando possível, incluindo:

I - inventário e SBOM para componentes relevantes;

II - revisão e fixação de versões compatíveis com políticas de atualização;

III - verificação de assinaturas, checksums obtidos de origem confiável e proveniência de builds;

IV - proteção de credenciais de CI/CD e revisão de ações e pipelines de terceiros;

V - avaliação de vulnerabilidades, manutenção e licenças dos componentes;

VI - separação de ambiente de desenvolvimento, produção e sistemas confidenciais.

**Art. 5º** A organização deverá acompanhar tanto dependências diretas quanto transitivas e registrar o risco residual de correções não aplicadas.

## CAPÍTULO III
### DOS SISTEMAS DE IA

**Art. 6º** Documentos e relatos recebidos serão considerados dados não confiáveis, mesmo quando apresentados sob forma de instrução a um modelo.

**Art. 7º** O processamento automático não poderá executar ações sensíveis nem divulgar segredos apenas por receber comandos em documentos, páginas, prompts ou mensagens externas.

## Referências

- [OWASP Top 10:2025](https://top10.owasp.org/2025/pt-BR/)
- [OWASP ASVS 5.0](https://asvs.owasp.org/)
- [OWASP Cheat Sheet Series](https://cheatsheetseries.owasp.org/)
- [SLSA](https://slsa.dev/)
- [CISA SBOM](https://www.cisa.gov/sbom)

## Proveniência e revisão de mudanças

O projeto deverá verificar origem e integridade de dependências, builds, imagens e atualizações e controlar alterações de processos de CI/CD.

Um pacote assinado não é necessariamente seguro. A assinatura confirma vínculo à chave, cuja custódia e processo de publicação também precisam ser confiáveis.

A inserção de backdoors e o abuso de credenciais administrativas serão tratados com revisão de mudanças, acessos mínimos e resposta documentada.
