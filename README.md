# sqlc-embed-array-bug

Minimal example of a bug where `sqlc.embed` doesn't wrap `text[]` fields in a `pq.Array`, which causes a scan error.

- In [schema.sql](./schema.sql), the `a_list` field is of type `text[]`
- In [query.sql](./query.sql), the first query uses a `records.*` for SELECT, and the second query uses `sqlc.embed(records)`
- These should have essentially the same output, but in the generated [query.sql.go](./db/query.sql.go) file, the first query wraps `AList` in a `pq.Array(&i.AList)`, while the second does not.
- This leads to an `unsupported Scan, storing driver.Value type <nil> into type *[]string` error at runtime.
