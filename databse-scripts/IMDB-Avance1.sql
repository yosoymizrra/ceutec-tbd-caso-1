USE master
GO

CREATE DATABASE IMDB

ON PRIMARY(
    NAME = 'IMDB_data', FILENAME = 'path.mdf', SIZE = 10MB,MAXSIZE= UNLIMITED 
)

LOG ON(
    NAME = 'IMDB_log', FILENAME = 'path.ldf', SIZE=5MB, MAXSIZE = 2GB
)

GO

CREATE SCHEMA MARCADEO;
CREATE SCHEMA NEGOCIO;
CREATE SCHEMA MISCELANEOS;

CREATE TABLE MERCADEO.AUTOR(
    ID INT INDETITY(1,1) NOT NULL,
    NOMBRE NVARCHAR(50) NOT NULL,


)

CREATE TABLE MERCADEO.CONCEPTO(
    ID INT INDENTITY(1,1) NOT NULL,
    TITULO NVARCHAR(100)NOT NULL,
    RESENIA NVARCHAR(MAX),
    FECHA_LANZAMIENTO DATETIME,
    PAIS_ORIGEN NVARCHAR(50),
    URL_WEB NVARCHAR(255),
    ID_AUTOR INT,
    PRIMARY KEY (ID)
)

ALTER TABLE MERCADEO.CONCEPTO
    WITH CHECK ADD CONSTRAINT FK_CONCEPTO_AUTOR
    ADD FOREIGN KEY (ID_AUTOR)
    REFERENCES MERCADEO.AUTOR(ID)
    ON DELETE CASCADE

CREATE TABLE MERCADEO.PRODUCTO_MARCA(
    ID INT IDENTITY(1,1) NOT NULL,
    DESCRIPCION NVARCHAR(500) NOT NULL,
    MARCA NVARCHAR(50) NOT NULL,
    TIPO NVARCHAR(50),
    ID_CONCEPTO INT,
    PRIMARY KEY (ID)
) 

ALTER TABLE MERCADEO.PRODUCTO_MARCA
    WITH CHECK ADD CONSTRAINT FK_PRODUCTO_MARCA
    ADD FOREIGN KEY (ID_CONCEPTO)
    REFERENCES MERCADEO.PRODUCTO_MARCA(ID)
    ON DELETE CASCADE

CREATE TABLE MERCADEO.PRODUCCION(
    ID INT IDENTITY(1,1) PRIMARY KEY,
    NOMBRE_COMPANIA NVARCHAR(100) NOT NULL,
    PAIS NVARCHAR(50) NOT NULL,
    URL_WEB NVARCHAR(255),
    CEO NVARCHAR(100)
)
