# Excel Play Backend

Excel Play is a series of online events held leading upto Govt. Model Engineering College's annual techno-managerial fest Excel.

# Development

## Running the project for development

Use docker-compose for running all components required for the project
`docker-compose up`

To bring down all the containers and volumes that the command started, use
`docker-compose down --remove-orphans --volumes`

All environment variables needed for docker can be found in .env file in the project root.
PGAdmin can be used to manipulate the database manually and is available on `localhost:5050` after running docker-compose. The login details can be found in the .env file and the IP of the postgres container that PGAdmin needs can be found by running `docker inspect <postgres container name> | grep "IP"`.

To use endpoints that require auth access, [create a JWT](http://jwtbuilder.jamiekurtz.com/) and pass it in the Authorization header in the format `Bearer <token>`. The `sub` field of the JWT must contain a valid `uuid`. This uuid must be that of a user already in the database.

## Note on go modules

This project uses go modules but includes vendored deps to support older go versions. A go version that supports go modules is required to add new dependencies. Once a new dependency is added use `go mod vendor` to vendor the new dependency for people on older go versions.
