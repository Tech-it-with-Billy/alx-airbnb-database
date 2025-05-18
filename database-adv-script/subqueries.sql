-- All properties where the average rating is greater than 4.0.
SELECT name, av_rating
FROM(SELECT p.name, AVG(r.rating) av_rating
    FROM properties p
    INNER JOIN reviews r
    ON r.property_id = p.id
    GROUP BY 1) t1
WHERE av_rating > 4;


-- Users who have made more than 3 bookings.
SELECT name, number_of_bookings
FROM(SELECT u.name, COUNT(b.*) number_of_bookings
    FROM bookings b
    INNER JOIN users u
    ON u.id = b.user_id
    GROUP BY 1)
WHERE number_of_bookings > 3;
