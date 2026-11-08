import { readFileSync, writeFileSync, readdirSync, existsSync } from "node:fs";
import { dirname, join, resolve } from "node:path";
import { fileURLToPath } from "node:url";

const root = resolve(dirname(fileURLToPath(import.meta.url)), "..");
const base = join(root, "parts");
const documents = [];
for (const section of readdirSync(base, { withFileTypes: true }).filter(x => x.isDirectory()).map(x => x.name).sort()) {
  if (!/^\d{2}-/.test(section)) throw new Error("Pasta sem prefixo numérico: " + section);
  for (const name of readdirSync(join(base, section), { withFileTypes: true }).filter(x => x.isFile()).map(x => x.name).sort()) {
    if (!/^\d{3}-.+\.md$/.test(name)) throw new Error("Arquivo sem prefixo numérico: " + section + "/" + name);
    const path = "parts/" + section + "/" + name;
    documents.push({ path, content: readFileSync(join(root, path), "utf8") });
  }
}
if (!documents.length) throw new Error("Nenhuma parte encontrada em parts/");
function buildOutputs(docs){
 const labels={"00":"Abertura","01":"Identidade","02":"Princípios","03":"Governança","04":"Editorial","05":"Metodologia","06":"Direitos","07":"Segurança","08":"Denúncias","09":"Participação","10":"Memória","11":"Educação","12":"Transparência","13":"Processos","14":"Referências","15":"Modelos"};
 const list=docs.slice().sort((a,b)=>a.path<b.path?-1:a.path>b.path?1:0);
 const anchor=x=>{const m=x.match(/^parts\/(\d{2})-[^/]+\/(\d{3})-[^/]+\.md$/);if(!m)throw Error("Caminho fora do padrão: "+x);return "parte-"+m[1]+"-"+m[2]};
 const norm=x=>{const out=[];for(const p of x.split("/")){if(!p||p===".")continue;if(p==="..")out.pop();else out.push(p)}return out.join("/")};
 const slug=x=>x.normalize("NFD").replace(/[\u0300-\u036f]/g,"").toLowerCase().replace(/[^\w\s-]/g,"").trim().replace(/\s+/g,"-");
 const byPath=new Map(list.map(x=>[x.path,x]));const byGroup=new Map();
 for(const d of list){const id=anchor(d.path),grp=id.slice(6,8);if(!byGroup.has(grp))byGroup.set(grp,[]);byGroup.get(grp).push(d);}
 const title=d=>(d.content.match(/^#\s+(.+)$/m)||[])[1]||d.path.split("/").at(-1);
 const nav=[];for(const [g,items] of byGroup){nav.push("## "+g+" — "+(labels[g]||g));for(const d of items)nav.push("- ["+anchor(d.path).replace("parte-","").replace("-", ".")+" — "+title(d)+"](../"+d.path+")");nav.push("");}
 const index="# Índice de leitura — Rondoscópio\n\n> Gerado automaticamente a partir dos arquivos numerados em `parts/`. Não edite este arquivo manualmente.\n\n[Leia também a versão unificada](CONSTITUICAO-COMPLETA.md).\n\n"+nav.join("\n").trimEnd()+"\n";
 const toc=[];for(const [g,items] of byGroup){toc.push("### "+g+" — "+(labels[g]||g));for(const d of items)toc.push("- ["+anchor(d.path).replace("parte-","").replace("-", ".")+" — "+title(d)+"](#"+anchor(d.path)+")");toc.push("");}
 let full="# Constituição do Rondoscópio — edição completa\n\n> Documento gerado automaticamente a partir das partes numeradas. As minutas não equivalem a normas aprovadas nem a serviços operacionais. Para propor mudanças, edite os arquivos correspondentes em `parts/` e execute `just generate`.\n\n## Sumário\n\n"+toc.join("\n").trimEnd()+"\n\n---\n";
 for(const d of list){
  const id=anchor(d.path), number=id.slice(6).replace("-", "."), h=title(d);
  let body=d.content.replace(/^#\s+[^\n]*\r?\n?/,"").trim();
  body=body.replace(/(!?\[[^\]\n]*\]\()([^)]+)(\))/g,(match,start,dest,end)=>{
   if(/^(?:[a-z][a-z0-9+.-]*:|\/\/)/i.test(dest))return match;
   const idx=dest.indexOf("#"),frag=idx<0?"":dest.slice(idx+1),raw=idx<0?dest:dest.slice(0,idx);
   const pathOnly=raw.split("?")[0];
   const path=pathOnly?norm(d.path.split("/").slice(0,-1).join("/")+"/"+pathOnly):d.path;
   if(byPath.has(path))return start+"#"+anchor(path)+end;
   if(!pathOnly)return start+"#"+id+end;
   return start+"../"+path+(frag?"#"+frag:"")+end;
  });
  let inFence=false;let codeMarker="";const lines=[];
  for(const ln of body.split(/\r?\n/)){
   const fm=ln.match(/^\s*(`{3,}|~{3,})/);
   if(fm){const ch=fm[1][0];if(!inFence){inFence=true;codeMarker=ch;}else if(ch===codeMarker)inFence=false;lines.push(ln);continue}
   const mh=!inFence&&ln.match(/^(#{1,6})\s+(.+)$/);
   if(mh){lines.push("#".repeat(Math.min(6,mh[1].length+2))+" "+mh[2]);}else lines.push(ln);
  }
  full+="\n<a id=\""+id+"\"></a>\n\n## "+number+" — "+h+"\n\n*Parte de origem: ["+d.path+"](../"+d.path+")*\n\n"+lines.join("\n").trim()+"\n\n---\n";
 }
 return {index,full:full.trimEnd()+"\n"};
}

const { index, full } = buildOutputs(documents);
let stale = false;
for (const [filename, content] of [["INDICE.md", index], ["CONSTITUICAO-COMPLETA.md", full]]) {
  const target = join(root, "docs", filename);
  if (process.argv.includes("--check")) {
    if (!existsSync(target) || readFileSync(target, "utf8") !== content) {
      console.error("Documento desatualizado: " + filename);
      stale = true;
    }
  } else {
    writeFileSync(target, content, "utf8");
    console.log("Gerado: " + filename);
  }
}
if (stale) process.exitCode = 1;
