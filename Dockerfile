FROM ubuntu:22.10 AS installer
ENV PATH /usr/local/bin/texlive:$PATH
WORKDIR /install-tl-unx
RUN apt-get update
RUN apt-get install -y \
  fontconfig \
  perl \
  wget \
  xz-utils
COPY ./texlive.profile ./
RUN wget -nv https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
RUN tar -xzf ./install-tl-unx.tar.gz --strip-components=1
RUN ./install-tl --profile=texlive.profile
RUN ln -sf /usr/local/texlive/*/bin/* /usr/local/bin/texlive
RUN tlmgr install \
  algorithms \
  collection-fontsrecommended \
  collection-langjapanese \
  collection-latexextra \
  latexmk \
  physics \
  siunitx

FROM mcr.microsoft.com/vscode/devcontainers/base:ubuntu-22.04
ENV PATH /usr/local/bin/texlive:$PATH
COPY --from=installer /usr/local/texlive /usr/local/texlive
RUN apt-get update \
  && apt-get install -y \
    perl \
    wget \
  && apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/*
RUN ln -sf /usr/local/texlive/*/bin/* /usr/local/bin/texlive
CMD ["bash"]
