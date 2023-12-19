CREATE TABLE [dbo].[tbl_error_log_sql](
	[sqlErrorId] [bigint] IDENTITY(1,2) NOT NULL,
	[sqlErrorDesc] [varchar](500) NULL,
	[sqlErrorScript] [varchar](500) NULL,
	[sqlQueryString] [varchar](500) NULL,
	[sqlErrorCategory] [varchar](500) NULL,
	[sqlErrorSource] [varchar](500) NULL,
	[sqlErrorUTCDate] [datetime] NULL,
	[sqlErrorLocalDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[sqlErrorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO