import { describe, expect, it } from "vitest";
import fc from "fast-check";
import { spawnSync } from "node:child_process";
import {
  copyFileSync,
  existsSync,
  mkdtempSync,
  mkdirSync,
  readFileSync,
  rmSync,
  writeFileSync,
} from "node:fs";
import { tmpdir } from "node:os";
import { join } from "node:path";

function withFixture(title, callback) {
  const root = mkdtempSync(join(tmpdir(), "rondoscopio-test-"));
  try {
    mkdirSync(join(root, ".tools", "scripts"), { recursive: true });
    mkdirSync(join(root, "docs"));
    mkdirSync(join(root, "parts", "00-abertura"), { recursive: true });
    mkdirSync(join(root, "parts", "01-identidade"), { recursive: true });
    copyFileSync("/workspace/.tools/scripts/gerar_documento.mjs", join(root, ".tools", "scripts", "gerar_documento.mjs"));
    writeFileSync(join(root, "parts", "00-abertura", "001-intro.md"), "# " + title + "\n\nIntrodução.\n");
    writeFileSync(join(root, "parts", "01-identidade", "001-identidade.md"), "# Identidade\n\n[Leia a introdução](../00-abertura/001-intro.md).\n");
    const run = (...args) => spawnSync(process.execPath, [join(root, ".tools", "scripts", "gerar_documento.mjs"), ...args], { cwd: root, encoding: "utf8" });
    return callback({ root, run });
  } finally {
    rmSync(root, { recursive: true, force: true });
  }
}

describe("gerador da Constituição", () => {
  it("gera os dois documentos e permite verificar sua integridade", () => {
    withFixture("Introdução", ({ root, run }) => {
      expect(run().status).toBe(0);
      expect(existsSync(join(root, "docs", "INDICE.md"))).toBe(true);
      const output = readFileSync(join(root, "docs", "CONSTITUICAO-COMPLETA.md"), "utf8");
      expect(output).toContain("## 00.001 — Introdução");
      expect(output).toContain("(#parte-00-001)");
      expect(run("--check").status).toBe(0);
      writeFileSync(join(root, "docs", "INDICE.md"), "alterado");
      expect(run("--check").status).not.toBe(0);
    });
  });

  it("mantém títulos arbitrários de caracteres seguros", () => {
    fc.assert(
      fc.property(fc.stringMatching(/^[A-Za-z][A-Za-z0-9 ]{0,12}$/), (title) => {
        withFixture(title, ({ root, run }) => {
          expect(run().status).toBe(0);
          expect(readFileSync(join(root, "docs", "INDICE.md"), "utf8")).toContain(title);
        });
      }),
      { numRuns: 16 },
    );
  });
});
