FROM ubuntu:latest

RUN apt-get -qq update && \
    apt-get install -y --no-install-recommends \
            texlive-fonts-recommended \
            texlive-latex-extra \
            texlive-fonts-extra \
            dvipng \
            texlive-latex-recommended \
            texlive-lang-german
RUN mpm --update-db && \
    mpm --install=tracklang
