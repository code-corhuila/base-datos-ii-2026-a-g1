-- CONTINENT
CREATE TABLE ubication.continent (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(100) NOT NULL,
    description TEXT,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    created_by VARCHAR(100),
    updated_at TIMESTAMP,
    updated_by VARCHAR(100),
    state VARCHAR(20) NOT NULL DEFAULT 'ACTIVE'
);

-- COUNTRY
CREATE TABLE ubication.country (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(100) NOT NULL,
    description TEXT,
    continent_id UUID NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    created_by VARCHAR(100),
    updated_at TIMESTAMP,
    updated_by VARCHAR(100),
    state VARCHAR(20) NOT NULL DEFAULT 'ACTIVE',
    CONSTRAINT fk_country_continent
        FOREIGN KEY (continent_id)
        REFERENCES ubication.continent(id)
);

-- ESTATE (DEPARTAMENTO / ESTADO)
CREATE TABLE ubication.estate (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(100) NOT NULL,
    description TEXT,
    country_id UUID NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    created_by VARCHAR(100),
    updated_at TIMESTAMP,
    updated_by VARCHAR(100),
    state VARCHAR(20) NOT NULL DEFAULT 'ACTIVE',
    CONSTRAINT fk_estate_country
        FOREIGN KEY (country_id)
        REFERENCES ubication.country(id)
);

-- CITY
CREATE TABLE ubication.city (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(100) NOT NULL,
    description TEXT,
    estate_id UUID NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    created_by VARCHAR(100),
    updated_at TIMESTAMP,
    updated_by VARCHAR(100),
    state VARCHAR(20) NOT NULL DEFAULT 'ACTIVE',
    CONSTRAINT fk_city_estate
        FOREIGN KEY (estate_id)
        REFERENCES ubication.estate(id)
);