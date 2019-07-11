SELECT ST_Area(geom)
FROM nyc_neighborhoods;
-- WHERE name = 'West Village';
SELECT Sum(ST_Area(geom)) / 4047
FROM nyc_neighborhoods
WHERE boroname = 'Manhattan';

SELECT Count(*)
FROM nyc_census_blocks
WHERE ST_NumInteriorRings(ST_GeometryN(geom,1)) > 0;

SELECT Sum(ST_Length(geom))
FROM nyc_streets;

SELECT type, Sum(ST_Length(geom)) AS length
FROM nyc_streets
GROUP BY type
ORDER BY length DESC;

SELECT ST_Length(geom)
FROM nyc_streets
WHERE name = 'Columbus Cir';

SELECT ST_AsGeoJSON(geom)
FROM nyc_neighborhoods
WHERE name = 'West Village';

SELECT ST_NumGeometries(geom)
FROM nyc_neighborhoods
WHERE name = 'West Village';

SELECT type, Sum(ST_Length(geom)) AS length
FROM nyc_streets
GROUP BY type
ORDER BY length DESC;


