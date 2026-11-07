#!/usr/bin/env python3
"""Verificação estrutural de Markdown. Não substitui revisão humana."""
from pathlib import Path
from urllib.parse import unquote
import re
import sys

ROOT = Path(__file__).resolve().parent.parent
LINK = re.compile(r"\]\(([^)\n]+)\)")
ARTICLE = re.compile(r"\*\*Art\.\s+(\d+)(?:º|\.)\*\*")
EXAMPLES = {Path("processos/ESTRUTURA-NORMATIVA.md")}
errors = []
count = 0

for document in sorted(ROOT.rglob("*.md")):
    relative = document.relative_to(ROOT)
    text = document.read_text(encoding="utf-8")
    count += 1

    if not text.strip():
        errors.append(f"{relative}: documento vazio")
        continue

    if relative.parts[0] != "modelos" and relative not in EXAMPLES:
        articles = [int(n) for n in ARTICLE.findall(text)]
        if articles and articles != list(range(1, len(articles) + 1)):
            errors.append(f"{relative}: artigos fora de sequência: {articles}")

    for raw in LINK.findall(text):
        url = raw.strip().split(" ", 1)[0]
        if url.startswith(("http:", "https:", "mailto:", "tel:", "data:", "#")):
            continue
        path = unquote(url.split("#", 1)[0].split("?", 1)[0])
        if not path or not path.lower().endswith(".md"):
            continue
        if not (document.parent / path).is_file():
            errors.append(f"{relative}: link interno não encontrado: {url}")

if errors:
    for error in errors:
        print(f"ERRO: {error}", file=sys.stderr)
    sys.exit(1)

print(f"{count} documentos verificados: nenhum arquivo vazio, link interno quebrado ou numeração irregular detectada.")
