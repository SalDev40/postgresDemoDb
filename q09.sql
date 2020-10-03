/* Query 9:  list cities with 2 or more airports
 Write your query and store the result in table city_airport.
 */
DROP TABLE city_airport;

CREATE TABLE city_airport(city character(20));

INSERT INTO city_airport
SELECT city
FROM bookings.airport
GROUP BY city
HAVING COUNT(airport_name) >= 2;