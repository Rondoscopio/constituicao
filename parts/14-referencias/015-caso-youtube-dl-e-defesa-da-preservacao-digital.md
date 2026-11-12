# Caso youtube-dl e defesa da preservação digital

> **Situação:** minuta para discussão pública. **Versão:** 0.1. **Data:** 2026-11-12.
> **Natureza:** estudo de caso histórico e referência jurídica comparada. Não é jurisprudência brasileira, parecer sobre uma situação concreta nem autorização geral para coleta, cópia ou distribuição de conteúdos.

## Propósito

O episódio ocorrido com o youtube-dl em 2020 demonstra os riscos de pedidos de retirada de software de uso geral baseados em alegações de violação autoral ou de medidas tecnológicas. O caso é relevante para a preservação de evidências audiovisuais, a liberdade de desenvolvimento de ferramentas, o jornalismo de verificação, a pesquisa, a acessibilidade, a educação e a documentação de violações de direitos humanos.

O Rondoscópio poderá utilizar este caso como referência argumentativa e histórica para defender ferramentas, métodos e atividades lícitas de preservação. A utilidade social de uma tecnologia não prova por si só que qualquer uso específico seja permitido. Devem ser examinados separadamente o código, o modo de obtenção, a finalidade do arquivo, os direitos de terceiros, as medidas técnicas existentes e as regras de cada jurisdição.

## I. Fatos verificados e cronologia

1. **21 de setembro de 2020.** Segundo a carta da EFF, a Recording Industry Association of America, RIAA, encaminhou uma notificação ao GitHub alegando violações relacionadas ao youtube-dl.
2. **23 de outubro de 2020.** O GitHub processou a solicitação e retirou do ar o repositório e cópias afetadas. O pedido foi registrado em seu repositório público de notificações DMCA.
3. **15 de novembro de 2020.** A Electronic Frontier Foundation, EFF, por meio de Mitchell L. Stoltz, encaminhou defesa técnica e jurídica dos mantenedores ao agente DMCA do GitHub.
4. **16 de novembro de 2020.** O GitHub restaurou o youtube-dl, após reavaliar a alegação de violação da Seção 1201 da DMCA e considerar correções realizadas nos testes do projeto.
5. **25 de novembro de 2020.** Human Rights Watch, Mnemonic e WITNESS manifestaram publicamente apoio à restauração e explicaram a importância da ferramenta para preservar registros audiovisuais de violações de direitos humanos.

A restauração foi uma decisão de moderação e conformidade jurídica tomada pelo GitHub, não uma sentença judicial que declarou lícito todo uso do youtube-dl. O anúncio da plataforma relata ainda a revisão proposta para futuras solicitações, com especialistas jurídicos e técnicos, oportunidade de resposta e criação de um fundo de defesa de desenvolvedores anunciado no valor de US$ 1 milhão.

## II. Organizações e atores documentados

### Electronic Frontier Foundation, EFF

Atuou como representante jurídica dos mantenedores do youtube-dl. Sua carta contestou a suficiência jurídica da notificação e descreveu usos legítimos: preservação de registros de testemunhas, pesquisas jornalísticas, educação, cópia de vídeos próprios, acessibilidade e acesso em redes lentas. A organização distinguiu interpretação pública de JavaScript de quebra de controle de acesso protegido por chaves secretas.

### Mantenedores do youtube-dl

Forneceram esclarecimentos e alteraram referências a músicas protegidas utilizadas nos testes automatizados, sem reconhecer necessariamente que os testes fossem ilícitos. Em manifestação pública posterior, agradeceram ao GitHub, à EFF e ao advogado Mitchell Stoltz pelo auxílio. O projeto também mencionou a Uberspace como provedora de hospedagem que enfrentava disputa jurídica própria na Alemanha. Essa disputa não deve ser confundida com a decisão do GitHub nos Estados Unidos.

### GitHub

Hospedava o projeto, executou a retirada e posteriormente o restaurou. Reconheceu que ferramentas com usos potencialmente infratores podem também atender a finalidades legítimas, como verificação jornalística, preservação de evidências de violações de direitos humanos, acessibilidade e conteúdos em domínio público ou licenciados em Creative Commons. Anunciou procedimentos mais rigorosos para examinar reclamações anticircunvenção e um fundo de defesa de desenvolvedores. Trata-se de decisão da plataforma, não de endosso a qualquer atividade do Rondoscópio.

