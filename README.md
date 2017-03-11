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

## Related Work

- https://github.com/mattmahn/docker-latex


[hub]: https://hub.docker.com/r/niccokunzmann/ci-latex
[cron-job]: https://github.com/niccokunzmann/ci-latex/tree/cron-job
[curr]: http://tug.org/texlive/acquire-netinstall.html
