
-- 9 geometries
-- https://postgis.net/workshops/postgis-intro/geometries.html
-- test
CREATE TABLE geometries
(
  name varchar,
  geom geometry
);
INSERT INTO geometries
VALUES ('Point', 'POINT(0 0)'),
       ('Linestring', 'LINESTRING(0 0, 1 1, 2 1, 2 2)'),
       ('Polygon', 'POLYGON((0 0, 1 0, 1 1, 0 1, 0 0))'),
       ('PolygonWithHole', 'POLYGON((0 0, 10 0, 10 10, 0 10, 0 0),(1 1, 1 2, 2 2, 2 1, 1 1))'),
       ('Collection', 'GEOMETRYCOLLECTION(POINT(2 0),POLYGON((0 0, 1 0, 1 1, 0 1, 0 0)))');
SELECT name, ST_AsText(geom)
FROM geometries;
SELECT name, ST_GeometryType(geom), ST_NDims(geom), ST_SRID(geom)
FROM geometries;
--
SELECT ST_AsText(geom)
FROM geometries
WHERE name = 'Point';

SELECT ST_X(geom), ST_Y(geom)
FROM geometries
WHERE name = 'Point';

SELECT name, ST_AsText(geom)
FROM nyc_subway_stations
LIMIT 1;

SELECT ST_AsText(geom), ST_Length(geom)
FROM geometries
WHERE name = 'Linestring';

SELECT ST_Length(geom)
FROM geometries
WHERE name = 'Linestring';

SELECT ST_AsText(geom)
FROM geometries
WHERE name LIKE 'Polygon%';

SELECT name, ST_Area(geom)
FROM geometries
WHERE name LIKE 'Polygon%';

SELECT name, ST_AsText(geom)
FROM geometries
WHERE name = 'Collection';

SELECT encode(
           ST_AsBinary(ST_GeometryFromText('LINESTRING(0 0,1 0)')),
           'hex');

SELECT ST_AsText(ST_GeometryFromText('LINESTRING(0 0 0,1 0 0,1 1 2)'));

-- Using ST_GeomFromText with the SRID parameter
SELECT ST_GeomFromText('POINT(2 2)',4326);
SELECT ST_SetSRID(ST_GeomFromText('POINT(2 2)'),4326);
SELECT ST_SetSRID(ST_MakePoint(2, 2), 4326);
SELECT ST_SetSRID('POINT(2 2)'::geometry, 4326);
SELECT 'SRID=4326;POINT(2 2)'::geometry;
SELECT ST_AsGeoJSON(ST_GeomFromGML('<gml:Point><gml:coordinates>1,1</gml:coordinates></gml:Point>'));

SELECT 0.9::text;
SELECT 'POINT(0 0)'::geometry;
SELECT 'SRID=4326;POINT(0 0)'::geometry;
