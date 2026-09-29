FROM quay.io/keycloak/keycloak:26.6.3 AS builder

RUN /opt/keycloak/bin/kc.sh build --db mysql

FROM quay.io/keycloak/keycloak:26.6.3

COPY --from=builder /opt/keycloak /opt/keycloak
