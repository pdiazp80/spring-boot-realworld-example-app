DROP INDEX IF EXISTS flyway_schema_history_s_idx;

DROP TABLE IF EXISTS article_favorites;
DROP TABLE IF EXISTS article_tags;
DROP TABLE IF EXISTS comments;
DROP TABLE IF EXISTS articles;
DROP TABLE IF EXISTS follows;
DROP TABLE IF EXISTS tags;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS flyway_schema_history;


-- article_favorites definition

CREATE TABLE article_favorites (
  article_id VARCHAR(255) NOT NULL,
  user_id VARCHAR(255) NOT NULL,
  PRIMARY KEY (article_id, user_id)
);

-- article_tags definition

CREATE TABLE article_tags (
  article_id VARCHAR(255) NOT NULL,
  tag_id VARCHAR(255) NOT NULL
);

-- articles definition

CREATE TABLE articles (
  id VARCHAR(255) PRIMARY KEY,
  user_id VARCHAR(255),
  slug VARCHAR(255) UNIQUE,
  title VARCHAR(255),
  description TEXT,
  body TEXT,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- comments definition

CREATE TABLE comments (
  id VARCHAR(255) PRIMARY KEY,
  body TEXT,
  article_id VARCHAR(255),
  user_id VARCHAR(255),
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- flyway_schema_history definition

CREATE TABLE flyway_schema_history (
    installed_rank INTEGER NOT NULL PRIMARY KEY,
    version VARCHAR(50),
    description VARCHAR(200) NOT NULL,
    type VARCHAR(20) NOT NULL,
    script VARCHAR(1000) NOT NULL,
    checksum INTEGER,
    installed_by VARCHAR(100) NOT NULL,
    installed_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    execution_time INTEGER NOT NULL,
    success BOOLEAN NOT NULL
);

CREATE INDEX flyway_schema_history_s_idx ON flyway_schema_history (success);

-- follows definition

CREATE TABLE follows (
  user_id VARCHAR(255) NOT NULL,
  follow_id VARCHAR(255) NOT NULL
);

-- tags definition

CREATE TABLE tags (
  id VARCHAR(255) PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

-- users definition

CREATE TABLE users (
  id VARCHAR(255) PRIMARY KEY,
  username VARCHAR(255) UNIQUE,
  password VARCHAR(255),
  email VARCHAR(255) UNIQUE,
  bio TEXT,
  image VARCHAR(511)
);



INSERT INTO articles (id, user_id, slug, title, description, body, created_at, updated_at) VALUES
('art1', 'user1', 'introduccion-a-spring-boot', 'Introducción a Spring Boot', 'Artículo sobre los conceptos básicos de Spring Boot.', 'Contenido del artículo de introducción a Spring Boot.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('art2', 'user2', 'graphql-en-spring', 'GraphQL en Spring', 'Uso de GraphQL en aplicaciones Spring.', 'Contenido del artículo sobre GraphQL en Spring.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('art3', 'user3', 'docker-para-desarrolladores', 'Docker para desarrolladores', 'Guía de uso de Docker en desarrollo.', 'Contenido de la guía de Docker.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('art4', 'user1', 'microservicios-con-spring-cloud', 'Microservicios con Spring Cloud', 'Conceptos de microservicios con Spring Cloud.', 'Contenido sobre microservicios y Spring Cloud.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('art5', 'user2', 'rest-api-con-spring-boot', 'REST API con Spring Boot', 'Cómo construir APIs REST con Spring Boot.', 'Contenido de REST API con Spring Boot.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('art6', 'user3', 'seguridad-con-spring-security', 'Seguridad con Spring Security', 'Autenticación y autorización en Spring.', 'Contenido sobre Spring Security.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('art7', 'user1', 'test-con-junit', 'Testing con JUnit', 'Buenas prácticas para pruebas unitarias con JUnit.', 'Contenido de testing con JUnit.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('art8', 'user2', 'kubernetes-para-spring', 'Kubernetes para Spring', 'Despliegue de aplicaciones Spring en Kubernetes.', 'Contenido de Kubernetes con Spring.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('art9', 'user3', 'optimizar-spring-boot', 'Optimizar Spring Boot', 'Técnicas para mejorar el rendimiento de Spring Boot.', 'Contenido sobre optimización de Spring Boot.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('art10', 'user1', 'spring-data-jpa-basico', 'Spring Data JPA Básico', 'Introducción al uso de Spring Data JPA.', 'Contenido de introducción a Spring Data JPA.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

