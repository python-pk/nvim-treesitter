local api = vim.api
local ts = vim.treesitter

for ft, lang in pairs {
  automake = "make",
  javascriptreact = "javascript",
  ecma = "javascript",
  jsx = "javascript",
  gyp = "python",
  html_tags = "html",
  ["typescript.tsx"] = "tsx",
  dosini = "ini",
  confini = "ini",
  svg = "xml",
  xsd = "xml",
  xslt = "xml",
  expect = "tcl",
  mysql = "sql",
  sbt = "scala",

  --- short-hand list from https://github.com/helix-editor/helix/blob/master/languages.toml
  rs = "rust",

  js = "javascript",
  ts = "typescript",

  hs = "haskell",
  py = "python",

} do
  ts.language.register(lang, ft)
end

---@class InstallInfo
---@field url string
---@field branch string|nil
---@field revision string|nil
---@field files string[]
---@field generate_requires_npm boolean|nil
---@field requires_generate_from_grammar boolean|nil
---@field location string|nil
---@field use_makefile boolean|nil
---@field cxx_standard string|nil

---@class ParserInfo
---@field install_info InstallInfo
---@field filetype string
---@field maintainers string[]
---@field experimental boolean|nil
---@field readme_name string|nil

---@type ParserInfo[]
local list = setmetatable({}, {
  __newindex = function(table, parsername, parserconfig)
    rawset(table, parsername, parserconfig)
    if parserconfig.filetype or vim.fn.has "nvim-0.11" == 0 then
      ts.language.register(parsername, parserconfig.filetype or parsername)
    end
  end,
})

list.asm = {
  install_info = {
    url = "https://github.com/RubixDev/tree-sitter-asm",
    files = { "src/parser.c" },
  },
  maintainers = { "@RubixDev" },
}

list.bash = {
  install_info = {
    url = "https://github.com/tree-sitter/tree-sitter-bash",
    files = { "src/parser.c", "src/scanner.c" },
  },
  filetype = "sh",
  maintainers = { "@TravonteD" },
}


list.c = {
  install_info = {
    url = "https://github.com/tree-sitter/tree-sitter-c",
    files = { "src/parser.c" },
  },
  maintainers = { "@amaanq" },
}

list.clojure = {
  install_info = {
    url = "https://github.com/sogaiu/tree-sitter-clojure",
    files = { "src/parser.c" },
  },
  maintainers = { "@NoahTheDuke" },
}

