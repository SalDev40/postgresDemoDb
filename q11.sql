/* Query 11: 
 # of invalid tickets: 
 tickets without a booking
 Write your query and store the 
 result in table invalid_tickets.
 */
DROP TABLE invalid_tickets;

CREATE TABLE invalid_tickets(num_invalid int);


INSERT INTO  invalid_tickets
SELECT COUNT(*)
FROM bookings.ticket t
    JOIN bookings.bookings b ON t.book_ref = b.book_ref
WHERE t.book_ref IS NULL;