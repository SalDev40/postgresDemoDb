/* Query 19:  show names and # of rows of all tables in descending order.
Write your query and store the result in table top_table.
*/

DROP TABLE top_table;
CREATE TABLE top_table
(
    table_name TEXT,
    total_rows INT
);

CREATE OR REPLACE FUNCTION
    tableRows(tableName TEXT) RETURNS INTEGER
AS
$body$
DECLARE
    rows INTEGER;
BEGIN
    EXECUTE concat('SELECT count(*) FROM bookings.', tableName) INTO rows;
    RETURN rows;
END;
$body$
    LANGUAGE plpgsql;

INSERT INTO  top_table
SELECT table_name,
       tableRows(table_name) AS total_rows
FROM information_schema.tables
WHERE table_schema = 'bookings'
ORDER BY total_rows DESC;

