-- Partitioning on the Booking table based on the start_date column
SELECT b.*, COUNT(b.*) OVER (PARTITION BY DATE_TRUNC('month', b.start_date)) AS monthly_bookings,
        RANK() OVER (PARTITION BY DATE_TRUNC('month', b.start_date) 
        ORDER BY b.created_at) AS booking_rank_in_month
FROM bookings b;



-- Query to fetch bookings from a specific year range
EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE start_date BETWEEN '2025-01-01' AND '2025-12-31';
