/* Query 15: 
 tickets sold per fare 
 class, only for arrived flights
 Write your query and store the 
 result in table tickets_sold.
 */
DROP TABLE tickets_sold;

CREATE TABLE tickets_sold
(
    fare_conditions CHARACTER VARYING(10),
    tickets         INT
);

INSERT INTO tickets_sold
SELECT fare_conditions,
       COUNT(ticket_no)
FROM bookings.ticket_flights
WHERE flight_id IN (
    SELECT flight_id
    FROM bookings.flights f
    WHERE f.status = 'Arrived'
)
GROUP BY fare_conditions;