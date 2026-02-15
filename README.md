# Spacemacs-inspired bindings for NvChad

My personal NvChad configuration aims to provide a Spacemacs-like experience
inside NvChad. This is mostly due to years of deeply ingrained muscle memory. I
will switch over to NvChad conventions over time, though.

This repo started as a clean copy of
[NvChad/starter@e3572e1f5e1c297212c3deeb17b7863139ce663e](https://github.com/NvChad/starter/tree/e3572e1f5e1c297212c3deeb17b7863139ce663e).
On top of that I shall add my own configuration.

## Deploy

```bash
git clone https://github.com/henriquenj/NvChadConfig ~/.config/nvim && nvim
```

## New bindings:

| NvChad binding     | Action                   | Spacemacs-style intent                    |
|--------------------|--------------------------|-------------------------------------------|
| `<leader><leader>` | Telescope commands       | Like `SPC SPC` command palette flow       |
| `<C-s>`            | Search in current buffer | Fast in-buffer search workflow            |
| `<C-a>`            | Move to line start       | Emacs-style Home in n/v/i/c modes         |
| `<C-e>`            | Move to line end         | Emacs-style End in n/v/i/c modes          |
| `<leader>gs`       | Open Neogit UI           | Leader-based git status entry point       |
| `<leader>gfl`      | Git log for current file | File-focused git history from leader menu |
| `<leader>bb`       | List/switch buffers      | Buffer switching from a leader prefix     |
| `<leader>bd`       | Delete current buffer    | Quick buffer close from buffer group      |
| `<leader>fs`       | Save file                | File save under `SPC f`-style group       |
| `<leader>w<Tab>`   | Switch to previous window| Alternate between two windows             |
| `<leader>w=`       | Balance windows          | Quickly normalize split sizes             |
| `<leader>w_`       | Maximize window width    | Focus current split horizontally          |
| `<leader>wd`       | Delete window            | Close active split                        |
| `<leader>wh/j/k/l` | Move across windows      | Directional split navigation              |
| `<leader>wm`       | Toggle window maximize   | Maximize and restore current split        |
| `<C-x>1`           | Close other windows      | Emacs-style single-window layout          |
| `<C-x>2`           | Split window below       | Emacs-style horizontal split              |
| `<C-x>3`           | Split window right       | Emacs-style vertical split                |
| `<leader>*`        | Grep word under cursor   | Search symbol/word across project         |
| `<leader>/`        | Live grep in repo        | Project-wide text search entry point      |
| `<leader>pf`       | Git files picker         | Fast project file jump from leader menu   |
