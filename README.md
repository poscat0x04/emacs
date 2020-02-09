# Emacs configuration

heavily inspired by condy's config  
uses company for autocomplete

| Language | Major Mode Package | Autocomplete |
|----------|--------------------|--------------|
| Haskell  | haskell-mode       | lsp-haskell  |
| Rust     | rust-mode          | lsp-mode     |
| Agda     | agda2-mode         | nil          |
| Coq      | proof-general      | company-coq  |
| Idris    | idris-mode         | idris-mode   |

## installation

clone into `~/.emacs.d` open emacs and run `M-x all-the-icons-install-font`

## System requirement

- gcc, cmake: used to compile libvterm
- hie/ghcide/haskell-langauage-server: lsp support for Haskell
- stack: build tool for Haskell
- rls: lsp support for Rust
- rust toolchain: build tool for Rust
- coq
- idris: completion for idris
- agda: agda2-mode
