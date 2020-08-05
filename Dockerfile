FROM freeradius/freeradius-server:3.0.21-alpine

RUN apk add --no-cache freeradius-postgresql

# fix https://github.com/FreeRADIUS/freeradius-server/commit/eef366956e2e4a689ab33a0d1f265eb15f749d8d
RUN sed -i '505s/$/ \\/' /etc/raddb/mods-config/sql/main/postgresql/queries.conf

# let radiusd load module sql before sqlcounter.
RUN sed -i '770s/#//g' /etc/raddb/radiusd.conf
