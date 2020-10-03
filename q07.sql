/* Query 7: 
 list bookings 
 and number of passengers 
 with 2 or more passengers 
 together
 Write your query and store 
 the result in table bookings_passenger.
 */
DROP TABLE bookings_passenger;

CREATE TABLE bookings_passenger
(
    book_ref   CHARACTER(6),
    passengers INT
);

INSERT INTO bookings_passenger
SELECT book_ref,
       COUNT(ticket.passenger_name) AS passengers
FROM bookings.ticket
GROUP BY book_ref
HAVING COUNT(ticket.passenger_name) >= 2
ORDER BY passengers;