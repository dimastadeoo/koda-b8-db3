SELECT CONCAT("d"."first_name", ' ', "d"."last_name") AS "directors", COUNT("dg"."genre") AS "total_genre" FROM "directors" "d"
JOIN "directors_genres" "dg" ON "dg"."director_id" = "d"."id" GROUP BY "directors";

WITH "table" AS (SELECT CONCAT("a"."first_name", ' ', "a"."last_name") AS "actors", COUNT("r"."role") AS "role" FROM "actors" "a"
JOIN "roles" "r" ON "a"."id" = "r"."actor_id" GROUP BY "actors") SELECT "actors", "role" FROM "table" WHERE "role" > 5;

WITH "table" AS (SELECT CONCAT("d"."first_name", ' ', "d"."last_name") AS "directors", COUNT("m"."name") AS "total_movies" FROM "directors" "d"
JOIN "movies_directors" "md" ON "md"."director_id" = "d"."id"
JOIN "movies" "m" ON "m"."id" = "md"."movie_id" GROUP BY "directors") SELECT "directors", "total_movies" FROM "table" WHERE "total_movies" = (SELECT MAX("total_movies") FROM "table");

SELECT "year", COUNT("name") AS "total_movies" FROM "movies" GROUP BY "year" ORDER BY "total_movies" DESC LIMIT 1;

SELECT "m"."name" AS "movies", STRING_AGG("mg"."genre", ', ') AS "genre" FROM "movies" "m"
JOIN "movies_genres" "mg" ON "mg"."movie_id" = "m"."id"
GROUP BY "movies";