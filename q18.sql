/* Query 18: 
 list departing airport, 
 total # of flights and # of delayed flights with more delayed flights
 that is, the most inefficient airport.
 if there is a tie you can display all tied airports
 Write your query and store the result in table R.
 */
DROP TABLE dealyed_airport;

CREATE TABLE dealyed_airport
(
    departure_airport CHARACTER(3),
    count_flights     INT,
    count_delayed     INT
);

DROP TABLE IF EXISTS temp_delayed;
CREATE TABLE temp_delayed
(
    departure_airport CHARACTER(3),
    count_delayed     INT
);

INSERT INTO temp_delayed
SELECT d.departure_airport, count(d.status)
FROM bookings.flights d
WHERE d.status = 'Delayed'
GROUP BY departure_airport
HAVING count(status) =
       (
           SELECT max(count_delayed)
           FROM (
                    SELECT COUNT(f.status) AS count_delayed
                    FROM bookings.flights f
                    WHERE status = 'Delayed'
                    GROUP BY f.departure_airport
                ) AS answer);

INSERT INTO  dealyed_airport
SELECT td.departure_airport, count(f.flight_id), td.count_delayed
FROM temp_delayed td
         JOIN bookings.flights f ON td.departure_airport = f.departure_airport
GROUP BY td.departure_airport, td.count_delayed;


DROP TABLE IF EXISTS temp_delayed;
