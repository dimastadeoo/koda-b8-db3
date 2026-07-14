SELECT "m"."name" AS "movies", "m"."year", "m"."rankscore" AS "rating", concat_ws( ' ', "d"."first_name", "d"."last_name") AS "directors", "mg"."genre" FROM "movies" "m"
JOIN "movies_directors" "md" ON "m"."id" = "md"."movie_id"
JOIN "directors" "d" ON "d"."id" = "md"."director_id"
JOIN "movies_genres" "mg"  ON "mg"."movie_id" = "m"."id" LIMIT 50;

SELECT concat_ws( ' ',"a"."first_name", "a"."last_name") AS "actors", "a"."gender", "r"."role", "m"."name" AS "movies" FROM "actors" "a"
JOIN "roles" "r" ON "r"."actor_id" = "a"."id"
JOIN "movies" "m" ON "m"."id" = "r"."movie_id" LIMIT 50;