list.cmake = {
  install_info = {
    url = "https://github.com/uyha/tree-sitter-cmake",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@uyha" },
}

list.comment = {
  install_info = {
    url = "https://github.com/stsewd/tree-sitter-comment",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@stsewd" },
}

list.commonlisp = {
  install_info = {
    url = "https://github.com/theHamsta/tree-sitter-commonlisp",
    files = { "src/parser.c" },
    generate_requires_npm = true,
  },
  filetype = "lisp",
  maintainers = { "@theHamsta" },
}

list.cpp = {
  install_info = {
    url = "https://github.com/tree-sitter/tree-sitter-cpp",
    files = { "src/parser.c", "src/scanner.c" },
    generate_requires_npm = true,
  },
  maintainers = { "@theHamsta" },
}

list.css = {
  install_info = {
    url = "https://github.com/tree-sitter/tree-sitter-css",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@TravonteD" },
}

list.csv = {
  install_info = {
    url = "https://github.com/amaanq/tree-sitter-csv",
    files = { "src/parser.c" },
    location = "csv",
  },
  maintainers = { "@amaanq" },
}

list.d = {
  install_info = {
    url = "https://github.com/gdamore/tree-sitter-d",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@amaanq" },
}

list.diff = {
  install_info = {
    url = "https://github.com/the-mikedavis/tree-sitter-diff",
    files = { "src/parser.c" },
  },
  filetype = "gitdiff",
  maintainers = { "@gbprod" },
}

list.disassembly = {
  install_info = {
    url = "https://github.com/ColinKennedy/tree-sitter-disassembly",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@ColinKennedy" },
}

list.dockerfile = {
  install_info = {
    url = "https://github.com/camdencheek/tree-sitter-dockerfile",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@camdencheek" },
}

list.dot = {
  install_info = {
    url = "https://github.com/rydesun/tree-sitter-dot",
    files = { "src/parser.c" },
  },
  maintainers = { "@rydesun" },
}

list.doxygen = {
  install_info = {
    url = "https://github.com/amaanq/tree-sitter-doxygen",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@amaanq" },
}

list.dtd = {
  install_info = {
    url = "https://github.com/tree-sitter-grammars/tree-sitter-xml",
    files = { "src/parser.c", "src/scanner.c" },
    location = "dtd",
  },
  maintainers = { "@ObserverOfTime" },
}

list.ebnf = {
  install_info = {
    url = "https://github.com/RubixDev/ebnf",
    files = { "src/parser.c" },
    location = "crates/tree-sitter-ebnf",
  },
  maintainers = { "@RubixDev" },
  experimental = true,
}

list.editorconfig = {
  install_info = {
    url = "https://github.com/ValdezFOmar/tree-sitter-editorconfig",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@ValdezFOmar" },
}

list.fsharp = {
  install_info = {
    url = "https://github.com/ionide/tree-sitter-fsharp",
    files = { "src/parser.c", "src/scanner.c" },
    location = "fsharp",
  },
  maintainers = { "@nsidorenco" },
}

list.func = {
  install_info = {
    url = "https://github.com/amaanq/tree-sitter-func",
    files = { "src/parser.c" },
  },
  maintainers = { "@amaanq" },
}

list.git_rebase = {
  install_info = {
    url = "https://github.com/the-mikedavis/tree-sitter-git-rebase",
    files = { "src/parser.c" },
  },
  filetype = "gitrebase",
  maintainers = { "@gbprod" },
}

list.gitattributes = {
  install_info = {
    url = "https://github.com/ObserverOfTime/tree-sitter-gitattributes",
    files = { "src/parser.c" },
  },
  maintainers = { "@ObserverOfTime" },
}

list.gitcommit = {
  install_info = {
    url = "https://github.com/gbprod/tree-sitter-gitcommit",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@gbprod" },
}

list.git_config = {
  install_info = {
    url = "https://github.com/the-mikedavis/tree-sitter-git-config",
    files = { "src/parser.c" },
  },
  filetype = "gitconfig",
  maintainers = { "@amaanq" },
  readme_name = "git_config",
}

list.gitignore = {
  install_info = {
    url = "https://github.com/shunsambongi/tree-sitter-gitignore",
    files = { "src/parser.c" },
  },
  maintainers = { "@theHamsta" },
}

list.gleam = {
  install_info = {
    url = "https://github.com/gleam-lang/tree-sitter-gleam",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@amaanq" },
}


list.haskell = {
  install_info = {
    url = "https://github.com/tree-sitter/tree-sitter-haskell",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@mrcjkb" },
}

list.haskell_persistent = {
  install_info = {
    url = "https://github.com/MercuryTechnologies/tree-sitter-haskell-persistent",
    files = { "src/parser.c", "src/scanner.c" },
  },
  filetype = "haskellpersistent",
  maintainers = { "@lykahb" },
}

list.html = {
  install_info = {
    url = "https://github.com/tree-sitter/tree-sitter-html",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@TravonteD" },
}

list.htmldjango = {
  install_info = {
    url = "https://github.com/interdependence/tree-sitter-htmldjango",
    files = { "src/parser.c" },
  },
  maintainers = { "@ObserverOfTime" },
  experimental = true,
}

list.http = {
  install_info = {
    url = "https://github.com/rest-nvim/tree-sitter-http",
    files = { "src/parser.c" },
  },
  maintainers = { "@amaanq", "@NTBBloodbath" },
}


list.javascript = {
  install_info = {
    url = "https://github.com/tree-sitter/tree-sitter-javascript",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@steelsojka" },
}


list.json = {
  install_info = {
    url = "https://github.com/tree-sitter/tree-sitter-json",
    files = { "src/parser.c" },
  },
  maintainers = { "@steelsojka" },
}

list.julia = {
  install_info = {
    url = "https://github.com/tree-sitter/tree-sitter-julia",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@fredrikekre" },
}


list.llvm = {
  install_info = {
    url = "https://github.com/benwilliamgraham/tree-sitter-llvm",
    files = { "src/parser.c" },
  },
  maintainers = { "@benwilliamgraham" },
}

list.lua = {
  install_info = {
    url = "https://github.com/MunifTanjim/tree-sitter-lua",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@muniftanjim" },
}

list.luadoc = {
  install_info = {
    url = "https://github.com/amaanq/tree-sitter-luadoc",
    files = { "src/parser.c" },
  },
  maintainers = { "@amaanq" },
}

list.luap = {
  install_info = {
    url = "https://github.com/amaanq/tree-sitter-luap",
    files = { "src/parser.c" },
  },
  maintainers = { "@amaanq" },
  readme_name = "lua patterns",
}

list.luau = {
  install_info = {
    url = "https://github.com/amaanq/tree-sitter-luau",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@amaanq" },
}

list.make = {
  install_info = {
    url = "https://github.com/alemuller/tree-sitter-make",
    files = { "src/parser.c" },
  },
  maintainers = { "@lewis6991" },
}

list.markdown = {
  install_info = {
    url = "https://github.com/MDeiml/tree-sitter-markdown",
    location = "tree-sitter-markdown",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@MDeiml" },
  readme_name = "markdown (basic highlighting)",
  experimental = true,
}

list.markdown_inline = {
  install_info = {
    url = "https://github.com/MDeiml/tree-sitter-markdown",
    location = "tree-sitter-markdown-inline",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@MDeiml" },
  readme_name = "markdown_inline (needed for full highlighting)",
  experimental = true,
}

list.menhir = {
  install_info = {
    url = "https://github.com/Kerl13/tree-sitter-menhir",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@Kerl13" },
}

list.mermaid = {
  install_info = {
    url = "https://github.com/monaqa/tree-sitter-mermaid",
    files = { "src/parser.c" },
  },
  experimental = true,
}


list.nasm = {
  install_info = {
    url = "https://github.com/naclsn/tree-sitter-nasm",
    files = { "src/parser.c" },
  },
  maintainers = { "@ObserverOfTime" },
}

list.nginx = {
  install_info = {
    url = "https://github.com/opa-oz/tree-sitter-nginx",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@opa-oz" },
}

list.nickel = {
  install_info = {
    url = "https://github.com/nickel-lang/tree-sitter-nickel",
    files = { "src/parser.c", "src/scanner.c" },
  },
}

list.nim = {
  install_info = {
    url = "https://github.com/alaviss/tree-sitter-nim",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@aMOPel" },
}

list.nim_format_string = {
  install_info = {
    url = "https://github.com/aMOPel/tree-sitter-nim-format-string",
    files = { "src/parser.c" },
  },
  maintainers = { "@aMOPel" },
}

list.ninja = {
  install_info = {
    url = "https://github.com/alemuller/tree-sitter-ninja",
    files = { "src/parser.c" },
  },
  maintainers = { "@alemuller" },
}

list.nix = {
  install_info = {
    url = "https://github.com/cstrahan/tree-sitter-nix",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@leo60228" },
}

list.norg = {
  install_info = {
    url = "https://github.com/nvim-neorg/tree-sitter-norg",
    files = { "src/parser.c", "src/scanner.cc" },
    cxx_standard = "c++14",
    use_makefile = true,
  },
  maintainers = { "@JoeyGrajciar", "@vhyrro" },
}

list.nqc = {
  install_info = {
    url = "https://github.com/amaanq/tree-sitter-nqc",
    files = { "src/parser.c" },
  },
  maintainers = { "@amaanq" },
}

list.nu = {
  install_info = {
    url = "https://github.com/nushell/tree-sitter-nu",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@abhisheksingh0x558" },
}

list.objc = {
  install_info = {
    url = "https://github.com/amaanq/tree-sitter-objc",
    files = { "src/parser.c" },
  },
  maintainers = { "@amaanq" },
}

list.objdump = {
  install_info = {
    url = "https://github.com/ColinKennedy/tree-sitter-objdump",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@ColinKennedy" },
}

list.ocaml = {
  install_info = {
    url = "https://github.com/tree-sitter/tree-sitter-ocaml",
    files = { "src/parser.c", "src/scanner.c" },
    location = "grammars/ocaml",
  },
  maintainers = { "@undu" },
}

list.ocaml_interface = {
  install_info = {
    url = "https://github.com/tree-sitter/tree-sitter-ocaml",
    files = { "src/parser.c", "src/scanner.c" },
    location = "grammars/interface",
  },
  filetype = "ocamlinterface",
  maintainers = { "@undu" },
}

list.ocamllex = {
  install_info = {
    url = "https://github.com/atom-ocaml/tree-sitter-ocamllex",
    files = { "src/parser.c", "src/scanner.c" },
    requires_generate_from_grammar = true,
  },
  maintainers = { "@undu" },
}

list.odin = {
  install_info = {
    url = "https://github.com/amaanq/tree-sitter-odin",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@amaanq" },
}

list.pascal = {
  install_info = {
    url = "https://github.com/Isopod/tree-sitter-pascal",
    files = { "src/parser.c" },
  },
  maintainers = { "@Isopod" },
}

list.passwd = {
  install_info = {
    url = "https://github.com/ath3/tree-sitter-passwd",
    files = { "src/parser.c" },
  },
  maintainers = { "@amaanq" },
}

list.pem = {
  install_info = {
    url = "https://github.com/ObserverOfTime/tree-sitter-pem",
    files = { "src/parser.c" },
  },
  maintainers = { "@ObserverOfTime" },
}

list.perl = {
  install_info = {
    url = "https://github.com/tree-sitter-perl/tree-sitter-perl",
    files = { "src/parser.c", "src/scanner.c" },
    branch = "release",
  },
  maintainers = { "@RabbiVeesh", "@LeoNerd" },
}

list.php = {
  install_info = {
    url = "https://github.com/tree-sitter/tree-sitter-php",
    location = "php",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@tk-shirasaka", "@calebdw" },
}

list.php_only = {
  install_info = {
    url = "https://github.com/tree-sitter/tree-sitter-php",
    location = "php_only",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@tk-shirasaka", "@calebdw" },
}

-- Parsers for injections
list.phpdoc = {
  install_info = {
    url = "https://github.com/claytonrcarter/tree-sitter-phpdoc",
    files = { "src/parser.c", "src/scanner.c" },
    generate_requires_npm = true,
  },
  maintainers = { "@mikehaertl" },
  experimental = true,
}

list.pioasm = {
  install_info = {
    url = "https://github.com/leo60228/tree-sitter-pioasm",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@leo60228" },
}

list.po = {
  install_info = {
    url = "https://github.com/erasin/tree-sitter-po",
    files = { "src/parser.c" },
  },
  maintainers = { "@amaanq" },
}

list.pod = {
  install_info = {
    url = "https://github.com/tree-sitter-perl/tree-sitter-pod",
    files = { "src/parser.c", "src/scanner.c" },
    branch = "release",
  },
  maintainers = { "@RabbiVeesh", "@LeoNerd" },
}

list.poe_filter = {
  install_info = {
    url = "https://github.com/ObserverOfTime/tree-sitter-poe-filter",
    files = { "src/parser.c" },
  },
  filetype = "poefilter",
  maintainers = { "@ObserverOfTime" },
  readme_name = "Path of Exile item filter",
  experimental = true,
}

list.pony = {
  install_info = {
    url = "https://github.com/amaanq/tree-sitter-pony",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@amaanq", "@mfelsche" },
}

list.powershell = {
  install_info = {
    url = "https://github.com/airbus-cert/tree-sitter-powershell",
    files = { "src/parser.c", "src/scanner.c" },
  },
  filetype = "ps1",
  maintainers = { "@L2jLiga" },
}

list.printf = {
  install_info = {
    url = "https://github.com/ObserverOfTime/tree-sitter-printf",
    files = { "src/parser.c" },
  },
  maintainers = { "@ObserverOfTime" },
}

list.prisma = {
  install_info = {
    url = "https://github.com/victorhqc/tree-sitter-prisma",
    files = { "src/parser.c" },
  },
  maintainers = { "@elianiva" },
}

list.problog = {
  install_info = {
    url = "https://github.com/foxyseta/tree-sitter-prolog",
    files = { "src/parser.c" },
    location = "grammars/problog",
  },
  maintainers = { "@foxyseta" },
}

list.prolog = {
  install_info = {
    url = "https://github.com/foxyseta/tree-sitter-prolog",
    files = { "src/parser.c" },
    location = "grammars/prolog",
  },
  maintainers = { "@foxyseta" },
}

list.promql = {
  install_info = {
    url = "https://github.com/MichaHoffmann/tree-sitter-promql",
    files = { "src/parser.c" },
    experimental = true,
  },
  maintainers = { "@MichaHoffmann" },
}

list.properties = {
  install_info = {
    url = "https://github.com/tree-sitter-grammars/tree-sitter-properties",
    files = { "src/parser.c", "src/scanner.c" },
  },
  filetype = "jproperties",
  maintainers = { "@ObserverOfTime" },
}

list.proto = {
  install_info = {
    url = "https://github.com/treywood/tree-sitter-proto",
    files = { "src/parser.c" },
  },
  maintainers = { "@treywood" },
}

list.prql = {
  install_info = {
    url = "https://github.com/PRQL/tree-sitter-prql",
    files = { "src/parser.c" },
  },
  maintainers = { "@matthias-Q" },
}

list.psv = {
  install_info = {
    url = "https://github.com/amaanq/tree-sitter-csv",
    files = { "src/parser.c" },
    location = "psv",
  },
  maintainers = { "@amaanq" },
}

list.pug = {
  install_info = {
    url = "https://github.com/zealot128/tree-sitter-pug",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@zealot128" },
  experimental = true,
}

list.puppet = {
  install_info = {
    url = "https://github.com/amaanq/tree-sitter-puppet",
    files = { "src/parser.c" },
  },
  maintainers = { "@amaanq" },
}

list.purescript = {
  install_info = {
    url = "https://github.com/postsolar/tree-sitter-purescript",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@postsolar" },
}

list.pymanifest = {
  install_info = {
    url = "https://github.com/ObserverOfTime/tree-sitter-pymanifest",
    files = { "src/parser.c" },
  },
  maintainers = { "@ObserverOfTime" },
  readme_name = "PyPA manifest",
}

list.python = {
  install_info = {
    url = "https://github.com/tree-sitter/tree-sitter-python",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@stsewd", "@theHamsta" },
}

list.ql = {
  install_info = {
    url = "https://github.com/tree-sitter/tree-sitter-ql",
    files = { "src/parser.c" },
  },
  maintainers = { "@pwntester" },
}

list.qmldir = {
  install_info = {
    url = "https://github.com/Decodetalkers/tree-sitter-qmldir",
    files = { "src/parser.c" },
  },
  maintainers = { "@amaanq" },
}

list.qmljs = {
  install_info = {
    url = "https://github.com/yuja/tree-sitter-qmljs",
    files = { "src/parser.c", "src/scanner.c" },
  },
  filetype = "qml",
  maintainers = { "@Decodetalkers" },
}

list.query = {
  install_info = {
    url = "https://github.com/nvim-treesitter/tree-sitter-query",
    files = { "src/parser.c" },
  },
  maintainers = { "@steelsojka" },
  readme_name = "Tree-Sitter query language",
}

list.r = {
  install_info = {
    url = "https://github.com/r-lib/tree-sitter-r",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@ribru17" },
}

list.racket = {
  install_info = {
    url = "https://github.com/6cdh/tree-sitter-racket",
    files = { "src/parser.c", "src/scanner.c" },
  },
}

list.ralph = {
  install_info = {
    url = "https://github.com/alephium/tree-sitter-ralph",
    files = { "src/parser.c" },
  },
  maintainers = { "@tdroxler" },
}

list.rasi = {
  install_info = {
    url = "https://github.com/Fymyte/tree-sitter-rasi",
    files = { "src/parser.c" },
  },
  maintainers = { "@Fymyte" },
}

list.razor = {
  install_info = {
    url = "https://github.com/tris203/tree-sitter-razor",
    files = { "src/parser.c", "src/scanner.c" },
    generate_requires_npm = true,
  },
  maintainers = { "@tris203" },
}

list.rbs = {
  install_info = {
    url = "https://github.com/joker1007/tree-sitter-rbs",
    files = { "src/parser.c" },
  },
  maintainers = { "@joker1007" },
}

list.re2c = {
  install_info = {
    url = "https://github.com/amaanq/tree-sitter-re2c",
    files = { "src/parser.c" },
  },
  maintainers = { "@amaanq" },
}

list.readline = {
  install_info = {
    url = "https://github.com/ribru17/tree-sitter-readline",
    files = { "src/parser.c" },
  },
  maintainers = { "@ribru17" },
}

list.regex = {
  install_info = {
    url = "https://github.com/tree-sitter/tree-sitter-regex",
    files = { "src/parser.c" },
  },
  maintainers = { "@theHamsta" },
}

list.rego = {
  install_info = {
    url = "https://github.com/FallenAngel97/tree-sitter-rego",
    files = { "src/parser.c" },
  },
  maintainers = { "@FallenAngel97" },
}

list.requirements = {
  install_info = {
    url = "https://github.com/ObserverOfTime/tree-sitter-requirements",
    files = { "src/parser.c" },
  },
  maintainers = { "@ObserverOfTime" },
  readme_name = "pip requirements",
}

list.rescript = {
  install_info = {
    url = "https://github.com/rescript-lang/tree-sitter-rescript",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@ribru17" },
}

list.rnoweb = {
  install_info = {
    url = "https://github.com/bamonroe/tree-sitter-rnoweb",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@bamonroe" },
}

list.robot = {
  install_info = {
    url = "https://github.com/Hubro/tree-sitter-robot",
    files = { "src/parser.c" },
  },
  maintainers = { "@Hubro" },
}

list.robots = {
  install_info = {
    url = "https://github.com/opa-oz/tree-sitter-robots-txt",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@opa-oz" },
}

list.roc = {
  install_info = {
    url = "https://github.com/faldor20/tree-sitter-roc",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@nat-418" },
}

list.ron = {
  install_info = {
    url = "https://github.com/amaanq/tree-sitter-ron",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@amaanq" },
}

list.rst = {
  install_info = {
    url = "https://github.com/stsewd/tree-sitter-rst",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@stsewd" },
}

list.ruby = {
  install_info = {
    url = "https://github.com/tree-sitter/tree-sitter-ruby",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@TravonteD" },
}

list.runescript = {
  install_info = {
    url = "https://github.com/2004Scape/tree-sitter-runescript",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@2004Scape" },
}

list.rust = {
  install_info = {
    url = "https://github.com/tree-sitter/tree-sitter-rust",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@amaanq" },
}

list.scala = {
  install_info = {
    url = "https://github.com/tree-sitter/tree-sitter-scala",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@stevanmilic" },
}

list.scfg = {
  install_info = {
    url = "https://github.com/rockorager/tree-sitter-scfg",
    files = { "src/parser.c" },
    requires_generate_from_grammar = true,
  },
  maintainers = { "@WhyNotHugo" },
}

list.scheme = {
  install_info = {
    url = "https://github.com/6cdh/tree-sitter-scheme",
    files = { "src/parser.c" },
  },
}

list.scss = {
  install_info = {
    url = "https://github.com/serenadeai/tree-sitter-scss",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@elianiva" },
}

list.sflog = {
  install_info = {
    url = "https://github.com/aheber/tree-sitter-sfapex",
    files = { "src/parser.c" },
    location = "sflog",
  },
  maintainers = { "@aheber", "@xixiaofinland" },
}

list.slang = {
  install_info = {
    url = "https://github.com/theHamsta/tree-sitter-slang",
    files = { "src/parser.c", "src/scanner.c" },
    generate_requires_npm = true,
  },
  filetype = "shaderslang",
  maintainers = { "@theHamsta" },
  experimental = true,
}

list.slim = {
  install_info = {
    url = "https://github.com/theoo/tree-sitter-slim",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@theoo" },
}

list.slint = {
  install_info = {
    url = "https://github.com/slint-ui/tree-sitter-slint",
    files = { "src/parser.c" },
  },
  maintainers = { "@hunger" },
}

list.smali = {
  install_info = {
    url = "https://github.com/tree-sitter-grammars/tree-sitter-smali",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@amaanq" },
}

list.snakemake = {
  install_info = {
    url = "https://github.com/osthomas/tree-sitter-snakemake",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainer = { "@osthomas" },
  experimental = true,
}

list.smithy = {
  install_info = {
    url = "https://github.com/indoorvivants/tree-sitter-smithy",
    files = { "src/parser.c" },
  },
  maintainers = { "@amaanq", "@keynmol" },
}

list.solidity = {
  install_info = {
    url = "https://github.com/JoranHonig/tree-sitter-solidity",
    files = { "src/parser.c" },
  },
  maintainers = { "@amaanq" },
}

list.soql = {
  install_info = {
    url = "https://github.com/aheber/tree-sitter-sfapex",
    files = { "src/parser.c" },
    location = "soql",
  },
  maintainers = { "@aheber", "@xixiaofinland" },
}

list.sosl = {
  install_info = {
    url = "https://github.com/aheber/tree-sitter-sfapex",
    files = { "src/parser.c" },
    location = "sosl",
  },
  maintainers = { "@aheber", "@xixiaofinland" },
}

list.sourcepawn = {
  install_info = {
    url = "https://github.com/nilshelmig/tree-sitter-sourcepawn",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@Sarrus1" },
  tier = 3,
}

list.sparql = {
  install_info = {
    url = "https://github.com/GordianDziwis/tree-sitter-sparql",
    files = { "src/parser.c" },
  },
  maintainers = { "@GordianDziwis" },
}

list.sql = {
  install_info = {
    url = "https://github.com/derekstride/tree-sitter-sql",
    files = { "src/parser.c", "src/scanner.c" },
    branch = "gh-pages",
  },
  maintainers = { "@derekstride" },
}

list.squirrel = {
  install_info = {
    url = "https://github.com/amaanq/tree-sitter-squirrel",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@amaanq" },
}

list.ssh_config = {
  install_info = {
    url = "https://github.com/ObserverOfTime/tree-sitter-ssh-config",
    files = { "src/parser.c" },
  },
  filetype = "sshconfig",
  maintainers = { "@ObserverOfTime" },
}

list.starlark = {
  install_info = {
    url = "https://github.com/amaanq/tree-sitter-starlark",
    files = { "src/parser.c", "src/scanner.c" },
  },
  filetype = "bzl",
  maintainers = { "@amaanq" },
}

list.strace = {
  install_info = {
    url = "https://github.com/sigmaSd/tree-sitter-strace",
    files = { "src/parser.c" },
  },
  maintainers = { "@amaanq" },
}

list.styled = {
  install_info = {
    url = "https://github.com/mskelton/tree-sitter-styled",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@mskelton" },
}

list.supercollider = {
  install_info = {
    url = "https://github.com/madskjeldgaard/tree-sitter-supercollider",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@madskjeldgaard" },
}

list.superhtml = {
  install_info = {
    url = "https://github.com/kristoff-it/superhtml",
    files = {
      "src/parser.c",
      "src/scanner.c",
    },
    location = "tree-sitter-superhtml",
  },
  maintainers = { "@rockorager" },
}

list.surface = {
  install_info = {
    url = "https://github.com/connorlay/tree-sitter-surface",
    files = { "src/parser.c" },
  },
  filetype = "sface",
  maintainers = { "@connorlay" },
}

list.svelte = {
  install_info = {
    url = "https://github.com/tree-sitter-grammars/tree-sitter-svelte",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@amaanq" },
}

list.sway = {
  install_info = {
    url = "https://github.com/FuelLabs/tree-sitter-sway.git",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@ribru17" },
}

list.swift = {
  install_info = {
    url = "https://github.com/alex-pinkus/tree-sitter-swift",
    files = { "src/parser.c", "src/scanner.c" },
    requires_generate_from_grammar = true,
  },
  maintainers = { "@alex-pinkus" },
}

list.sxhkdrc = {
  install_info = {
    url = "https://github.com/RaafatTurki/tree-sitter-sxhkdrc",
    files = { "src/parser.c" },
  },
  maintainers = { "@RaafatTurki" },
}

list.systemtap = {
  install_info = {
    url = "https://github.com/ok-ryoko/tree-sitter-systemtap",
    files = { "src/parser.c" },
  },
  maintainers = { "@ok-ryoko" },
}

list.t32 = {
  install_info = {
    url = "https://gitlab.com/xasc/tree-sitter-t32.git",
    files = { "src/parser.c", "src/scanner.c" },
  },
  filetype = "trace32",
  maintainers = { "@xasc" },
}

list.tablegen = {
  install_info = {
    url = "https://github.com/amaanq/tree-sitter-tablegen",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@amaanq" },
}

list.tact = {
  install_info = {
    url = "https://github.com/tact-lang/tree-sitter-tact",
    files = { "src/parser.c" },
  },
  maintainers = { "@novusnota" },
}

list.teal = {
  install_info = {
    url = "https://github.com/euclidianAce/tree-sitter-teal",
    files = { "src/parser.c", "src/scanner.c" },
    requires_generate_from_grammar = true,
  },
  maintainers = { "@euclidianAce" },
}

list.tcl = {
  install_info = {
    url = "https://github.com/tree-sitter-grammars/tree-sitter-tcl",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@lewis6991" },
}

list.tera = {
  install_info = {
    url = "https://github.com/uncenter/tree-sitter-tera",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@uncenter" },
}

list.terraform = {
  install_info = {
    url = "https://github.com/MichaHoffmann/tree-sitter-hcl",
    files = { "src/parser.c", "src/scanner.c" },
    location = "dialects/terraform",
  },
  maintainers = { "@MichaHoffmann" },
}

list.textproto = {
  install_info = {
    url = "https://github.com/PorterAtGoogle/tree-sitter-textproto",
    files = { "src/parser.c" },
  },
  filetype = "pbtxt",
  maintainers = { "@Porter" },
}

list.thrift = {
  install_info = {
    url = "https://github.com/duskmoon314/tree-sitter-thrift",
    files = { "src/parser.c" },
  },
  maintainers = { "@amaanq", "@duskmoon314" },
}

list.tiger = {
  install_info = {
    url = "https://github.com/ambroisie/tree-sitter-tiger",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@ambroisie" },
}


list.todotxt = {
  install_info = {
    url = "https://github.com/arnarg/tree-sitter-todotxt",
    files = { "src/parser.c" },
  },
  maintainers = { "@arnarg" },
  experimental = true,
}

list.toml = {
  install_info = {
    url = "https://github.com/tree-sitter-grammars/tree-sitter-toml",
    files = { "src/parser.c", "src/scanner.c" },
    generate_requires_npm = true,
  },
  maintainers = { "@tk-shirasaka" },
}

list.tsv = {
  install_info = {
    url = "https://github.com/amaanq/tree-sitter-csv",
    files = { "src/parser.c" },
    location = "tsv",
  },
  maintainers = { "@amaanq" },
}

list.tsx = {
  install_info = {
    url = "https://github.com/tree-sitter/tree-sitter-typescript",
    files = { "src/parser.c", "src/scanner.c" },
    location = "tsx",
    generate_requires_npm = true,
  },
  filetype = "typescriptreact",
  maintainers = { "@steelsojka" },
}

list.typescript = {
  install_info = {
    url = "https://github.com/tree-sitter/tree-sitter-typescript",
    files = { "src/parser.c", "src/scanner.c" },
    location = "typescript",
    generate_requires_npm = true,
  },
  maintainers = { "@steelsojka" },
}

list.vim = {
  install_info = {
    url = "https://github.com/neovim/tree-sitter-vim",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@clason" },
}

list.vimdoc = {
  install_info = {
    url = "https://github.com/neovim/tree-sitter-vimdoc",
    files = { "src/parser.c" },
  },
  filetype = "help",
  maintainers = { "@clason" },
}

list.xml = {
  install_info = {
    url = "https://github.com/tree-sitter-grammars/tree-sitter-xml",
    files = { "src/parser.c", "src/scanner.c" },
    location = "xml",
  },
  maintainers = { "@ObserverOfTime" },
}


list.yaml = {
  install_info = {
    url = "https://github.com/tree-sitter-grammars/tree-sitter-yaml",
    files = { "src/parser.c", "src/scanner.c" },
  },
  maintainers = { "@amaanq" },
}

local M = {
  list = list,
}

function M.ft_to_lang(ft)
  local result = ts.language.get_lang(ft)
  if result then
    return result
  else
    ft = vim.split(ft, ".", { plain = true })[1]
    return ts.language.get_lang(ft) or ft
  end
end

-- Get a list of all available parsers
---@return string[]
function M.available_parsers()
  local parsers = vim.tbl_keys(M.list)
  table.sort(parsers)
  if vim.fn.executable "tree-sitter" == 1 and vim.fn.executable "node" == 1 then
    return parsers
  else
    return vim.tbl_filter(function(p) ---@param p string
      return not M.list[p].install_info.requires_generate_from_grammar
    end, parsers)
  end
end

function M.get_parser_configs()
  return M.list
end

local parser_files

function M.reset_cache()
  parser_files = setmetatable({}, {
    __index = function(tbl, key)
      rawset(tbl, key, api.nvim_get_runtime_file("parser/" .. key .. ".*", false))
      return rawget(tbl, key)
    end,
  })
end

M.reset_cache()

function M.has_parser(lang)
  lang = lang or M.get_buf_lang(api.nvim_get_current_buf())

  if not lang or #lang == 0 then
    return false
  end
  -- HACK: nvim internal API
  if vim._ts_has_language(lang) then
    return true
  end
  return #parser_files[lang] > 0
end

function M.get_parser(bufnr, lang)
  bufnr = bufnr or api.nvim_get_current_buf()
  lang = lang or M.get_buf_lang(bufnr)

  if M.has_parser(lang) then
    return ts.get_parser(bufnr, lang)
  end
end

-- @deprecated This is only kept for legacy purposes.
--             All root nodes should be accounted for.
function M.get_tree_root(bufnr)
  bufnr = bufnr or api.nvim_get_current_buf()
  return M.get_parser(bufnr):parse()[1]:root()
end

-- Gets the language of a given buffer
---@param bufnr number? or current buffer
---@return string
function M.get_buf_lang(bufnr)
  bufnr = bufnr or api.nvim_get_current_buf()
  return M.ft_to_lang(api.nvim_buf_get_option(bufnr, "ft"))
end

return M
