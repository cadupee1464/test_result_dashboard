DROP TABLE IF EXISTS stg;
DROP TABLE IF EXISTS student;
DROP TABLE IF EXISTS test;
DROP TABLE IF EXISTS school;
DROP TABLE IF EXISTS test_results;

CREATE TABLE stg AS
SELECT *
FROM read_csv_auto('data/portfolio_test_data.csv', sample_size = -1
);

SELECT COUNT(*) AS row_count FROM stg;