### Human Rights Watch, HRW

Defendeu publicamente a preservação audiovisual como parte das investigações de direitos humanos. Sua equipe de arquivos relatou a utilização do youtube-dl para obter vídeos no melhor nível de qualidade disponível, alertando que a indisponibilidade de cópias pode prejudicar a responsabilização de autores de abusos.

### Mnemonic

Organização dedicada à preservação de documentação digital de direitos humanos. Informou ter utilizado o youtube-dl para preservar mais de dois milhões de vídeos de Sudão, Síria e Iêmen. No exame de um conjunto de vídeos verificados sobre o conflito sírio, relatou que 23% já não estavam disponíveis no YouTube. O percentual é referente à coleção examinada, não a todos os vídeos da plataforma.

### WITNESS

Destacou a importância de fluxos transparentes e acessíveis de obtenção e conservação de registros junto a parceiros locais, tanto para incidência em direitos humanos quanto para possível utilização como prova. Sua manifestação reforça que ferramentas livres podem ser componentes essenciais da cadeia de documentação.

### Outros participantes e distinções

A RIAA foi a autora da solicitação de retirada, não uma defensora da restauração. A Software Freedom Law Center foi mencionada pelo GitHub como exemplo de organização que presta apoio jurídico a desenvolvedores em disputas de propriedade intelectual, sem que isso prove participação direta na defesa específica do youtube-dl. A Uberspace foi reconhecida pelos próprios mantenedores por apoiar a hospedagem diante de disputa distinta.

ZDNet, TechCrunch, The Register e outros veículos noticiaram o episódio e discutiram suas consequências. Cobertura jornalística, manifestação institucional, representação jurídica e decisão de plataforma são categorias distintas. A relação acima documenta os atores cuja atuação foi encontrada nas fontes primárias examinadas, sem alegar ser uma lista exaustiva de todas as manifestações públicas existentes.

## III. Argumentos jurídicos e técnicos apresentados

### A alegação da RIAA

A notificação sustentava que o youtube-dl facilitaria reprodução ou distribuição não autorizada de fonogramas e vídeos musicais e permitiria contornar medidas tecnológicas de proteção usadas pelo YouTube. Apontou, entre outros elementos, referências a músicas comerciais em testes automatizados.

### A resposta da EFF sobre testes

A EFF argumentou que os testes consultavam breves trechos de vídeos sem inserir músicas nos arquivos do código nem promover sua distribuição. Sustentou que tal uso poderia ser caracterizado como fair use no direito estadunidense. Os mantenedores substituíram as referências controvertidas para reduzir o conflito. O fair use dos Estados Unidos não é automaticamente equivalente às limitações brasileiras aos direitos autorais.

### A resposta sobre suposta circumvenção

Segundo a EFF, o mecanismo de assinatura de URLs do YouTube era calculado a partir de JavaScript fornecido publicamente aos navegadores, sem chave secreta nem desbloqueio de fluxos protegidos por DRM. A defesa distinguiu executar o procedimento anunciado pelo próprio serviço de desativar ou contornar uma medida tecnológica efetiva. A argumentação citou os casos estadunidenses *Digital Drilling Data Systems, L.L.C. v. Petrolink Services*, 965 F.3d 365, 372 (5th Cir. 2020), e *Egilman v. Keller & Heckman, LLP.*, 401 F. Supp. 2d 105, 113 (D.D.C. 2005). Também distinguiu a assinatura pública de tecnologias como Widevine e CSS.

Essa descrição é o argumento da EFF sobre a implementação examinada em 2020, não uma afirmação de que todos os vídeos, serviços ou tecnologias atuais são desprovidos de DRM. O tratamento jurídico de restrições tecnológicas e contratuais depende do mecanismo e da legislação pertinentes.

### O entendimento do GitHub

Após receber os esclarecimentos, o GitHub informou que as alegações não demonstravam violação da Seção 1201 da DMCA no caso examinado. Declarou que revisaria tecnicamente e juridicamente notificações futuras, admitindo correções e manifestação dos desenvolvedores antes de retiradas quando possível. Não se tratou de declaração geral de que o direito autoral não incide sobre programas de captura audiovisual.

