# ikanago/docker-alpine-texlive-ja

[![Docker Automated build](https://img.shields.io/docker/automated/paperist/alpine-texlive-ja.svg)](https://github.com/users/ikanago/packages/container/package/docker-texlive)
<!-- [![Docker Image Size](https://images.microbadger.com/badges/image/paperist/alpine-texlive-ja.svg)](https://microbadger.com/images/paperist/alpine-texlive-ja "Get your own image badge on microbadger.com") -->

## Install

```bash
docker pull ikanago/docker-texlive
```

## Usage

```bash
$ docker run --rm -it -v $PWD:/workdir ikanago/docker-texlive
$ latexmk -C main.tex && latexmk main.tex && latexmk -c main.tex
```
