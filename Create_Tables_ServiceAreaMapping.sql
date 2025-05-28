CREATE DATABASE MyDb;

USE MyDb;

CREATE TABLE TblCountries
(
	[CountryId] INT PRIMARY KEY IDENTITY(1, 1),
	[CountryName] VARCHAR(100)
);

CREATE TABLE TblStates
(
	[StateId] INT PRIMARY KEY IDENTITY,
	[StateName] VARCHAR(100),
	[CountryId] INT,
	FOREIGN KEY (CountryId) REFERENCES TblCountries(CountryId)
);

CREATE TABLE TblCities
(
	[CityId] INT PRIMARY KEY IDENTITY(1, 1),
	[CityName] VARCHAR(100),
	[StateId] INT,
	FOREIGN KEY (StateId) REFERENCES TblStates(StateId)
);

CREATE TABLE TblAreas
(
	[AreaId] INT PRIMARY KEY IDENTITY,
	[AreaName] VARCHAR(100),
	[CityId] INT,
	FOREIGN KEY (CityId) REFERENCES TblCities(CityId)
);

USE MyDb
CREATE TABLE TblServiceAreaMappings
(
	[MappingId] INT PRIMARY KEY IDENTITY(1, 1),
	[ServiceId] INT,
	[AreaId] INT
);

USE master;
DROP TABLE TblArea;
DROP TABLE TblCart;
DROP TABLE TblCategory;
DROP TABLE TblCity;
DROP TABLE TblCountry;
DROP TABLE TblOffer;
DROP TABLE TblOtp;
DROP TABLE TblServiceAreaMapping;
DROP TABLE TblServiceAreaMappings;
DROP TABLE TblServiceCartMapping;
DROP TABLE TblServices;
DROP TABLE TblState;
DROP TABLE TblSubCategory;
DROP TABLE TblUser;
DROP TABLE TblUserCartMapping;

DROP TABLE TblServiceAreaMappings;

INSERT INTO TblServiceAreaMappings (ServiceId, AreaId)
VALUES (1, 1);

INSERT INTO TblServiceAreaMappings (ServiceId, AreaId)
VALUES (1, 2);

INSERT INTO TblServiceAreaMappings (ServiceId, AreaId)
VALUES (1, 3);
