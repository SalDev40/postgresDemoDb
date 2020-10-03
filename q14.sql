/* Query 14: list booking code
 and names of passengers in bookings 
 with 3 or more passengers together
 Write your query and store the result in table booking_code.
 */
DROP TABLE booking_code;

CREATE TABLE booking_code
(
    book_ref       CHARACTER(6),
    passenger_name TEXT
);

INSERT INTO booking_code
SELECT t1.book_ref,
       passenger_name
FROM bookings.ticket t1
WHERE t1.book_ref IN (
    SELECT book_ref
    FROM bookings.ticket t2
    GROUP BY t2.book_ref
    HAVING COUNT(t2.book_ref) >= 3
);