/* Query 20:
show total money amount of all
booked tickets in one month (august).
Write your query and store the
result in table total_money.
*/

DROP TABLE total_money;
CREATE TABLE total_money
(
    money NUMERIC(13, 2)
);

INSERT INTO  total_money
SELECT sum(total_amount) AS money
FROM bookings.bookings
WHERE book_date >= '2017-08-01'
  AND book_date < '2017-09-01';