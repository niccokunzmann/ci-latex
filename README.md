# ci-latex
A docker container for Gitlab CI to build with Latex.

This container [builds weekly][cron-job].
It uses the full, [current texlive installation][curr].

## Dockerhub

You can find this container at [niccokunzmann/ci-latex][hub].
You can pull it with

    docker pull niccokunzmann/ci-latex

## Gitlab

You can use the container in your runner like this:

    image: niccokunzmann/ci-latex
    
## Example .gitlab-ci.yml

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

## Related Work

- https://github.com/mattmahn/docker-latex


[hub]: https://hub.docker.com/r/niccokunzmann/ci-latex
[cron-job]: https://github.com/niccokunzmann/ci-latex/tree/cron-job
[curr]: http://tug.org/texlive/acquire-netinstall.html
