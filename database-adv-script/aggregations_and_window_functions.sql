-- Total number of bookings made by each user.
SELECT name, number_of_bookings
FROM(SELECT u.name, COUNT(b.*) number_of_bookings
    FROM bookings B
    INNER JOIN users u
    ON u.id = b.user_id
    GROUP BY 1) t1;



-- Rank properties based on the total number of bookings they have received.
SELECT name, number_of_bookings, ROW_NUMBER() OVER (ORDER BY number_of_bookings DESC) AS booking_rank
FROM(SELECT u.name, COUNT(b.*) number_of_bookings
    FROM bookings B
    INNER JOIN users u
    ON u.id = b.user_id
    GROUP BY 1) t2;
