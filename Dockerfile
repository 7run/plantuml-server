ARG BUILDER_IMAGE_VERSION="bookworm"
FROM buildpack-deps:"${BUILDER_IMAGE_VERSION}" as builder

ARG FIRPLE_VERSION="4.000"
ARG FIRPLE_DOWNLOAD_URL="https://github.com/negset/Firple/releases/download/${FIRPLE_VERSION}/Firple.zip"
RUN curl -sSL "${FIRPLE_DOWNLOAD_URL}" -o /opt/Firple.zip && \
    unzip /opt/Firple.zip -d /opt/Firple

ARG PLANTUML_IMAGE_VERSION="v1.2023.13"
FROM plantuml/plantuml-server:"${PLANTUML_IMAGE_VERSION}"
COPY --from=builder /opt/Firple /usr/local/share/fonts/Firple
COPY config.txt /var/lib/jetty/config.txt
ENV PLANTUML_CONFIG_FILE="/var/lib/jetty/config.txt"
RUN fc-cache -vf
