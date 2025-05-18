-- Total number of bookings made by each user.
SELECT name, number_of_bookings
FROM(SELECT u.name, COUNT(b.*) number_of_bookings
    FROM bookings b
    INNER JOIN users u
    ON u.id = b.user_id
    GROUP BY 1) t1;



-- Rank properties based on the total number of bookings they have received.
SELECT ROW_NUMBER() OVER (ORDER BY number_of_bookings DESC) AS row_number, 
        property_id, number_of_bookings, 
        RANK() OVER (ORDER BY number_of_bookings DESC) AS booking_rank
FROM(SELECT property_id, COUNT(*) AS number_of_bookings
    FROM bookings
    GROUP BY 1) t2;
