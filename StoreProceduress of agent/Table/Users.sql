USE [MyPayWebcomTest]
GO

/****** Object:  Table [dbo].[Users]    Script Date: 8/28/2023 11:51:47 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Users](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
	[FirstName] [nvarchar](300) NOT NULL,
	[LastName] [nvarchar](300) NOT NULL,
	[Address] [nvarchar](1000) NOT NULL,
	[State] [nvarchar](100) NOT NULL,
	[City] [nvarchar](100) NOT NULL,
	[ZipCode] [nvarchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[RoleId] [int] NOT NULL,
	[RoleName] [nvarchar](300) NOT NULL,
	[IsApprovedByAdmin] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
	[CountryId] [int] NOT NULL,
	[TransactionPassword] [nvarchar](100) NOT NULL,
	[UserImage] [nvarchar](300) NOT NULL,
	[MemberId] [bigint] NOT NULL,
	[Email] [nvarchar](300) NOT NULL,
	[ContactNumber] [nvarchar](50) NOT NULL,
	[IpAddress] [nvarchar](100) NOT NULL,
	[VerificationCode] [nvarchar](50) NOT NULL,
	[DeviceCode] [nvarchar](500) NOT NULL,
	[PlatForm] [nvarchar](100) NOT NULL,
	[RefId] [bigint] NOT NULL,
	[RefCode] [nvarchar](100) NOT NULL,
	[StateId] [int] NOT NULL,
	[UpdatedBy] [bigint] NOT NULL,
	[DateofBirth] [nvarchar](50) NOT NULL,
	[Gender] [int] NOT NULL,
	[NationalIdProofFront] [nvarchar](300) NOT NULL,
	[NationalIdProofBack] [nvarchar](300) NOT NULL,
	[IsKYCApproved] [int] NOT NULL,
	[IsPhoneVerified] [bit] NOT NULL,
	[IsEmailVerified] [bit] NOT NULL,
	[TotalAmount] [decimal](18, 2) NOT NULL,
	[TotalRewardPoints] [decimal](18, 2) NOT NULL,
	[EmployeeType] [int] NOT NULL,
	[PhoneExtension] [nvarchar](50) NOT NULL,
	[ProofType] [int] NOT NULL,
	[MiddleName] [nvarchar](100) NOT NULL,
	[Pin] [nvarchar](50) NOT NULL,
	[DocumentNumber] [nvarchar](50) NOT NULL,
	[IssueDate] [nvarchar](50) NOT NULL,
	[ExpiryDate] [nvarchar](50) NOT NULL,
	[MUniqueId] [nvarchar](50) NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[CreatedByName] [nvarchar](100) NOT NULL,
	[Remarks] [nvarchar](500) NOT NULL,
	[MeritalStatus] [int] NOT NULL,
	[FatherName] [nvarchar](100) NOT NULL,
	[GrandFatherName] [nvarchar](100) NOT NULL,
	[Nationality] [int] NOT NULL,
	[DistrictId] [int] NOT NULL,
	[Municipality] [nvarchar](100) NOT NULL,
	[MunicipalityId] [int] NOT NULL,
	[WardNumber] [nvarchar](50) NOT NULL,
	[StreetName] [nvarchar](100) NOT NULL,
	[HouseNumber] [nvarchar](50) NOT NULL,
	[IsYourPermanentAndTemporaryAddressSame] [bit] NOT NULL,
	[TransactionPin] [int] NOT NULL,
	[CurrentStateId] [int] NOT NULL,
	[CurrentState] [nvarchar](100) NOT NULL,
	[CurrentDistrictId] [int] NOT NULL,
	[CurrentDistrict] [nvarchar](100) NOT NULL,
	[CurrentMunicipalityId] [int] NOT NULL,
	[CurrentMunicipality] [nvarchar](100) NOT NULL,
	[CurrentWardNumber] [nvarchar](50) NOT NULL,
	[CurrentStreetName] [nvarchar](100) NOT NULL,
	[CurrentHouseNumber] [nvarchar](50) NOT NULL,
	[LastLogin] [datetime] NOT NULL,
	[IssuedBy] [nvarchar](100) NOT NULL,
	[DOBType] [int] NOT NULL,
	[AlternateContactNumber] [nvarchar](50) NOT NULL,
	[KYCCreatedDate] [datetime] NOT NULL,
	[ApprovedorRejectedBy] [bigint] NOT NULL,
	[ApprovedorRejectedByName] [nvarchar](100) NOT NULL,
	[IssueFromDistrictID] [bigint] NOT NULL,
	[IssueFromStateID] [bigint] NOT NULL,
	[IssueFromDistrictName] [nvarchar](250) NOT NULL,
	[IssueFromStateName] [nvarchar](250) NOT NULL,
	[Lat] [nvarchar](50) NOT NULL,
	[Lon] [nvarchar](50) NOT NULL,
	[IsOldUser] [bit] NOT NULL,
	[LoginAttemptCount] [int] NOT NULL,
	[LastLoginAttempt] [datetime] NOT NULL,
	[EnablePushNotification] [bit] NOT NULL,
	[IsResetPasswordFromAdmin] [bit] NOT NULL,
	[MotherName] [nvarchar](500) NOT NULL,
	[SpouseName] [nvarchar](500) NOT NULL,
	[RefCodeAttempted] [nvarchar](50) NOT NULL,
	[DeviceId] [nvarchar](500) NOT NULL,
	[JwtToken] [nvarchar](500) NOT NULL,
	[TokenUpdatedTime] [datetime] NOT NULL,
	[UpdatedByName] [nvarchar](100) NOT NULL,
	[PreviousSiteBalance] [decimal](18, 2) NOT NULL,
	[KYCReviewDate] [datetime] NOT NULL,
	[IsBankAdded] [int] NOT NULL,
	[IsDarkTheme] [bit] NOT NULL,
	[WebLoginAttempted] [bit] NOT NULL,
	[UserType] [varchar](50) NULL,
	[AgentId] [int] NULL,
	[Fullname] [varchar](50) NULL,
	[ComissionBalance] [bigint] NULL,
 CONSTRAINT [PK_Users_new] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [U_Users_NewCONTACTNUMBER] UNIQUE NONCLUSTERED 
(
	[ContactNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [users_contactnumber] UNIQUE NONCLUSTERED 
(
	[ContactNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Users] SET (LOCK_ESCALATION = DISABLE)
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF__Users_New_UserId__74AE54BC]  DEFAULT ('N''') FOR [UserId]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF__Users_New_Password__75A278F5]  DEFAULT ('N''') FOR [Password]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF__Users_New_FirstName__76969D2E]  DEFAULT ('N''') FOR [FirstName]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF__Users_New_LastName__778AC167]  DEFAULT ('N''') FOR [LastName]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF__Users_New_Address__787EE5A0]  DEFAULT ('N''') FOR [Address]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF__Users_New_State__797309D9]  DEFAULT ('N''') FOR [State]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF__Users_New_City__7A672E12]  DEFAULT ('N''') FOR [City]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF__Users_New_ZipCode__7B5B524B]  DEFAULT ('N''') FOR [ZipCode]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF__Users_New_IsActive__7C4F7684]  DEFAULT ((1)) FOR [IsActive]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF__Users_New_IsDeleted__7D439ABD]  DEFAULT ((0)) FOR [IsDeleted]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF__Users_New_RoleId__7E37BEF6]  DEFAULT ((0)) FOR [RoleId]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF__Users_New_RoleName__7F2BE32F]  DEFAULT ('N''') FOR [RoleName]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF__Users_New_IsApprove__00200768]  DEFAULT ((0)) FOR [IsApprovedByAdmin]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF__Users_New_CreatedDa__01142BA1]  DEFAULT (getdate()) FOR [CreatedDate]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF__Users_New_UpdatedDa__02084FDA]  DEFAULT (getdate()) FOR [UpdatedDate]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF__Users_New_CountryId__02FC7413]  DEFAULT ((0)) FOR [CountryId]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF__Users_New_Transacti__03F0984C]  DEFAULT ('N''') FOR [TransactionPassword]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF__Users_New_UserImage__04E4BC85]  DEFAULT ('N''') FOR [UserImage]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF__Users_New_MemberId__05D8E0BE]  DEFAULT ((0)) FOR [MemberId]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF__Users_New_Email__06CD04F7]  DEFAULT ('N''') FOR [Email]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF__Users_New_ContactNu__07C12930]  DEFAULT ('N''') FOR [ContactNumber]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF__Users_New_IpAddress__08B54D69]  DEFAULT ('N''') FOR [IpAddress]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF__Users_New_Verificat__09A971A2]  DEFAULT ('N''') FOR [VerificationCode]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF__Users_New_DeviceCod__0A9D95DB]  DEFAULT ('N''') FOR [DeviceCode]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF__Users_New_PlatForm__0C85DE4D]  DEFAULT ('N''') FOR [PlatForm]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF__Users_New_RefId__0D7A0286]  DEFAULT ((0)) FOR [RefId]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF__Users_New_RefCode__0E6E26BF]  DEFAULT ('N''') FOR [RefCode]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF__Users_New_StateId__0F624AF8]  DEFAULT ((0)) FOR [StateId]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF__Users_New_UpdatedBy__114A936A]  DEFAULT ((0)) FOR [UpdatedBy]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF__Users_New_DateofBir__123EB7A3]  DEFAULT (N'') FOR [DateofBirth]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF__Users_New_Gender__1332DBDC]  DEFAULT ((0)) FOR [Gender]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF__Users_New_NationalI__17F790F9]  DEFAULT ('N''') FOR [NationalIdProofFront]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF__Users_New_NationalI__18EBB532]  DEFAULT ('N''') FOR [NationalIdProofBack]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF__Users_New_IsKYCAppr__1CBC4616]  DEFAULT ((0)) FOR [IsKYCApproved]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF__Users_New_IsPhoneVe__1DB06A4F]  DEFAULT ((0)) FOR [IsPhoneVerified]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF__Users_New_IsEmailVe__25518C17]  DEFAULT ((0)) FOR [IsEmailVerified]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF__Users_New_TotalAmou__2739D489]  DEFAULT ((0)) FOR [TotalAmount]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_NewTotalRewardPoints]  DEFAULT ((0)) FOR [TotalRewardPoints]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF__Users_New_EmployeeT__2B0A656D]  DEFAULT ((0)) FOR [EmployeeType]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF__Users_New_PhoneExte__2BFE89A6]  DEFAULT ('N''') FOR [PhoneExtension]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF__Users_New_ProofType__395884C4]  DEFAULT ((0)) FOR [ProofType]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF__Users_New_MiddleNam__3B40CD36]  DEFAULT ('N''') FOR [MiddleName]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF__Users_New_Pin__3F115E1A]  DEFAULT (N'') FOR [Pin]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF__Users_New_DocumentN__42E1EEFE]  DEFAULT ('N''') FOR [DocumentNumber]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF__Users_New_IssueDate__45BE5BA9]  DEFAULT ('N''') FOR [IssueDate]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF__Users_New_ExpiryDat__46B27FE2]  DEFAULT ('N''') FOR [ExpiryDate]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF__Users_New_MUniqueId__58D1301D]  DEFAULT ('N''') FOR [MUniqueId]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF__Users_New_CreatedBy__5CA1C101]  DEFAULT ((0)) FOR [CreatedBy]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF__Users_New_CreatedBy__5D95E53A]  DEFAULT ('N''') FOR [CreatedByName]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF__Users_New_Remarks__5E8A0973]  DEFAULT ('N''') FOR [Remarks]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_NewMeritalStatus]  DEFAULT ((0)) FOR [MeritalStatus]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_NewFatherName]  DEFAULT (N'') FOR [FatherName]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_NewGrandFatherName]  DEFAULT (N'') FOR [GrandFatherName]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_NewNationality]  DEFAULT ((0)) FOR [Nationality]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_NewDistrictId]  DEFAULT ((0)) FOR [DistrictId]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_NewMunicipality]  DEFAULT (N'') FOR [Municipality]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_NewMunicipalityId]  DEFAULT ((0)) FOR [MunicipalityId]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_NewWardNumber]  DEFAULT (N'') FOR [WardNumber]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_NewStreetName]  DEFAULT (N'') FOR [StreetName]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_NewHouseNumber]  DEFAULT (N'') FOR [HouseNumber]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_NewIsYourPermanentAndTemporaryAddressSame]  DEFAULT ((0)) FOR [IsYourPermanentAndTemporaryAddressSame]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_NewTransactionPin]  DEFAULT ((0)) FOR [TransactionPin]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_NewCurrentStateId]  DEFAULT ((0)) FOR [CurrentStateId]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_NewCurrentState]  DEFAULT (N'') FOR [CurrentState]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_NewCurrentDistrictId]  DEFAULT ((0)) FOR [CurrentDistrictId]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_NewCurrentDistrict]  DEFAULT (N'') FOR [CurrentDistrict]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_NewCurrentMunicipalityId]  DEFAULT ((0)) FOR [CurrentMunicipalityId]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_NewCurrentMunicipality]  DEFAULT (N'') FOR [CurrentMunicipality]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_NewCurrentWardNumber]  DEFAULT (N'') FOR [CurrentWardNumber]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_NewCurrentStreetName]  DEFAULT (N'') FOR [CurrentStreetName]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_NewCurrentHouseNumber]  DEFAULT (N'') FOR [CurrentHouseNumber]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_NewLastLogin]  DEFAULT (getdate()) FOR [LastLogin]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_NewIssuedBy]  DEFAULT (N'') FOR [IssuedBy]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_NewDOBType]  DEFAULT ((0)) FOR [DOBType]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_NewAlternateContactNumber]  DEFAULT (N'') FOR [AlternateContactNumber]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_NewKYCCreatedDate]  DEFAULT (getdate()) FOR [KYCCreatedDate]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_NewApprovedorRejectedBy]  DEFAULT ((0)) FOR [ApprovedorRejectedBy]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_NewApprovedorRejectedByName]  DEFAULT (N'') FOR [ApprovedorRejectedByName]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_NewIssueFromDIstrictID]  DEFAULT ((0)) FOR [IssueFromDistrictID]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_NewIssueFromStateID]  DEFAULT ((0)) FOR [IssueFromStateID]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_NewIssueFromDistrictName]  DEFAULT (N'') FOR [IssueFromDistrictName]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_NewIssueFromStateName]  DEFAULT (N'') FOR [IssueFromStateName]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_NewLat]  DEFAULT (N'') FOR [Lat]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_NewLon]  DEFAULT (N'') FOR [Lon]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_NewIsOldUser]  DEFAULT ((0)) FOR [IsOldUser]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_NewLoginAttemptCount]  DEFAULT ((0)) FOR [LoginAttemptCount]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_NewLastLoginAttempt]  DEFAULT (getdate()) FOR [LastLoginAttempt]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_NewEnablePushNotification]  DEFAULT ((1)) FOR [EnablePushNotification]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_NewIsResetPasswordFromAdmin]  DEFAULT ((0)) FOR [IsResetPasswordFromAdmin]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_NewMotherName]  DEFAULT (N'') FOR [MotherName]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_NewSpouseName]  DEFAULT (N'') FOR [SpouseName]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_NewRefCodeAttempted]  DEFAULT (N'') FOR [RefCodeAttempted]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_DeviceId]  DEFAULT (N'') FOR [DeviceId]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_JwtToken]  DEFAULT (N'') FOR [JwtToken]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_TokenUpdatedTime]  DEFAULT (getutcdate()) FOR [TokenUpdatedTime]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF__Users__UpdatedBy__0ECE1972]  DEFAULT (N'') FOR [UpdatedByName]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_PreviousSiteBalance]  DEFAULT ((0)) FOR [PreviousSiteBalance]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_KYCReviewDate]  DEFAULT (getdate()) FOR [KYCReviewDate]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_IsBankAdded]  DEFAULT ((0)) FOR [IsBankAdded]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_IsDarkTheme]  DEFAULT ((0)) FOR [IsDarkTheme]
GO

ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_WebLoginAttempted]  DEFAULT ((0)) FOR [WebLoginAttempted]
GO


