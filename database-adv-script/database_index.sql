EXPLAIN ANALYZE
SELECT name, number_of_bookings
FROM(SELECT u.name, COUNT(b.*) number_of_bookings
    FROM bookings b
    INNER JOIN users u
    ON u.id = b.user_id
    GROUP BY 1) t1;


CREATE INDEX idx_users_id ON users(id);
CREATE INDEX idx_users_name ON users(name);
CREATE INDEX idx_users_is_host ON users(is_host);

CREATE INDEX idx_bookings_id ON bookings(id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_user_id ON bookings(user_id);

CREATE INDEX idx_properties_id ON properties(id);
CREATE INDEX idx_properties_location ON properties(location);
CREATE INDEX idx_properties_host_id ON properties(host_id);

EXPLAIN ANALYZE
SELECT name, number_of_bookings
FROM(SELECT u.name, COUNT(b.*) number_of_bookings
    FROM bookings b
    INNER JOIN users u
    ON u.id = b.user_id
    GROUP BY 1) t1;
