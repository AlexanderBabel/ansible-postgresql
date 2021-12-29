FROM python:3.10.1-alpine3.15

WORKDIR /app

RUN apk add --no-cache ansible py3-psycopg2 py3-jmespath

RUN mkdir -p /.ansible/tmp && chown -R 65534:65534 /.ansible

USER 65534

COPY --chown=65534:65534 playbook.yaml /app

ENV INVENTORY_FILE=/app/inventory.yaml
ENV PLAYBOOK_FILE=/app/playbook.yaml

CMD ["sh", "-c", "ansible-playbook -i $INVENTORY_FILE $PLAYBOOK_FILE"]
