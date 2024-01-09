FROM buildpack-deps:bookworm as builder

ARG FIRPLE_VERSION=4.000
RUN curl -sSL https://github.com/negset/Firple/releases/download/${FIRPLE_VERSION}/Firple.zip -o /opt/Firple.zip && \
    unzip /opt/Firple.zip -d /opt/Firple

FROM plantuml/plantuml-server:v1.2023.13
COPY --from=builder /opt/Firple /usr/local/share/fonts/Firple
COPY config.txt /var/lib/jetty/config.txt
ENV PLANTUML_CONFIG_FILE=/var/lib/jetty/config.txt
RUN fc-cache -vf
