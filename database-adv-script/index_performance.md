List of high-usage columns

### users table 

* id — used in `JOIN` clauses with `bookings.user_id` (primary key).
* NAME` — used in `WHERE` clauses to find specific users.
* is_host — used in WHERE clauses to filter hosts vs. guests.


#### bookings table

* id — occasionally used in `ORDER BY`.
* user_id — used in `JOIN` clauses with `users.id`.
* property_id — used in `JOIN` clauses with `properties.id`.


#### properties table 

* id — used in `JOIN` clauses with `bookings.property_id` (primary key).
* location — used in `WHERE` clauses for geographic filtering.
* price — used in `WHERE` and `ORDER BY` clauses for sorting/filtering by cost.
