# OWASP: catálogos, cenários e controles proativos

> **Situação:** minuta. **Data:** 2026-11-07. **Atualização:** consultar catálogos oficiais, pois suas entradas e versões mudam.

Este documento aponta para os índices oficiais relevantes ao Rondoscópio. Como a OWASP desenvolve e atualiza diferentes projetos simultaneamente, “todos os casos” deve significar **acesso integral aos catálogos oficiais**, e não copiar conteúdo desatualizado ou prometer implementar cada controle sem avaliação de aplicabilidade.

## 1. Aplicações web: OWASP Top 10 de 2025

| Categoria | Risco |
| --- | --- |
| A01:2025 | Broken Access Control |
| A02:2025 | Security Misconfiguration |
| A03:2025 | Software Supply Chain Failures |
| A04:2025 | Cryptographic Failures |
| A05:2025 | Injection |
| A06:2025 | Insecure Design |
| A07:2025 | Authentication Failures |
| A08:2025 | Software or Data Integrity Failures |
| A09:2025 | Security Logging and Alerting Failures |
| A10:2025 | Mishandling of Exceptional Conditions |

Fonte primária com páginas de cada categoria: [OWASP Top 10:2025](https://top10.owasp.org/2025/pt-BR/).

## 2. Outras famílias OWASP

| Área | Índice de referência |
| --- | --- |
| Todos os projetos OWASP Top 10 e estado de maturidade | [OWASP Developer Guide: Top 10](https://devguide.owasp.org/en/02-foundations/05-top-ten/) |
| APIs | [API Security Top 10](https://owasp.org/API-Security/) |
| Segurança de dispositivos móveis | [Mobile Top 10](https://owasp.org/www-project-mobile-top-10/) |
| Cadeia de integração e entrega | [CI/CD Security Risks](https://owasp.org/www-project-top-10-ci-cd-security-risks/) |
| Aplicações sem servidor | [Serverless Top 10](https://owasp.org/www-project-serverless-top-10/) |
| Dados | [Data Security Top 10](https://owasp.org/www-project-data-security-top-10/) |
| Privacidade | [Privacy Risks](https://owasp.org/www-project-top-10-privacy-risks/) |
| Desenvolvimento por usuários de negócio | [Citizen Development Top 10](https://owasp.org/www-project-citizen-development-top10/) |
| Aplicações com LLM, edição 2026 | [OWASP GenAI LLM Top 10 2026](https://genai.owasp.org/resource/owasp-genai-llm-top-10-2026/) |
| Agentes de IA, edição 2026 | [OWASP Agentic Applications Top 10 2026](https://genai.owasp.org/resource/owasp-top-10-for-agentic-applications-for-2026/) |

## 3. Guias preventivos e de verificação

| Recurso | Aplicação |
| --- | --- |
| [ASVS 5.0](https://github.com/OWASP/ASVS) | Requisitos verificáveis de aplicações web |
| [Proactive Controls](https://top10proactive.owasp.org/) | Princípios básicos de desenvolvimento preventivo |
| [OWASP Cheat Sheet Series](https://cheatsheetseries.owasp.org/) | Medidas práticas por tema |
| [Web Security Testing Guide](https://owasp.org/www-project-web-security-testing-guide/) | Metodologia de testes de segurança autorizados |
| [SAMM](https://owaspsamm.org/) | Maturidade de atividades de segurança no desenvolvimento |
| [MASVS](https://mas.owasp.org/MASVS/) | Requisitos de segurança para aplicativos móveis |
| [OWASP GenAI Security](https://genai.owasp.org/) | Segurança de LLMs, agentes e integrações |

## 4. Proposta de aplicação ao Rondoscópio

A seleção de controles deverá considerar o uso de Laravel, frontend web, APIs, pipelines de coleta, busca em documentos, automação e ferramentas de IA, sem pressupor stack definitiva para todas as partes.

Para cada sistema deverá existir uma matriz de requisitos de segurança com: referência OWASP e versão, condição de aplicabilidade, risco, controle, responsável, evidência de teste, resultado e revisão.

A implementação contemplará proteção contra acesso indevido, injeções, SSRF, falhas de autenticação, cache poisoning, manipulação de logs, exposição em integrações e uso de instruções maliciosas em documentos processados por IA.

A cópia de requisitos ou grandes trechos de materiais OWASP exigirá observância das licenças de cada projeto. Links e referências não constituem endosso ou certificação.