## IV. Fundamentos jurídicos brasileiros relevantes

A análise de eventual controvérsia do Rondoscópio deve partir da legislação brasileira, sem importar automaticamente conclusões estadunidenses.

- **Constituição Federal, art. 5º, IV, IX, XIV e XXXIII, e art. 220.** Liberdade de expressão, comunicação, informação jornalística, acesso à informação e, quando necessário ao exercício profissional, resguardo do sigilo da fonte.
- **Constituição Federal, art. 5º, V, X, XXVII, XXVIII e LXXIX.** Direito de resposta, imagem, honra, privacidade, proteção autoral e proteção de dados pessoais. Essas garantias impõem limites reais à captura, guarda e divulgação.
- **Constituição Federal, art. 216 e § 2º.** Relevância da memória cultural e dever estatal de gestão e acesso à documentação governamental. Não institui livre reprodução de toda obra privada.
- **Lei nº 12.527/2011, arts. 3º, 7º, 8º e 31.** Acesso à informação pública, transparência e proteção de informações pessoais e sigilosas, nos termos legais.
- **Lei nº 12.965/2014, arts. 2º e 3º.** Direitos humanos, liberdade de expressão, privacidade, proteção de dados, segurança e finalidade social da internet.
- **Lei nº 9.610/1998, arts. 29, 46 e 47.** Proteção da reprodução e do armazenamento de obras e hipóteses específicas de limitação, incluindo citação proporcional para crítica ou estudo e utilização de obras para produção de prova judiciária ou administrativa. O art. 46 não institui permissão genérica para arquivar ou redistribuir integralmente todo vídeo disponível na rede.
- **Lei nº 13.709/2018, art. 4º, II, a, e demais dispositivos aplicáveis.** A exclusão material para tratamento exclusivamente jornalístico depende da finalidade real. Não é imunidade da organização para cadastros, denúncias, recursos humanos ou quaisquer operações fora dessa finalidade.
- **Convenção Americana sobre Direitos Humanos, art. 13, promulgada pelo Decreto nº 678/1992.** Proteção de buscar, receber e difundir informações, vedação de restrições indiretas indevidas e admissão de responsabilidades posteriores legalmente justificadas.
- **Declaração Universal dos Direitos Humanos, art. 19.** Referência internacional de liberdade de opinião e informação. Tem natureza declaratória e não substitui a análise dos tratados e leis vinculantes aplicáveis.

A jurisprudência constitucional brasileira sobre liberdade de imprensa, censura prévia, informação e responsabilidade, inclusive ADPF 130 e ADIs 6.792 e 7.055, poderá ser relevante conforme os fatos. São decisões com objetos próprios, não precedentes que assegurem autorização irrestrita de extração de conteúdos digitais.

## V. Protocolo proposto de preservação responsável

**Art. 1º** Antes da captura, identificar o interesse público, a origem, a autorização ou fundamento jurídico, a necessidade do material, os riscos e as alternativas menos intrusivas.

**Art. 2º** O registro de evidências deverá, quando tecnicamente viável, conservar URL, plataforma, identificador público, título, autoria atribuída, data de publicação indicada, data e hora UTC da captura, versão da ferramenta e seu modo de operação, formato, tamanho, hash criptográfico e histórico de acesso ao arquivo.

§ 1º O hash comprova a consistência entre versões comparadas, não a veracidade do vídeo ou de suas alegações.

§ 2º Cópias de trabalho, transcrições, cortes e versões redigidas deverão ser identificados como derivados, conservando separadamente o arquivo original quando lícito.

**Art. 3º** Conteúdos relativos a vítimas, crianças, fontes sigilosas, dados íntimos e outras situações de risco terão armazenamento e acesso restritos, avaliação de necessidade e prazos de revisão. Divulgação pública não é consequência automática da conservação interna.

