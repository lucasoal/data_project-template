-- `meu-projeto-eng-dados`.gold.dim_date definition
-- Drop table
-- DROP TABLE `meu-projeto-eng-dados`.gold.dim_date;
CREATE TABLE
    `meu-projeto-eng-dados`.gold.dim_date (
        US_RELEASE_DATE DATETIME,
        `YEAR` INT64,
        `MONTH` INT64,
        QUARTER INT64,
        ID_DATE INT64,
        CONSTRAINT DIM_DATE_PK PRIMARY KEY (ID_DATE)
    );

-- `meu-projeto-eng-dados`.gold.dim_film definition
-- Drop table
-- DROP TABLE `meu-projeto-eng-dados`.gold.dim_film;
CREATE TABLE
    `meu-projeto-eng-dados`.gold.dim_film (
        FILM STRING,
        GENRE STRING,
        RATING_MPA STRING,
        `LANGUAGE` STRING,
        BREAK_EVEN STRING,
        MCU BOOL,
        MALE_FEMALE_LED STRING,
        PHASE FLOAT64,
        ID_FILM INT64,
        CONSTRAINT primary_key PRIMARY KEY (ID_FILM)
    );

-- `meu-projeto-eng-dados`.gold.dim_franchise definition
-- Drop table
-- DROP TABLE `meu-projeto-eng-dados`.gold.dim_franchise;
CREATE TABLE
    `meu-projeto-eng-dados`.gold.dim_franchise (
        FRANCHISE STRING,
        CHARACTER_FAMILY STRING,
        ID_FRANCHISE INT64,
        CONSTRAINT DIM_FRANCHISE_PK PRIMARY KEY (ID_FRANCHISE)
    );

-- `meu-projeto-eng-dados`.gold.dim_production definition
-- Drop table
-- DROP TABLE `meu-projeto-eng-dados`.gold.dim_production;
CREATE TABLE
    `meu-projeto-eng-dados`.gold.dim_production (
        PRODUCTION_COMPANY STRING,
        DISTRIBUTOR STRING,
        COUNTRY_ORIGIN STRING,
        FILMING_LOCATION STRING,
        ID_PRODUCTION INT64,
        CONSTRAINT primary_key PRIMARY KEY (ID_PRODUCTION)
    );

-- `meu-projeto-eng-dados`.gold.dim_staff definition
-- Drop table
-- DROP TABLE `meu-projeto-eng-dados`.gold.dim_staff;
CREATE TABLE
    `meu-projeto-eng-dados`.gold.dim_staff (
        DIRECTOR STRING,
        WRITER STRING,
        STAR STRING,
        ID_STAFF INT64,
        CONSTRAINT primary_key PRIMARY KEY (ID_STAFF)
    );

-- `meu-projeto-eng-dados`.gold.fact_movies definition
-- Drop table
-- DROP TABLE `meu-projeto-eng-dados`.gold.fact_movies;
CREATE TABLE
    `meu-projeto-eng-dados`.gold.fact_movies (
        ID_FILM INT64,
        ID_STAFF INT64,
        ID_FRANCHISE INT64,
        ID_PRODUCTION INT64,
        ID_DATE INT64,
        BUDGET_x FLOAT64,
        INFLATION_ADJUSTED_BUDGET FLOAT64,
        GROSS_WORLD_WIDE FLOAT64,
        INFLATION_ADJUSTED_WORLDWIDE_GROSS FLOAT64,
        GROSS_US_CANADA FLOAT64,
        DOMESTIC FLOAT64,
        BOX_OFFICE_GROSS_OTHER_TERRITORIES FLOAT64,
        GROSS_OPENING_WEEKEND FLOAT64,
        GROSS_TO_BUDGET FLOAT64,
        RATING_IMDB FLOAT64,
        ROTTEN_TOMATOES_CRITIC_SCORE INT64,
        VOTE INT64,
        OSCAR INT64,
        NOMINATION INT64,
        WIN INT64,
        MINUTES FLOAT64,
        CONSTRAINT fk_date FOREIGN KEY (ID_DATE) REFERENCES `meu-projeto-eng-dados`.gold.dim_date (ID_DATE) ON DELETE CASCADE ON UPDATE CASCADE,
        CONSTRAINT fk_film FOREIGN KEY (ID_FILM) REFERENCES `meu-projeto-eng-dados`.gold.dim_film (ID_FILM) ON DELETE CASCADE ON UPDATE CASCADE,
        CONSTRAINT fk_franchise FOREIGN KEY (ID_FRANCHISE) REFERENCES `meu-projeto-eng-dados`.gold.dim_franchise (ID_FRANCHISE) ON DELETE CASCADE ON UPDATE CASCADE,
        CONSTRAINT fk_production FOREIGN KEY (ID_PRODUCTION) REFERENCES `meu-projeto-eng-dados`.gold.dim_production (ID_PRODUCTION) ON DELETE CASCADE ON UPDATE CASCADE,
        CONSTRAINT fk_staff FOREIGN KEY (ID_STAFF) REFERENCES `meu-projeto-eng-dados`.gold.dim_staff (ID_STAFF) ON DELETE CASCADE ON UPDATE CASCADE
    );