-- ---------------------------------------------------------------------
-- HAPI operational-presence database tables.
--
-- Started 2023-08-09
--
-- These depend on the tables in hapi-core-tables.sql
--
-- For auto incrementing primary keys, use:
-- PostgreSQL: SERIAL PRIMARY KEY
-- sqlite: INTEGER PRIMARY KEY
-- ANSI SQL: GENERATED ALWAYS AS IDENTITY
-- ---------------------------------------------------------------------

--
-- Data sources on HDX
--
-- Dataset ::= Resource*
-- Resource ::= [SpecificDataType]*
--

CREATE TABLE OperationalPresence (
       id INTEGER PRIMARY KEY,
       resource_ref INT NOT NULL,
       org_ref INT NOT NULL,
       sector_code VARCHAR(32) NOT NULL,
       admin2_ref INT NOT NULL,
       reference_period_start DATE NOT NULL,
       reference_period_end DATE DEFAULT NULL,
       source_data TEXT
);

CREATE INDEX OperationalPresence_reference_period_start_index
ON OperationalPresence(reference_period_start);

-- end