**Art. 4º** Na investigação audiovisual, serão documentadas hipóteses de montagem, remoção de contexto, identificação equivocada, geolocalização ou cronologia falsa. O [Protocolo de Berkeley](https://searchlibrary.ohchr.org/record/30334), publicado pelo Alto Comissariado da ONU para Direitos Humanos em conjunto com o Human Rights Center da Universidade da Califórnia, Berkeley, é referência metodológica, não fonte de autorização para acesso ilícito.

**Art. 5º** O Rondoscópio não praticará invasão de sistemas, aquisição clandestina de credenciais, quebra de DRM protegido, coleta de conteúdo de acesso restrito sem fundamento ou distribuição de obras em violação de direitos autorais. A existência de uma ferramenta de código aberto não substitui a avaliação da legalidade de cada operação.

**Art. 6º** A resposta a notificações de retirada deverá preservar o aviso recebido e a versão do material controvertido em condições lícitas, identificar o reclamante e a base invocada, separar o arquivo-fonte da publicação pública, verificar a alegação técnica, registrar medidas proporcionais, buscar assessoria jurídica habilitada e oferecer correção ou contestação motivada quando cabível.

§ 1º A organização não classificará toda notificação ou decisão desfavorável como censura, perseguição ou assédio.

§ 2º Ordens judiciais válidas deverão ser observadas. Eventual impugnação ocorrerá por meios legais, com atenção a prazos e à proteção de pessoas.

## VI. Fontes primárias e documentação do episódio

1. [Notificação da RIAA registrada pelo GitHub em 23 de outubro de 2020](https://github.com/github/dmca/blob/master/2020/10/2020-10-23-RIAA.md). Alegações originais da parte reclamante.
2. [Carta da EFF ao GitHub, de 15 de novembro de 2020](https://www.eff.org/files/2020/11/17/eff_letter_to_github_re_youtube-dl_11152020.pdf). Defesa técnica e jurídica dirigida ao agente DMCA.
3. [GitHub, Standing up for developers: youtube-dl is back, 16 de novembro de 2020](https://github.blog/news-insights/policy-news-and-insights/standing-up-for-developers-youtube-dl-is-back/). Decisão de restauração e medidas anunciadas.
4. [Human Rights Watch, Mnemonic e WITNESS, manifestação conjunta de 25 de novembro de 2020](https://www.hrw.org/news/2020/11/25/us-archivists-victory-over-overbroad-copyright-claim). Relatos de utilização e impactos de perda de evidências.
5. [Mantenedores do youtube-dl, comunicado de 16 de novembro de 2020](https://github.com/ytdl-org/youtube-dl/issues/27013). Agradecimentos à EFF, GitHub e Uberspace, com distinção dos conflitos.
6. [ZDNet, reportagem de Catalin Cimpanu, novembro de 2020](https://www.zdnet.fr/actualites/youtube-dl-l-eff-pousse-github-a-remettre-le-projet-en-ligne-39913143.htm). Cobertura jornalística secundária.

## VII. Referências normativas e metodológicas

- [Constituição Federal de 1988](https://www.planalto.gov.br/ccivil_03/constituicao/constituicao.htm).
- [Lei de Direitos Autorais, Lei nº 9.610/1998](https://www.planalto.gov.br/ccivil_03/leis/l9610.htm).
- [Lei de Acesso à Informação, Lei nº 12.527/2011](https://www.planalto.gov.br/ccivil_03/_ato2011-2014/2011/lei/l12527.htm).
- [Marco Civil da Internet, Lei nº 12.965/2014](https://www.planalto.gov.br/ccivil_03/_ato2011-2014/2014/lei/l12965.htm).
- [LGPD, Lei nº 13.709/2018](https://www.planalto.gov.br/ccivil_03/_ato2015-2018/2018/lei/l13709.htm).
- [Convenção Americana sobre Direitos Humanos, art. 13](https://www.oas.org/pt/cidh/expressao/showarticle.asp?artID=25&lID=4).
- [Decreto nº 678/1992, promulgação da Convenção Americana](https://www.planalto.gov.br/ccivil_03/decreto/d0678.htm).
- [Protocolo de Berkeley sobre investigações digitais em fontes abertas, 2022](https://searchlibrary.ohchr.org/record/30334).

Este documento complementa os [fundamentos legais](013-fundamentos-legais-da-fiscalizacao-e-preservacao.md), o [catálogo de jurisprudência](014-jurisprudencia-fiscalizacao-e-jornalismo.md), a [política de resiliência jurídica](../07-seguranca/013-ameacas-juridicas-politicas-e-resiliencia.md) e a [política de proteção contra assédio judicial](../06-direitos/007-protecao-contra-assedio-judicial-e-perseguicao.md). Essas propostas deverão passar por revisão jurídica antes de orientar operações concretas.
