/*
Query 1: count distinct and average range for Boeing models
 Write your query and store the result in table boeing.
 */
DROP TABLE boeing;

CREATE TABLE boeing
(
    dist_range INT,
    avg_range  NUMERIC(6, 2)
);

INSERT INTO boeing
SELECT COUNT(DISTINCT model),
       AVG(RANGE)
FROM bookings.aircraft
WHERE SUBSTRING(model, 1, 6) = 'Boeing';