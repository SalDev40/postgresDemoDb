/* Query 4: list airport code for airports located in Asia
Write your query and store the result in table airport_asia.
*/
DROP TABLE airport_asia;

CREATE TABLE airport_asia
(
    airport_code CHARACTER(3)
);

INSERT INTO airport_asia
SELECT airport_code
FROM bookings.airport
WHERE SUBSTRING(timezone, 1, 4) = 'Asia';