Enter your git cedentials, and personalization for user settings in gitconfig.sh.\
Change the username in postgis_setup.sh. This is for the postgis database that you will be working FROM within VSCode, not connecting to.\
Within .devcontainer change the mounting locations in devcointainer.json to a local filepath to keep data in between sessions.

Open up /VSCode in a seperate VSCode instance and right click the dockerfile to build the image.\
Select "Rebuild and Reopen in Container" from the Command Palette.\
It may take about 30min for the container to be built, since its downloading python libraries and psql and its extensions.

Start psql with:
>sudo service postgresql start

since pg_ctl isn't in the path of the Ubuntu version this dev container operates on.

Connect to devcontainer (local) database with:
>psql -U {username in postGIS_setup.sh} -d {database name in postGIS_setup.sh}

Connect to the container database with:
>psql -U {username in docker-compose} -p 5432 -h host.docker.internal -d {database name in docker-compose} -W
