/* Query 16:  list model and city 
 for flights where a Boeing airplane 
 departs from or arrives to
 Write your query and store the result
 in table boeing_city.
 */
DROP TABLE boeing_city;

CREATE TABLE boeing_city
(
    model CHARACTER(25),
    city  CHARACTER(20)
);

INSERT INTO boeing_city
SELECT ap1.city,
       a1.model
FROM bookings.flights f1
         JOIN bookings.aircraft a1 ON f1.aircraft_code = a1.aircraft_code
    AND SUBSTRING(a1.model, 1, 6) = 'Boeing'
         JOIN bookings.airport ap1 ON ap1.airport_code = f1.departure_airport
UNION
SELECT ap2.city,
       a2.model
FROM bookings.flights f2
         JOIN bookings.aircraft a2 ON f2.aircraft_code = a2.aircraft_code
    AND SUBSTRING(a2.model, 1, 6) = 'Boeing'
         JOIN bookings.airport ap2 ON ap2.airport_code = f2.arrival_airport