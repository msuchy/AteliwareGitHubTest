CREATE TABLE languages (
     id    SERIAL PRIMARY KEY,
     name   varchar(40) NOT NULL CHECK (name <> '')
);

CREATE TABLE repositories (
     id           SERIAL PRIMARY KEY ,
     name         varchar(40) NOT NULL,
     language_id  integer,
     description  varchar(200),
     stars        integer,
     forks        integer,
     url          varchar (200),
     last_updated timestamp
);

CREATE TABLE creators (
     repository_id  integer PRIMARY KEY ,
     name           varchar(40) NOT NULL
);