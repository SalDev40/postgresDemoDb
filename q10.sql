/* Query 10: 
 show the earliest and latest date across all flights, 
 i.e. to have an idea the time span of the database
Write your query and store the result in table span_date.
*/


DROP TABLE span_date;

CREATE TABLE span_date
(
    earliest TIMESTAMPTZ,
    latest   TIMESTAMPTZ
);


INSERT INTO span_date
SELECT least(min(b.book_date),
             min(f.scheduled_departure),
             min(f.scheduled_arrival),
             min(f.actual_departure),
             min(f.actual_arrival)),

       greatest(max(b.book_date),
                max(f.scheduled_departure),
                max(f.scheduled_arrival),
                max(f.actual_departure),
                max(f.actual_arrival))
FROM bookings.bookings b
         JOIN bookings.ticket t ON t.book_ref = b.book_ref
         JOIN bookings.ticket_flights tf ON t.ticket_no = tf.ticket_no
         RIGHT JOIN bookings.flights f ON f.flight_id = tf.flight_id;

