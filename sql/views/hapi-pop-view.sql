-- ---------------------------------------------------------------------
-- Denormalised baseline-population view for HAPI
--
-- Started 2023-08-09
--
-- Depends on hapi-core-tables.sql and hapi-pop-tables.sql
-- ---------------------------------------------------------------------

DROP VIEW IF EXISTS PopulationView;

-- TODO fill in fields
CREATE VIEW PopulationView AS
SELECT POP.*,
       D.hdx_link AS dataset_hdx_link,
       D.code AS dataset_code,
       D.title AS dataset_title,
       D.provider_code AS dataset_provider_code,
       D.provider_name AS dataset_provider_name,
       D.api_link AS dataset_api_link,
       R.hdx_link AS resource_hdx_link,
       R.code AS resource_code,
       R.filename AS resource_filename,
       R.mime_type AS resource_mime_type,
       R.update_date AS resource_update_date,
       R.is_hxl AS resource_is_hxl,
       R.api_link AS resource_api_link,
       Gender.description AS gender_description,
       AgeRange.description AS age_range_description,
       ADM2.name AS admin2_name,
       ADM2.centroid_lat AS admin2_centroid_lat,
       ADM2.centroid_lon AS admin2_centroid_lon,
       ADM2.is_valid AS admin2_is_valid,
       ADM2.valid_date_start AS admin2_valid_date_start,
       ADM2.valid_date_end AS admin2_valid_date_end,
       ADM1.name AS admin1_name,
       ADM1.centroid_lat AS admin1_centroid_lat,
       ADM1.centroid_lon AS admin1_centroid_lon,
       ADM1.is_valid AS admin1_is_valid,
       ADM1.valid_date_start AS admin1_valid_date_start,
       ADM1.valid_date_end AS admin1_valid_date_end,
       LOC.name AS location_name,
       LOC.centroid_lat AS location_centroid_lat,
       LOC.centroid_lon AS location_centroid_lon,
       LOC.valid_date_start AS location_valid_date_start,
       LOC.valid_date_end AS location_valid_date_end
FROM Population POP
LEFT JOIN Gender G ON POP.gender_code=G.code
LEFT JOIN AgeRange AR ON POP.age_range_code=AR.code
LEFT JOIN Admin2 ADM2 ON POP.admin2_ref=ADM2.id
LEFT JOIN Admin1 ADM1 ON ADM2.admin1_ref=ADM1.id
LEFT JOIN Location LOC ON ADM1.location_ref=LOC.id;

-- end
