const fs = require("fs");
const path = require("path");

const ROOT = process.cwd();
const INDEX = path.join(ROOT, "index.html");

const IGNORE_GLOBAL = new Set([
    ".git",
    ".github",
    "scripts",
    "node_modules",
    ".vscode",
    ".idea",
    "package.json",
    "package-lock.json",
    "README.md",
    "LICENSE",
    ".gitignore",
    ".gitattributes"
]);

const IGNORE_ROOT = new Set([
    "styles.css",
    "tree.js"
]);

function isIgnored(name, isRoot) {
    if (IGNORE_GLOBAL.has(name)) return true;
    if (isRoot && IGNORE_ROOT.has(name)) return true;
    return false;
}

function sortEntries(entries, isRoot) {
    return entries.sort((a, b) => {
        if (isRoot) {
            if (a.name === "index.html") return -1;
            if (b.name === "index.html") return 1;
        }

        if (a.isDirectory() !== b.isDirectory()) {
            return a.isDirectory() ? -1 : 1;
        }

        return a.name.localeCompare(b.name, undefined, { numeric: true, sensitivity: "base" });
    });
}

function walk(dir, relative = "") {
    const isRoot = relative === "";
    const entries = sortEntries(
        fs.readdirSync(dir, { withFileTypes: true })
        .filter(e => !isIgnored(e.name, isRoot)),
        isRoot
    );

    let output = "";

    entries.forEach((entry) => {
        const fullPath = path.join(dir, entry.name);
        const relativePath = path.join(relative, entry.name).replace(/\\/g, "/");

        if (entry.isDirectory()) {
            output += `\n<div class="folder collapsed">`;
            output += `\n  <div class="folder-header" onclick="this.parentElement.classList.toggle('collapsed')">`;
            output += `\n    <span class="arrow">›</span>`;
            output += `\n    <span>${entry.name}</span>`;
            output += `\n  </div>`;
            output += `\n  <div class="children">`;
            output += walk(fullPath, relativePath);
            output += `\n  </div>`;
            output += `\n</div>`;
        } else {
            const ext = path.extname(entry.name).toLowerCase();
            let tagStart = "";
            let tagEnd = "";

            if (ext === ".html" || ext === ".lua") {
                let target = ` target="_blank" rel="noopener noreferrer"`;
                if (relativePath === "index.html") {
                    target = "";
                }
                tagStart = `<a href="${relativePath}" class="file" style="display: block; text-decoration: none; color: #58a6ff;"${target}>`;
                tagEnd = `</a>`;
            } else {
                tagStart = `<span class="file" style="display: block; color: inherit;">`;
                tagEnd = `</span>`;
            }

            output += `\n${tagStart}${entry.name}${tagEnd}`;
        }
    });

    return output;
}

const treeHTML = walk(ROOT);

let html = fs.readFileSync(INDEX, "utf8");

const START = "<!-- TREE:START -->";
const END = "<!-- TREE:END -->";

const regex = new RegExp(`${START}[\\s\\S]*?${END}`, "m");
const replacement = `${START}\n${treeHTML}\n${END}`;

if (!regex.test(html)) {
    console.error("\nERROR: Không tìm thấy <!-- TREE:START --> và <!-- TREE:END --> trong index.html\n");
    process.exit(1);
}

html = html.replace(regex, replacement);
fs.writeFileSync(INDEX, html, "utf8");

console.log("\n✔ index.html updated successfully with HTML tree.\n");
