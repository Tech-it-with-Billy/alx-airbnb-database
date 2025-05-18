#### Partition Performance

To test partitioning performance, we ran queries with and without start_date filters. 

Using EXPLAIN ANALYZE, we confirmed that queries filtered by start_date scanned only relevant partitions, improving speed through partition pruning. 

Queries lacking the partition key scanned all partitions, resulting in slower performance. We also added indexes inside individual partitions (e.g., on status) to optimize non-partition-based queries. 

Using timing, we evaluated execution time to compare query speeds. This approach highlights how combining partitioning with selective indexing significantly enhances query efficiency, especially for large datasets with time-based access patterns like booking records.
