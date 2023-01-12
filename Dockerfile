FROM mcr.microsoft.com/vscode/devcontainers/base:ubuntu-22.04
ENV PATH /usr/local/bin/texlive:$PATH
WORKDIR /install-tl-unx

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y --no-install-recommends \
    fontconfig \
    ghostscript \
    perl \
    wget \
    xz-utils \
    && apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/*
COPY ./texlive.profile ./
RUN wget -nv https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz \
    && tar -xzf ./install-tl-unx.tar.gz --strip-components=1 \
    && ./install-tl --profile=texlive.profile \
    && ln -sf /usr/local/texlive/*/bin/* /usr/local/bin/texlive

RUN tlmgr install \
  braket \
  collection-fontsrecommended \
  collection-langjapanese \
  collection-mathscience \
  collection-latex \
  collection-latexrecommended \
  latexmk \
  nidanfloat

CMD ["bash"]
