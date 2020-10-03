/* Query 13: 
 total fares sales amount by fare class 
 for flights departing from Moscow
 Write your query and store the result in 
 table fares_sales.
 */
DROP TABLE fares_sales;

CREATE TABLE fares_sales
(
    fare_conditions CHARACTER VARYING(10),
    amount          NUMERIC(12, 2)
);

INSERT INTO fares_sales
SELECT fare_conditions,
       SUM(amount)
FROM bookings.ticket_flights
WHERE flight_id IN (
    SELECT flight_id
    FROM bookings.flights
    WHERE departure_airport IN (
        SELECT a.airport_code
        FROM bookings.airport a
        WHERE SUBSTRING(a.city, 1, 6) = 'Moscow'
    )
)
GROUP BY fare_conditions;