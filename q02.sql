/* 
 Query 2: list passenger name, number of distinct booking ref #, number of tickets
 and # of distinct emails for passenger VLADIMIR MOROZOV
 Write your query and store the result in table vladimir.
 */
DROP TABLE vladimir;

CREATE TABLE vladimir
(
    passenger_name    TEXT,
    number_of_booking INT,
    number_of_tickets INT,
    number_of_emails  INT
);

INSERT INTO vladimir
SELECT passenger_name,
       COUNT(DISTINCT book_ref) AS number_of_booking,
       COUNT(ticket_no)         AS number_of_tickets,
       COUNT(DISTINCT email)    AS number_of_emails
FROM bookings.ticket
WHERE passenger_name = 'VLADIMIR MOROZOV'
GROUP BY passenger_name;