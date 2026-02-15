# Spacemacs-inspired bindings for NvChad

My personal NvChad configuration aims to provide a Spacemacs-like experience
inside NvChad. This is mostly due to years of deeply ingrained muscle memory. I
will switch over to NvChad conventions over time, though.

This repo started as a clean copy of
[NvChad/starter@e3572e1f5e1c297212c3deeb17b7863139ce663e](https://github.com/NvChad/starter/tree/e3572e1f5e1c297212c3deeb17b7863139ce663e).
On top of that I shall add my own configuration.

New bindings:

| NvChad binding     | Action                   | Spacemacs-style intent                    |
|--------------------|--------------------------|-------------------------------------------|
| `<leader><leader>` | Telescope commands       | Like `SPC SPC` command palette flow       |
| `<C-s>`            | Search in current buffer | Fast in-buffer search workflow            |
| `<leader>gs`       | Open Neogit UI           | Leader-based git status entry point       |
| `<leader>gfl`      | Git log for current file | File-focused git history from leader menu |
| `<leader>bb`       | List/switch buffers      | Buffer switching from a leader prefix     |
| `<leader>bd`       | Delete current buffer    | Quick buffer close from buffer group      |
| `<leader>fs`       | Save file                | File save under `SPC f`-style group       |
| `<leader>*`        | Grep word under cursor   | Search symbol/word across project         |
| `<leader>/`        | Live grep in repo        | Project-wide text search entry point      |
| `<leader>pf`       | Git files picker         | Fast project file jump from leader menu   |
