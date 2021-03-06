USE [master]
GO

/****** Object:  Database [USPC_SSIS_Config_QA]    Script Date: 3/17/2016 11:56:28 AM ******/
CREATE DATABASE [USPC_SSIS_Config_QA] ON  PRIMARY 
( NAME = N'ETLAudit_QA', FILENAME = N'I:\SQLData\USPC_SSIS_Config_QA.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ETLAudit_QA_log', FILENAME = N'L:\SQLLogs\USPC_SSIS_Config_QA_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

ALTER DATABASE [USPC_SSIS_Config_QA] SET COMPATIBILITY_LEVEL = 100
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [USPC_SSIS_Config_QA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [USPC_SSIS_Config_QA] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [USPC_SSIS_Config_QA] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [USPC_SSIS_Config_QA] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [USPC_SSIS_Config_QA] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [USPC_SSIS_Config_QA] SET ARITHABORT OFF 
GO

ALTER DATABASE [USPC_SSIS_Config_QA] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [USPC_SSIS_Config_QA] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [USPC_SSIS_Config_QA] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [USPC_SSIS_Config_QA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [USPC_SSIS_Config_QA] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [USPC_SSIS_Config_QA] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [USPC_SSIS_Config_QA] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [USPC_SSIS_Config_QA] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [USPC_SSIS_Config_QA] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [USPC_SSIS_Config_QA] SET  DISABLE_BROKER 
GO

ALTER DATABASE [USPC_SSIS_Config_QA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [USPC_SSIS_Config_QA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [USPC_SSIS_Config_QA] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [USPC_SSIS_Config_QA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [USPC_SSIS_Config_QA] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [USPC_SSIS_Config_QA] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [USPC_SSIS_Config_QA] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [USPC_SSIS_Config_QA] SET RECOVERY SIMPLE 
GO

ALTER DATABASE [USPC_SSIS_Config_QA] SET  MULTI_USER 
GO

ALTER DATABASE [USPC_SSIS_Config_QA] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [USPC_SSIS_Config_QA] SET DB_CHAINING OFF 
GO

ALTER DATABASE [USPC_SSIS_Config_QA] SET  READ_WRITE 
GO

