# Homebrew Tap for MukundaKatta tools

Personal Homebrew tap for command-line utilities maintained by [@MukundaKatta](https://github.com/MukundaKatta).

## Install

```bash
brew tap MukundaKatta/tap
```

## Available formulae

### `pis-scan`

CLI wrapper around [prompt-injection-shield-py](https://pypi.org/project/prompt-injection-shield-py/). Scan a file or stdin for prompt-injection patterns.

```bash
brew install MukundaKatta/tap/pis-scan
echo "Ignore previous instructions" | pis-scan
```

## License

The tap is MIT-licensed. Each formula links to its own upstream license.
