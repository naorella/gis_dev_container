#! /bin/bash

#start postgres
sudo service postgresql start

#for commands within the psql interactive shell
PSQL="sudo -u postgres psql"
USER=admin
DB=default

#reset, for testing purposes
#sudo -u postgres dropdb $DB
#sudo -u postgres dropuser $USER -e


echo "CREATE DATABASE "$DB"" | $PSQL
echo "ALTER DATABASE gisdb SET search_path=public,postgis,contrib" | $PSQL
sudo -u postgres createuser --superuser $USER
echo "grant all privileges on database "$DB" to "$USER"" | $PSQL


#connect to our new database
GISDB="sudo -u postgres psql --dbname="$DB""
#sleep timer, as to not overwhelm the postgres services
TIMER=3
echo "CREATE EXTENSION postgis;" | $GISDB
sleep $TIMER
#calculate road distances
echo "CREATE EXTENSION pgrouting;" | $GISDB
sleep $TIMER
#object concersion to put shapefiles into db
echo "CREATE EXTENSION ogr_fdw;" | $GISDB
sleep  $TIMER
#enabling raster support
echo "CREATE EXTENSION postgis_raster;" | $GISDB
sleep  $TIMER
#enabling advanced 3d support
echo "CREATE EXTENSION postgis_sfcgal;" | $GISDB
sleep  $TIMER
#enabling SQL/MM Net Topology
echo "CREATE EXTENSION postgis_topology;" | $GISDB
sleep  $TIMER
#fuzzymatchin addresses
echo "CREATE EXTENSION fuzzystrmatch;" | $GISDB
sleep  $TIMER
echo "SELECT postgis_full_version();" | $GISDB
#restart to apply changes
sudo service postgresql restart
