FROM python:3

RUN apt update && apt install -y \
    libgbm1 \
    libasound2 \
    xvfb

ENV DRAWIO_VERSION=16.1.2
RUN wget https://github.com/jgraph/drawio-desktop/releases/download/v$DRAWIO_VERSION/drawio-amd64-$DRAWIO_VERSION.deb -O /tmp/drawio.deb \
    && apt install -y /tmp/drawio.deb \
    && rm /tmp/drawio.deb

RUN pip install --no-cache-dir \
    'mkdocs' \
    'mkdocs-material' \
    'mkdocs-minify-plugin' \
    'mkdocs-git-revision-date-localized-plugin' \
    'mkdocs-awesome-pages-plugin' \
    'mkdocs-drawio-exporter' \
    'mkdocs-redirects' \
    'pymdown-extensions'

RUN useradd -m mkdocs
USER mkdocs
ENV XDG_CONFIG_HOME=~/.config
WORKDIR /docs
