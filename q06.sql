/* Query 6: how many available
 airports are there considering
 any departure or arrival?
 Write your query and store the result in table available_airports.
 */
DROP TABLE available_airports;

CREATE TABLE available_airports
(
    airports INT
);

INSERT INTO available_airports
SELECT COUNT(*)
FROM (
         SELECT departure_airport
         FROM bookings.flights
         UNION
         SELECT arrival_airport
         FROM bookings.flights
     ) AS available_airports;

