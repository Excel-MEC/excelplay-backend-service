# Excel Play Backend

Excel Play is a series of online events held leading upto Govt. Model Engineering College's annual techno-managerial fest Excel.

# Development

## Running the project for development

Use docker-compose for running all components required for the project
`docker-compose up`

To force a rebuild of the containers before starting them, use
`docker-compose up --build`

To bring down all the containers and volumes that the command started, use
`docker-compose down --remove-orphans --volumes`

All environment variables needed for docker can be found in .env file in the project root.
PGAdmin can be used to manipulate the database manually and is available on `localhost:5050` after running docker-compose. The login details can be found in the .env file and the IP of the postgres container that PGAdmin needs can be found by running `docker inspect <postgres container name> | grep "IP"`. PGAdmin can also be configured to connect to a remote DB instead through it's UI, if a remote DB is being used instead a local DB.

To use endpoints that require auth access, [create a JWT](http://jwtbuilder.jamiekurtz.com/) and pass it in the Authorization header in the format `Bearer <token>`. The `sub` field of the JWT must contain a valid `uuid`. This uuid must be that of a user already in the database.

## Generating docs

Swagger UI compatible docs are generated using [swaggo](https://github.com/swaggo/swag).

Download and install the `swag` binary from that repository (typically by moving the binary to `/usr/local/go/bin/`), then from the root folder of either kryptos or dalalbull, run

```shell
$ swag init --generalInfo ../../cmd/excelplay-backend-kryptos/main.go --dir ./pkg/handlers --output ./cmd/excelplay-backend-kryptos/docs
```

This very specific command is required, because for some reason the file where swaggo looks for general info (which in this case, is the `main.go` file) is relative to the directory specified with the `--dir` option, but the output folder specified with the `--output` option is relative to the directory from which this command is executed. If the output docs folder is not in the same directory as `main.go`, further problems arise. The directory specified with the `--dir` option is the one containing the handlers for all the API endpoints.

## Note on go modules

This project uses go modules but includes vendored deps to support older go versions. A go version that supports go modules (>1.13 is recommended) is required to add new dependencies. Once a new dependency is added use `go mod vendor` to vendor the new dependency for people on older go versions.
