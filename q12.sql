/* Query 12: atomic:
 show all unique pairs of departure and arrival city of flights 
 on an Airbus airplane
 Write your query and store the result in table airbus.
 */
DROP TABLE airbus;

CREATE TABLE airbus
(
    departure_airport CHARACTER(3),
    arrival_airport   CHARACTER(3)
);

INSERT INTO airbus
SELECT DISTINCT departure_airport,
                arrival_airport
FROM bookings.flights f
WHERE f.aircraft_code IN (
    SELECT b.aircraft_code
    FROM bookings.aircraft b
    WHERE SUBSTRING(model, 1, 6) = 'Airbus'
)
  AND f.status = 'Delayed';
