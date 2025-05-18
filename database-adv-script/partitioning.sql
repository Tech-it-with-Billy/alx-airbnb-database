-- Partitioning on the Booking table based on the start_date column
CREATE TABLE bookings (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    status VARCHAR(50),
    created_at DATETIME,
    -- other columns...

    INDEX (start_date)
)
PARTITION BY RANGE (TO_DAYS(start_date)) (
    PARTITION p_q1_2025 VALUES LESS THAN (TO_DAYS('2025-04-01')),
    PARTITION p_q2_2025 VALUES LESS THAN (TO_DAYS('2025-07-01')),
    PARTITION p_q3_2025 VALUES LESS THAN (TO_DAYS('2025-10-01')),
    PARTITION p_q4_2025 VALUES LESS THAN (TO_DAYS('2026-01-01'))
);



-- Query to fetch bookings from a specific year range
EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE start_date BETWEEN '2025-01-01' AND '2025-12-31';
