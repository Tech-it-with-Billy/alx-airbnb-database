-- All bookings and the respective users who made those bookings.
SELECT u.*, b.*
FROM users u
INNER JOIN bookings b
ON b.user_id = u.id;


-- All properties and their reviews, including properties that have no reviews.
SELECT p.*, r.*
FROM properties p
LEFT JOIN reviews r
ON r.property_id = p.id;



-- All users and all bookings, even if the user has no booking or a booking is not linked to a user.
SELECT u.*, b.*
FROM users u
FULL OUTER JOIN bookings b
ON b.user_id = u.id;