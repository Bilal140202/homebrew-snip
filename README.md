# homebrew-snip

Homebrew tap for [snip](https://github.com/Bilal140202/snip) — project-scoped command snippets with built-in fuzzy finder.

## Install

```bash
brew tap Bilal140202/snip
brew install snip
```

Or, in one step:

```bash
brew install Bilal140202/snip/snip
```

## Upgrade

```bash
brew update
brew upgrade snip
```

## Uninstall

```bash
brew uninstall snip
brew untap Bilal140202/snip
```

## What is snip?

Every project has commands you always forget. *“What’s the deploy command?”* *“How do I seed the database?”* `snip` saves project-scoped command snippets in a committable `.snips` file. Run `snip` to list them, run `snip run <name>` to execute them.

See the [main repo](https://github.com/Bilal140202/snip) for full docs.

## Supported platforms

| OS | Architecture | Supported |
|----|--------------|-----------|
| macOS | Apple Silicon (aarch64) | ✅ |
| macOS | Intel (x86_64) | ✅ |
| Linux | x86_64 | ✅ |
| Linux | aarch64 | ❌ (build from source: `cargo install snipit`) |
| Windows | x86_64 | ❌ (use `cargo install snipit` or download from [releases](https://github.com/Bilal140202/snip/releases)) |

## Formula source

The formula is at [`Formula/snip.rb`](./Formula/snip.rb). It downloads the pre-built binary from the latest GitHub release, so installation is fast (no Rust toolchain needed).

Current formula version: **v0.3.5**

## Issues

Please report issues at the [main repo](https://github.com/Bilal140202/snip/issues), not here.
