-- Retrieve all bookings along with the user details, property details, and payment details.

SELECT b.*, u.*, p.*, pay.*
FROM bookings b
INNER JOIN users u ON b.user_id = u.id
INNER JOIN properties p ON b.property_id = p.id
LEFT JOIN payments pay ON b.id = pay.booking_id
WHERE b.status = 'confirmed' AND (pay.status = 'successful' OR pay.status IS NULL);



-- Analyze the query’s performance.
EXPLAIN ANALYZE
SELECT b.*, u.*, p.*, pay.*
FROM bookings b
INNER JOIN users u ON b.user_id = u.id
INNER JOIN properties p ON b.property_id = p.id
LEFT JOIN payments pay ON b.id = pay.booking_id
WHERE b.status = 'confirmed' AND (pay.status = 'successful' OR pay.status IS NULL);



-- Refactor the query to reduce execution time.
SELECT b.id AS booking_id, b.booking_date, b.status AS booking_status,
        u.name AS user_name, u.email AS user_email,
        p.name AS property_name,p.location,p.price,
        pay.amount,pay.status AS payment_status
FROM bookings b
INNER JOIN users u ON b.user_id = u.id
INNER JOIN properties p ON b.property_id = p.id
LEFT JOIN (
    SELECT booking_id, amount, status
    FROM payments) pay 
ON b.id = pay.booking_id
WHERE b.status = 'confirmed' AND (pay.status = 'successful' OR pay.status IS NULL);
