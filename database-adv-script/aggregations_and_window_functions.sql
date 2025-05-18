-- Total number of bookings made by each user.
SELECT name, number_of_bookings
FROM(SELECT u.name, COUNT(b.*) number_of_bookings
    FROM bookings B
    INNER JOIN users u
    ON u.id = b.user_id
    GROUP BY 1) t1

