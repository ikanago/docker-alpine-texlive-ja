# ikanago/docker-texlive

The minimal TeXLive Docker image for Japanese

## Supported tags

- [`latest`](./Dockerfile)
  - AMD64, ARM64 supported.

## Install

The image can be installed from GitHub Container Registry.

```bash
docker pull ghcr.io/ikanago/docker-texlive:latest
```

## Usage / 使い方

```bash
$ docker run --rm -it -v $PWD:/workdir paperist/texlive-ja:latest \
    sh -c 'latexmk -C main.tex && latexmk main.tex && latexmk -c main.tex'
```

See [Usage (Japanese)](./docs/usage.md) for details. <br/>
詳しくは、[使い方](./docs/usage.md) を参照してください
