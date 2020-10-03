/* Query 3: list number of seats available per aircraft 
 Write your query and store the result in table seats_aircraft.
 */
DROP TABLE seats_aircraft;

CREATE TABLE seats_aircraft
(
    aircraft_code CHARACTER(3),
    seats         INT
);

INSERT INTO seats_aircraft
SELECT a.aircraft_code,
       COUNT(s.seat_no) AS total_seats
FROM bookings.aircraft a
         JOIN bookings.seats s ON s.aircraft_code = a.aircraft_code
GROUP BY a.aircraft_code;