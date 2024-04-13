# tinytex-alpine

Minimal Docker image for performing typeset publishing.

Technically, this doesn't save much, as the size of a TeX distribution is significantly greater than the typical minimal-distro size for Linux operating systems (e.g., Alpine vs. Ubuntu Bionic).

But it's a good exercise and I got *very* tired of waiting for publishing dependencies to finish installing.

## Building

To build the image:

```sh
> docker build -t tinytex-alpine:v2024.04 .
```

## Running

To run the image (once built or pulled):

```sh
> docker run -it -v="%CD%" tinytex-alpine:v2024.04
```

(In the above example, we assume you are on Windows and attempting to mount the current folder as your working directory.)

## Installing Dependencies

A script (`itd.sh`) is included to facilitate installation of dependencies.

In particular, the `deps.txt` illustrates how TeX packages can be listed (much like a Python `requirements.txt`) on each line for easy installation with this script.

```sh
> ./itd.sh deps.txt
```

## Typesetting

Once you have installed the necessary TeX packages (manually or with `itd.sh`), typesetting is straightforward:

```sh
> pdflatex test.tex
```

In this example, we assume you are testing with the built-in `test.tex` file; of course, you will likely want to mount/clone/copy your own file into the container runtime, particulary if you are using this image for CI jobs.
