# F1-Idealista
Idealista project's repository

# How to use docker

### Requirements

+ docker
+ docker-compose

### Building

Use

```bash
docker-compose build
```

### Start server

Use

```bash
docker-compose up -d # loads server at http://127.0.0.1:8000/
```

Somehow the server can start before the database. If it doesn't show simply execute `docker-compose up -d` again. The first time a server starts it might require to applay migrations or build assets. Read next section to see how to do that

### Interact with django

```bash
docker-compose run web <cmd>
```

Examples:

```bash
docker-compose run web python idealista/manage.py migrate # migrate database
docker-compose run web python idealista/manage.py makeassets # build assets
```

### Stop server

Use

```bash
docker-compose down
```
