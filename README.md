# ci-latex

[![Docker Build Status](https://img.shields.io/docker/build/niccokunzmann/ci-latex.svg)](https://hub.docker.com/r/niccokunzmann/ci-latex/builds/)

A docker container for Gitlab CI to build with Latex.

This container [builds weekly][cron-job].
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
 `document.tex` should be built, so `ls` shows `document.tex`.
 Run this, to build the file.

     docker run -v "`pwd`:/thesis" --rm -it niccokunzmann/ci-latex  bash -c 'cd thesis; /usr/local/texlive/2017/bin/x86_64-linux/pdflatex document.tex'

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
[cron-job]: https://github.com/niccokunzmann/ci-latex/tree/cron-job
[curr]: http://tug.org/texlive/acquire-netinstall.html
[master-thesis]: https://gitlab.quelltext.eu/niccokunzmann/masterarbeit/
