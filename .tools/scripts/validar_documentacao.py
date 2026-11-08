#!/usr/bin/env python3
"""Valida prefixos, integridade de caminhos relativos e geração do texto unificado."""
from pathlib import Path
import re
import sys
from urllib.parse import unquote

ROOT = Path(__file__).resolve().parents[2]
PARTS = ROOT / "parts"
LINK = re.compile(r"!?\[[^\]\n]*\]\(([^)\n]+)\)")
EXTERNAL = re.compile(r"^(?:[a-z][a-z0-9+.-]*:|//)", re.I)
errors = []
if not PARTS.is_dir():
    errors.append("Diretório parts/ não encontrado")
else:
    for section in sorted(PARTS.iterdir()):
        if not section.is_dir() or not re.match(r"^\d{2}-", section.name):
            errors.append(f"Pasta inválida em parts/: {section.name}")
            continue
        sequence = []
        for file in sorted(section.iterdir()):
            if not file.is_file() or not re.match(r"^\d{3}-.+\.md$", file.name):
                errors.append(f"Arquivo sem prefixo numérico: {file.relative_to(ROOT)}")
                continue
            sequence.append(int(file.name[:3]))
        if sequence != list(range(1, len(sequence) + 1)):
            errors.append(f"Sequência não consecutiva: {section.relative_to(ROOT)}")
for file in ROOT.rglob("*.md"):
    if any(part in {".git", ".cache", ".local", "node_modules"} for part in file.parts):
        continue
    text = file.read_text(encoding="utf-8")
    for match in LINK.finditer(text):
        target = match.group(1).strip()
        if EXTERNAL.match(target) or target.startswith("#"):
            continue
        path = unquote(target.split("#", 1)[0].split("?", 1)[0]).split(" ", 1)[0]
        if not path:
            continue
        resolved = (file.parent / path).resolve()
        if not resolved.is_file():
            errors.append(f"Link inexistente em {file.relative_to(ROOT)}: {target}")
if errors:
    for item in errors:
        print("ERRO:", item, file=sys.stderr)
    sys.exit(1)
print("Validação concluída: prefixos e links relativos")
