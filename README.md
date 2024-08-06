# GIS Development Container

## A way to use PSQL, Postgres, matplotlib, geopandas within a docker devcontainer


This is an alternative for who do not want to download conda, and are familiar with docker, for GIS related work within Jupyter Notebooks and postgres databases.

There are dockerfiles and docker-compose files to set up a local database and admin manager that can be accessed via VSCode devcontainer or web browser.


The set-up of postgis and pgadmin within the /database folder were taken from https://github.com/postgis/docker-postgis, with alteration of the database manager to pgadmin.\
The set-up of the devcontainer within /VSCode allows the vscode terminal to connect to the postgis database in the /database container.

### How to Set-up

Open this folder in vscode when you are ready to launch the containers.

Once you have finished setting up /database and /VSCode, from the VSCode application, right click on the docker-compose file and select "compose up".

To connect to these containers from VSCode, open up /VSCode in a seperate VSCode instance and select "Rebuild and Reopen in Container" from the Command Palette.

Type:
> psql -U {username} -p 5432 -h host.docker.internal -d {database} -W

in the VSCode terminal to connect to the postgres database.

The username and database name are the ones you specified in docker-compose.\
Instead of the usual "localhost", "host.docker.internal" is a special designation of the network assigned to your containers.

You can also connect to pgadmin from an internet browser by typing in\
"http://localhost:5050/"
using the credentials you provided in the docker-compose.

### Alternative Use
The containers in the docker-compose are not needed to run the VSCode devcontainer, they are only for setting up a database in a seperate container.\
If you'd rather, you can simply only use the /VSCode folder and build the image to work with a local psql server and have access to the python libraries.\
Instead you would connect to the local psql postgres server with:
> psql -U {username in postGIS_setup.sh} -d {database name in postGIS_setup.sh}
