/*
 * Reorder the columns in the following SQL table so that the resulting table minimizes disk usage.
 * You do not need to compute the total disk usage per row.
 */

CREATE TABLE project (
    author_id BIGINT NOT NULL,
    created_at TIMESTAMPTZ,
    updated_at TIMESTAMPTZ,
    id SERIAL PRIMARY KEY,
    target_id INTEGER NOT NULL,
    project_id INTEGER NOT NULL UNIQUE,
    action SMALLINT NOT NULL,
    title VARCHAR(256),
    target_type VARCHAR(2) NOT NULL,
    data TEXT
);
