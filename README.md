# ci-latex

[![build-image](https://github.com/niccokunzmann/ci-latex/actions/workflows/build-image.yml/badge.svg)](https://github.com/niccokunzmann/ci-latex/actions/workflows/build-image.yml)

A docker container for Gitlab CI to build with Latex.

This container [builds monthly][cron-job].
It uses the full, [current texlive installation][curr].

## Dockerhub

You can find this container at [niccokunzmann/ci-latex][hub].
You can pull it with

    docker pull niccokunzmann/ci-latex

## Local Build

You can build the container yourself using the `docker` command:

    docker build -t niccokunzmann/ci-latex .

## Local Latex

Suppose you are in the console in the folder where your
 `paper.tex` should be built, so `ls` shows `paper.tex`.
 Run this, to build the file.

     docker run -v "`pwd`:/thesis" --rm -it niccokunzmann/ci-latex  bash -c 'cd thesis; pdflatex paper.tex'

## Gitlab

You can use the container in your runner like this:

    image: niccokunzmann/ci-latex

### Example .gitlab-ci.yml

If you paper is in the root folder of the repository and named `paper.tex`, your `.gitlab-ci.yml` can look like this:

```
image: niccokunzmann/ci-latex

stages:
  - deploy

expose:
  stage: deploy
  script:
  - pdflatex -interaction=nonstopmode -halt-on-error paper.tex
  artifacts:
    paths:
    - paper.pdf
```

[See the documentation](https://docs.gitlab.com/ce/ci/yaml/README.html#image-and-services) for how to change your `.gitlab-ci.yml`.

## GitHub

Example `.travis.yml` derived from [12 characters translations](https://github.com/niccokunzmann/12characters-translations/).
We assume that there is a file names `paper.tex` at the root of your repository.

```
language: ruby

services:
  - docker

before_install:
  - docker pull niccokunzmann/ci-latex

script:
  - docker run -v "`pwd`:/thesis" --rm -it niccokunzmann/ci-latex  bash -c 'cd thesis; pdflatex paper.tex'

deploy:
  provider: releases
  api_key:
    secure: "... secure api key https://stackoverflow.com/a/12778315 ..."
  file:
    - paper.pdf
  skip_cleanup: true
  on:
    branch: master
```

## Failing build and update of this repository

If the repository build fails, this can be due to an outdated
`installation.profile`.
You can get the installation commands from the `Dockerfile`,
create the `texlive.profile` and then copy it over the
`installation.profile`.

## Related Work

- https://github.com/mattmahn/docker-latex
- I use it to [build my master thesis][master-thesis].
- [Building Latex with Travis](https://github.com/harshjv/travis-ci-latex-pdf)

[hub]: https://hub.docker.com/r/niccokunzmann/ci-latex
[cron-job]: .github/workflows/build-image.yml
[curr]: http://tug.org/texlive/acquire-netinstall.html
[master-thesis]: https://gitlab.quelltext.eu/niccokunzmann/masterarbeit/
