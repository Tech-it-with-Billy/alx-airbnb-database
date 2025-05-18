### Bottlenecks & Fixes Summary

#### 1. Missing Indexes
Problem: Slow JOIN, WHERE, or ORDER BY clauses.

Fix: Add indexes on:

bookings.user_id, property_id, start_date, created_at

users.id, created_at

properties.id, location, host_id

#### 2. Large Table Scans
Problem: Full scans on bookings reduce performance.

Fix:

Filter by start_date or status using indexed columns.

Use logical partitioning via WHERE or DATE_TRUNC.

#### 3. Slow Window Functions
Problem: Unindexed PARTITION BY or ORDER BY columns.

Fix: Index the columns used in window functions (e.g. start_date, created_at).

#### 4. Type Mismatches & Redundant Indexes
Fix: Ensure matching data types in joins. Avoid indexing low-cardinality fields like status alone.