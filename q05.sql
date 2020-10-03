/* Query 5: 
 aircraft model of planes without any flight, i.e. an airplane that is not used at all
 Write your query and store the result in table no_flight.
 */
DROP TABLE no_flight;

CREATE TABLE no_flight
(
    model CHARACTER(25)
);

INSERT INTO no_flight
SELECT model
FROM bookings.aircraft
WHERE aircraft_code = (
    SELECT aircraft_code
    FROM bookings.aircraft
        EXCEPT
    SELECT DISTINCT aircraft_code
    FROM bookings.flights
);