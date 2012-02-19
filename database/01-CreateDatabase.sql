/*
 * Database Performance Monitoring Reports
 * Project #99 - Complete Database Implementation
 * SQL Server 2008/2012
 * Technology: MSSQL, DMVs
 * Created: 2014
 */

USE master;
GO

IF EXISTS (SELECT name FROM sys.databases WHERE name = 'DBMonitoring')
BEGIN
    ALTER DATABASE DBMonitoring SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DBMonitoring;
END
GO

CREATE DATABASE DBMonitoring
ON PRIMARY
(
    NAME = 'DBMonitoring_Data',
    FILENAME = 'C:\SQLData\DBMonitoring_Data.mdf',
    SIZE = 100MB,
    MAXSIZE = 5GB,
    FILEGROWTH = 10MB
)
LOG ON
(
    NAME = 'DBMonitoring_Log',
    FILENAME = 'C:\SQLData\DBMonitoring_Log.ldf',
    SIZE = 50MB,
    MAXSIZE = 1GB,
    FILEGROWTH = 5MB
);
GO

ALTER DATABASE DBMonitoring SET RECOVERY SIMPLE;
ALTER DATABASE DBMonitoring SET AUTO_UPDATE_STATISTICS ON;
GO

USE DBMonitoring;
GO

PRINT 'Database DBMonitoring created successfully';
PRINT 'Project: Database Performance Monitoring Reports';
PRINT 'Description: Query and growth metrics monitoring';
GO
