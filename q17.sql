/* Query 17:  list flight_id,
 scheduled departure date,departing city, 
 departing airport, arrival city, 
 arrival airport
 for delayed flights for passenger ELENA
 Write your query and store the result in table R.
 */
DROP TABLE elena_delayed;

CREATE TABLE elena_delayed
(
    flight_id           INT,
    scheduled_departure TIMESTAMPTZ,
    d_city              CHARACTER(20),
    departure_airport   CHARACTER(3),
    a_city              CHARACTER(20),
    arrival_airport     CHARACTER(3)
);

INSERT INTO elena_delayed
SELECT DISTINCT f.flight_id,
                f.scheduled_departure,
                ao.city AS d_city,
                f.departure_airport,
                a.city  AS a_city,
                f.arrival_airport

FROM bookings.flights f
         JOIN bookings.ticket_flights tf ON tf.flight_id = f.flight_id
         JOIN bookings.ticket t ON t.ticket_no = tf.ticket_no
         JOIN bookings.airport ao ON ao.airport_code = f.departure_airport
         JOIN bookings.airport a ON a.airport_code = f.arrival_airport
WHERE f.status = 'Delayed'
  AND SUBSTRING(t.passenger_name, 1, 5) = 'ELENA';

