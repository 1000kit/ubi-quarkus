FROM registry.access.redhat.com/ubi8/ubi-minimal:8.2

ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en'

# Set user permission to 1001
RUN microdnf install openssl curl ca-certificates \
    && microdnf update \
    && microdnf clean all \
    && mkdir /work \
    && chown 1001 /work \
    && chmod "g+rwX" /work \
    && chown 1001:root /work 

EXPOSE 8080

USER 1001

WORKDIR /work/

CMD ["./application", "-Dquarkus.http.host=0.0.0.0" ]

