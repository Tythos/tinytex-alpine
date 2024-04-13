FROM alpine
WORKDIR /
RUN apk add perl fontconfig xdvik
RUN wget https://github.com/rstudio/tinytex-releases/releases/download/v2024.04/TinyTeX-v2024.04.tar.gz
RUN tar -xvf TinyTeX-v2024.04.tar.gz
RUN rm TinyTeX-v2024.04.tar.gz
ENV PATH="${PATH}:/.TinyTeX/bin/x86_64-linux"
RUN tlmgr postaction install script xetex
RUN tlmgr option repository ctan
COPY * /
