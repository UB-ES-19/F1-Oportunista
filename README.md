# F1-Idealista
Idealista project's repository

# Building the project

## Docker

This is the preferred building method.

```bash
docker-compose build    # build project
docker-compose up       # loads server
```

Notice that the server will load by default on `localhost:8000` and the database `localhost:3306`.

**NOTE:** For some reason it only works with `docker-compose up` with a command that does pretty much everything but in the future it should allow for `docker-compose run dev <cmd>` for an arbitrary command.