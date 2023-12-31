CREATE TABLE [dbo].[tbl_UserDetail](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](100) NULL,
	[Password] [varchar](100) NULL,
	[Email] [varchar](50) NULL,
	[MobileNo] [varchar](50) NULL,
	[Gender] [varchar](50) NULL,
	[Title] [varchar](50) NULL,
	[UserType] [varchar](50) NULL,
	[ProfileImage] [varchar](MAX) NULL,
	[Bio] [varchar](500) NULL,
	[DriverLicenceNumber] [varchar](50) NULL,
	[Country] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[CurrentAdress] [varchar](50) NULL,
	[PostCode] [varchar](50) NULL,
	[Age] [varchar](50) NULL,
	[CreatedBY] [varchar](50) NULL,
	[CreatedDate] [varchar](50) NULL,
	[UpdatedDate] [varchar](50) NULL,
	[Updatedby] [varchar](50) NULL
	);