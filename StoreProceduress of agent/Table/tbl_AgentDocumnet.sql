USE [MyPayWebcomTest]
GO

/****** Object:  Table [dbo].[tbl_AgentDocument]    Script Date: 8/28/2023 11:52:26 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tbl_AgentDocument](
	[BID] [int] IDENTITY(1,1) NOT NULL,
	[DocumentType] [varchar](50) NULL,
	[DocumentNumber] [int] NULL,
	[IssueDate] [varchar](50) NULL,
	[ExpiryDate] [varchar](50) NULL,
	[PanNumber] [varchar](50) NULL,
	[PanDocumentImage] [varchar](50) NULL,
	[FrontImage] [nvarchar](50) NULL,
	[BackImage] [nvarchar](50) NULL,
	[BankName] [varchar](50) NULL,
	[AccountNumber] [nvarchar](100) NULL,
	[Branch] [varchar](50) NULL,
	[CitizenshipImage] [varchar](50) NULL,
	[DirectorFullName] [varchar](50) NULL,
	[DirectorEmail] [varchar](50) NULL,
	[DirectorContactNumber] [varchar](50) NULL,
	[DirectorCitizenshipImage] [nvarchar](50) NULL,
	[DirectorRecentImage] [nvarchar](100) NULL,
	[VatNumber] [nvarchar](50) NULL,
	[OfficeLocation] [varchar](50) NULL,
	[Provinceofoffice] [nvarchar](50) NULL,
	[Districtofoffice] [varchar](50) NULL,
	[Municipalityofoffice] [nvarchar](50) NULL,
	[streetname] [varchar](50) NULL,
	[housenumber] [nvarchar](50) NULL,
	[AgentId] [int] NULL,
 CONSTRAINT [PK_tbl_AgentDocument] PRIMARY KEY CLUSTERED 
(
	[BID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tbl_AgentDocument]  WITH CHECK ADD  CONSTRAINT [FK_KeyAgentIdwithtbldocument] FOREIGN KEY([AgentId])
REFERENCES [dbo].[tbl_AgentDetailUser] ([AgentID])
GO

ALTER TABLE [dbo].[tbl_AgentDocument] CHECK CONSTRAINT [FK_KeyAgentIdwithtbldocument]
GO

ALTER TABLE [dbo].[tbl_AgentDocument]  WITH CHECK ADD  CONSTRAINT [FK_tbl_AgentDocument_tbl_AgentDocument] FOREIGN KEY([BID])
REFERENCES [dbo].[tbl_AgentDocument] ([BID])
GO

ALTER TABLE [dbo].[tbl_AgentDocument] CHECK CONSTRAINT [FK_tbl_AgentDocument_tbl_AgentDocument]
GO


