-- name: GetRecords :many
SELECT 
    records.*
FROM
    records;

-- name: GetRecordsWithEmbed :many
SELECT 
    sqlc.embed(records)
FROM
    records;
