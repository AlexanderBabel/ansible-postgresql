# ansible-postgresql

## Purpose

This projects helps managing PostgreSQL users and databases. It uses ansible to create new users and databases. They are defined in an inventory file as connection uris. Per database one user with all privileges will be created.

## Example

The following command can be used for this project:

```bash
docker run -v /path/to/inventory:/app/inventory.yaml ghcr.io/alexanderbabel/ansible-postgresql
```

Example inventory.yaml:
```yaml
localhost:
  hosts:
    local:
  vars:
    ansible_python_interpreter: /usr/local/bin/python3
    server:
      host: "host"
      port: "5432"
      user: "postgres"
      password: "pass1234"
      database: "postgres"
    extensions:
      - name: uuid-ossp
        state: present
    databases:
      - databaseUrl: postgres://user:pass123@host:5432/database
      - databaseUrl: postgresql://user:pass123@host:5432/database
        state: absent
      - databaseUrl: postgresql://user:pass123@host:5432/database
        state: present
      - databaseUrl: postgres://user:pass123@host:5432/database
        locale: C
```

## Contributions

I am open for any suggestions. Please create a PR when a feature is missing.
