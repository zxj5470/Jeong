# I use docker~

docker run --name=postgis -d -e POSTGRES_USER=zh -e POSTGRES_PASS=zxj5470 -e POSTGRES_DBNAME=gis -e ALLOW_IP_RANGE=0.0.0.0/0 -p 5432:5432 --restart=always kartoza/postgis:9.6-2.4
shp2pgsql -s id nyc_streets.shp public.nyc_streets | psql -h localhost -d gis -U zh
shp2pgsql -s id nyc_subway_stations.shp public.nyc_subway_stations | psql -h localhost -d gis -U zh
shp2pgsql -s id nyc_census_blocks.shp public.nyc_census_blocks | psql -h localhost -d gis -U zh
shp2pgsql -s id nyc_neighborhoods.shp public.nyc_neighborhoods | psql -h localhost -d gis -U zh
shp2pgsql -s id nyc_homicides.shp public.nyc_homicides | psql -h localhost -d gis -U zh
