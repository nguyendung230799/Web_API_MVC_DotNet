DELETE FROM [dbo].[UserClaim]
GO
DELETE FROM [dbo].[UserRole]
GO
DELETE FROM [dbo].[User]
GO
DELETE FROM [dbo].[Role]
GO
INSERT [dbo].[Role] ([Id], [Name]) VALUES (N'b425d62d-135d-4f5e-8bef-4024e77d3886', N'Administrator')
GO
INSERT [dbo].[Role] ([Id], [Name]) VALUES (N'752462d6-f26d-4bd1-8570-f9beaf54699b', N'Assistant')
GO
INSERT [dbo].[Role] ([Id], [Name]) VALUES (N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f', N'Basic')
GO
INSERT [dbo].[Role] ([Id], [Name]) VALUES (N'ea5cd9ee-1c3f-46b6-85da-220e994693aa', N'Manager')
GO
INSERT [dbo].[Role] ([Id], [Name]) VALUES (N'b784c0ee-0f9e-427d-b216-6e08b8849717', N'Moderator')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'd7d3d7fb-326e-45de-be5f-035500fdf935', N'05715bb4-191d-4963-ad24-786c65802812', N'141', N'Quân khu 4 (Bệnh viện 268)', 0, NULL, NULL, NULL, N'Quân khu 4 (Bệnh viện 268)', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'141@bqp.gov.vn', 1, N'AJn3aYfHsB8aRH2O7xCJUrEhjygfU0AOxbvqOJ76uY3P52MH/Rh+H1Nu8gVV1e43eA==', N'c1627e3c-331c-41c4-9cd0-9b4c1e3263cc', NULL, 0, 0, NULL, 0, 0, N'141@bqp.gov.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'0003cbad-a514-4cc2-a9fa-04a5cf9af814', N'05715bb4-191d-4963-ad24-786c65802812', N'41', N'BC Thông tin liên lạc', 0, NULL, NULL, NULL, N'BC Thông tin liên lạc', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'41@bqp.gov.vn', 1, N'AM8QM4ZIiR6qS8LjLBDlsokah2mGfAHCveaDlF948H8v8RaUnzScB3VZVlbWetLTEg==', N'b1092744-2e4e-41c0-a98b-32963fbf20ba', NULL, 0, 0, NULL, 0, 0, N'41@bqp.gov.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'a7bf9646-4dda-4ee3-8851-051eeb3e64d7', N'05715bb4-191d-4963-ad24-786c65802812', N'30', N'Binh đoàn 12', 0, NULL, NULL, NULL, N'Binh đoàn 12', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'30@bqp.gov.vn', 1, N'AEfLqPF9Qx6+K14oQm3E1EOsHvp1ea4j8i9d8mRBaP2ju0IaNQmzj2lGfcCrXxa0/w==', N'afca01f4-6e24-40e5-8021-284a73503288', NULL, 0, 0, NULL, 0, 0, N'30@bqp.gov.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'73c461b5-f8f8-4166-9acd-0616de10ea0e', N'05715bb4-191d-4963-ad24-786c65802812', N'51', N'Bộ Tổng Tham mưu', 0, NULL, NULL, NULL, N'Bộ Tổng Tham mưu', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'51@bqp.gov.vn', 1, N'AL7ObtXsPZuVKlNrfMDTBp639uHNgNqu14oOZt3H6LcnBjsPcpeE/KmQRUGFCEbXFQ==', N'71cd7f4f-33c0-43b4-8e92-18e38a7948c8', NULL, 0, 0, NULL, 0, 0, N'51@bqp.gov.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'79c839e0-8c05-462e-8590-08a7055677f0', N'05715bb4-191d-4963-ad24-786c65802812', N'94', N'Ngân hàng TMCP QĐ', 0, NULL, NULL, NULL, N'Ngân hàng TMCP QĐ', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'94@bqp.gov.vn', 1, N'AJ0+SHWL6ESQuBnAUDhDFeBtHdIrubN4YCHyqVID5PQawHCzJfRDftzjSWej7vb8iQ==', N'b1f36c9e-172f-4511-a621-a6a9bce75ac2', NULL, 0, 0, NULL, 0, 0, N'94@bqp.gov.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'51dedf12-24cc-4f06-9d0c-0f9aa3d76307', N'05715bb4-191d-4963-ad24-786c65802812', N'15', N'Quân khu 5', 0, NULL, NULL, NULL, N'Quân khu 5', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'15@bqp.gov.vn', 1, N'AGfKsXngo9jGv/g637PZxd31tJOnEluOeUyGQGyJOm2zOLDYE+SVlvJHBnjSwT3IHw==', N'a861faa3-f5ad-45e4-be14-4352597407b2', NULL, 0, 0, NULL, 0, 0, N'15@bqp.gov.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'e0e40dc5-ff3e-442e-88ee-11d44c6a5060', N'05715bb4-191d-4963-ad24-786c65802812', N'03', N'Ban Cơ yếu CP', 0, NULL, NULL, NULL, N'Ban Cơ yếu CP', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'03@bqp.gov.vn', 1, N'AI3BKETW3vDRqnugOPSH1BzErymShGzCGpkErcOWo58WbsJVBl2MLQ7nbbcj1aaEKA==', N'f0056419-4d9f-4ca5-bf43-d9263de07657', NULL, 0, 0, NULL, 1, 0, N'03@bqp.gov.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'4622cd7d-19f8-41f5-97f4-145c54f0e80f', N'05715bb4-191d-4963-ad24-786c65802812', N'152', N'Quân khu 5 (Bệnh viện 17)', 0, NULL, NULL, NULL, N'Quân khu 5 (Bệnh viện 17)', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'152@bqp.gov.vn', 1, N'APZddVmgX96hXLm4OMPCKZ2m8z4/c2ONwaHX+EFcPWDRL7MzR/AcmqKRLa4+lz0spg==', N'83f5963c-3d94-43cb-a558-0f0dd311e380', NULL, 0, 0, NULL, 0, 0, N'152@bqp.gov.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'f0717bcb-0c00-41d0-b627-1f8dedfc6f34', N'05715bb4-191d-4963-ad24-786c65802812', N'97', N'Học viện Quân y', 0, NULL, N'17,06', NULL, N'Học viện Quân y', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'97@bqp.gov.vn', 1, N'AEhXZtbzm6G1WUpoMhBq0eouI7f80KJQBInvIrlevBGILX36b7aNVntgUZNml9UaVw==', N'303f9d0b-b430-4fe9-8cd9-b39acf61a9e2', NULL, 0, 0, NULL, 0, 0, N'97@bqp.gov.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'ba50168d-9d71-4113-9b8a-22b84cc1387f', N'05715bb4-191d-4963-ad24-786c65802812', N'17', N'Quân khu 7', 0, NULL, NULL, NULL, N'Quân khu 7', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'17@bqp.gov.vn', 1, N'AFimvOL9WIdynFTns3AAzYqBhOMnUA4EDnwosO2iA6xzIplT7htUSkRtX55wa0lQTA==', N'67834e53-45b0-47fa-ace2-7ff5aaf5ec30', NULL, 0, 0, NULL, 0, 0, N'17@bqp.gov.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'398908cd-d992-4960-a4d8-2815e065d42c', N'05715bb4-191d-4963-ad24-786c65802812', N'171', N'Quân khu 7 (Bệnh viện 7A)', 0, NULL, NULL, NULL, N'Quân khu 7 (Bệnh viện 7A)', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'171@bqp.gov.vn', 1, N'AOEO3JMreqSm8KE6QG38E9m6eGvKHtZqWNb6HTYi9MSa+TfBEnV579JPmrUym8Ixhg==', N'd68c3d02-1a4d-46fe-95ee-3095b16a4866', NULL, 0, 0, NULL, 0, 0, N'171@bqp.gov.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'0a9c2544-cf0a-4659-b753-29449c6ef0c1', N'05715bb4-191d-4963-ad24-786c65802812', N'151', N'Quân khu 5 (Bệnh viện 13)', 0, NULL, NULL, NULL, N'Quân khu 5 (Bệnh viện 13)', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'151@bqp.gov.vn', 1, N'ACERRFBgbrRfuquUwwX/iG1ZRNw4N/pdZ3vrnH6cnP5yxrZlVQZUSfh2tb1eQsimVQ==', N'edb652c7-c4b2-4655-ac8c-159242ba795a', NULL, 0, 0, NULL, 0, 0, N'151@bqp.gov.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'4d65cdfd-3feb-47e6-8de7-2a10c5444e56', N'05715bb4-191d-4963-ad24-786c65802812', N'42', N'BC Tăng thiết giáp', 0, NULL, NULL, NULL, N'BC Tăng thiết giáp', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'42@bqp.gov.vn', 1, N'ANdNSlz0oNHeUYQlbMo7soxBBK/7kNZx2LCpBDwBCMQdKp5Ne/WD/+ydmMJewQljxQ==', N'42b15316-8abf-4293-b070-e66102e1f265', NULL, 0, 0, NULL, 0, 0, N'42@bqp.gov.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'73985696-6252-40d5-a282-2f074be7fa4e', N'05715bb4-191d-4963-ad24-786c65802812', N'56', N'Tổng cục II', 0, NULL, NULL, NULL, N'Tổng cục II', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'56@bqp.gov.vn', 1, N'AEE4MYr6QjKUsTZb1Asq6rJlfgiM/V7l0SHi6plxhaLkF5k7Ck0JxI//fFtYidKfdA==', N'f40d1dc6-ef65-4c10-b842-1213e2559e4c', NULL, 0, 0, NULL, 0, 0, N'56@bqp.gov.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'49a2cabe-6cb3-46d4-ba09-373fd12da7a7', N'05715bb4-191d-4963-ad24-786c65802812', N'14', N'Quân khu 4', 0, NULL, NULL, NULL, N'Quân khu 4', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'14@bqp.gov.vn', 1, N'ANMNIDcpNegVm4KEjUSU7iFHVtS99i+ky/euHzNQvEpKyRy9xihDJMAufVi3ZsZcsA==', N'49279330-5449-4953-8786-3c6ae18e8f45', NULL, 0, 0, NULL, 0, 0, N'14@bqp.gov.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'058a4ccf-809f-4894-a275-384b9200fbc3', N'05715bb4-191d-4963-ad24-786c65802812', N'532', N'Tổng cục Hậu cần (Bệnh viện 105)', 0, NULL, NULL, NULL, N'Tổng cục Hậu cần (Bệnh viện 105)', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'532@bqp.gov.vn', 1, N'AFLAcf78vHgh7vTcOYsDrMw1iuPt/I9jfj4ddXbo5o+CD10p1u86gl5TxRdZ+77bkA==', N'e8a262fc-fbcc-442f-b764-8554b7c64eb3', NULL, 0, 0, NULL, 0, 0, N'532@bqp.gov.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'd226cfcc-81a8-4aa0-a9ac-39a7935abc54', N'05715bb4-191d-4963-ad24-786c65802812', N'61', N'Tổng cục CNQP', 0, NULL, NULL, NULL, N'Tổng cục CNQP', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'61@bqp.gov.vn', 1, N'AEX15vPqiuBntZGBIsK7uAgMaphiZo//J03wblMNnFOfUbRSdDkmZGnOhHBri+lxfw==', N'b6850092-f9c7-4b28-83c7-3ed36de7c889', NULL, 0, 0, NULL, 0, 0, N'61@bqp.gov.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'fa42ca28-2248-4678-ae5c-440b190593ed', N'05715bb4-191d-4963-ad24-786c65802812', N'78', N'Công ty TECAPRO', 0, NULL, NULL, NULL, N'Công ty TECAPRO', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'78@bqp.gov.vn', 1, N'AEXOVZxzNEBsqfgEuCfZjsEKIEJQEBQ5CzgMZ73gO5CmxCkhcBy3UiTdxK3+eXYqEw==', N'8f9a6b99-d9c9-4ba2-b3d0-7660eac7546a', NULL, 0, 0, NULL, 0, 0, N'78@bqp.gov.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'df9cc551-b640-446e-8676-4553e98ce973', N'05715bb4-191d-4963-ad24-786c65802812', N'88', N'TCT Đông Bắc', 0, NULL, NULL, NULL, N'TCT Đông Bắc', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'88@bqp.gov.vn', 1, N'AI3Vj0iN48w7DhfZf9hVzn4a5Is5kXpNqs+8J33VoLmy+R0wFJE2M6lQhLnAxtpQ9g==', N'3f29c539-a205-4457-8af4-ac93075aff2b', NULL, 0, 0, NULL, 0, 0, N'88@bqp.gov.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'718d5e1e-8042-49c5-b665-45d4b312d4e1', N'05715bb4-191d-4963-ad24-786c65802812', N'23', N'Quân đoàn 3', 0, NULL, NULL, NULL, N'Quân đoàn 3', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'23@bqp.gov.vn', 1, N'AAyEo9jp5zpWWmpb/X42dD0PV0dbFsgql7X9d5nb9UH0rEtJkZGxqTt9GIKjKKvy9Q==', N'63cd6bdf-369a-4bd1-8a32-40c368504eb2', NULL, 0, 0, NULL, 0, 0, N'23@bqp.gov.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'0bc24999-757c-445a-80f3-471e8f857810', N'05715bb4-191d-4963-ad24-786c65802812', N'971', N'Học viện Quân y (Viện Bỏng)', 0, NULL, NULL, NULL, N'Học viện Quân y (Viện Bỏng)', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'971@bqp.gov.vn', 1, N'AKIKf8HiTSEEsCt+BmW+9es2r32avhhPLpkmDpKSAHrc9GIyieGAQdS5xYim/qr4JQ==', N'9da0ba3b-54cf-4400-a693-648a7f2788a5', NULL, 0, 0, NULL, 0, 0, N'971@bqp.gov.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'57908618-02e4-4bc2-9a27-4933af02c09e', N'05715bb4-191d-4963-ad24-786c65802812', N'71', N'TCT XNK TH Vạn Xuân', 0, NULL, NULL, NULL, N'TCT XNK TH Vạn Xuân', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'71@bqp.gov.vn', 1, N'AIOookLT9vNC8fKKMYU2Mfwi5IWDUIe4dX3UXml3Z4+KItfK+UBeu0TNzSx0o4JrzQ==', N'e4fccd3f-b118-4b16-84e5-e75522d6d760', NULL, 0, 0, NULL, 0, 0, N'71@bqp.gov.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'10cc1057-0b14-4133-90bb-49e1ac980d29', N'05715bb4-191d-4963-ad24-786c65802812', N'57', N'BTL Bảo vệ Lăng ', 0, NULL, NULL, NULL, N'BTL Bảo vệ Lăng ', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'57@bqp.gov.vn', 1, N'AGKAhBwsTrhraH6sHsySUtqZfhoe0A67Ee+9ZNHnTXjCmjzAv2gbOuRg7B9SyyJidg==', N'fb817f39-3e73-4251-96b9-b321c65fde72', NULL, 0, 0, NULL, 0, 0, N'57@bqp.gov.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'5ebee82a-ab33-4727-b7d8-4b768ca28dd1', N'05715bb4-191d-4963-ad24-786c65802812', N'82', N'Học viện Lục quân', 0, NULL, NULL, NULL, N'Học viện Lục quân', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'82@bqp.gov.vn', 1, N'AA9HqdSoC+LxPWholrLUZncSVvtBeat7cKHLDIn+1yoOtWq7B1IAh+CGMkWwcwYhpQ==', N'17f93170-e12c-4af2-bb1c-11ac0a15edf5', NULL, 0, 0, NULL, 0, 0, N'82@bqp.gov.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'75b2f17d-c4a6-4a5c-92d3-4bbcbf1c8512', N'05715bb4-191d-4963-ad24-786c65802812', N'79', N'Viện Y học cổ truyền QĐ', 0, NULL, NULL, NULL, N'Viện Y học cổ truyền QĐ', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'79@bqp.gov.vn', 1, N'ABH4Vx5FSaXSvKDml7dB1ivPmQjoeOF81mrhi/aEqebFiTT47gA0jy3ECm8l6CYpSA==', N'd3e53a1a-976d-4e38-8b36-e8a8a323ba03', NULL, 0, 0, NULL, 0, 0, N'79@bqp.gov.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'43d1eb02-4b4c-4817-96ad-4f1e10765f24', N'05715bb4-191d-4963-ad24-786c65802812', N'76', N'Bệnh viện TƯ QĐ 108', 0, NULL, NULL, NULL, N'Bệnh viện TƯ QĐ 108', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'76@bqp.gov.vn', 1, N'AB3zQz54G7ra2Hge0nRN2BA2dCfxw2HlyLYHUF83frAvOnstEwyJZtTp54LeM758gg==', N'150dba89-dc4a-4a7e-8c79-b53386db08f6', NULL, 0, 0, NULL, 0, 0, N'76@bqp.gov.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'10c579dd-ce7e-4184-a2a3-4f7cf2796e1d', N'05715bb4-191d-4963-ad24-786c65802812', N'192', N'Quân khu 9 (Bệnh viện 121)', 0, NULL, NULL, NULL, N'Quân khu 9 (Bệnh viện 121)', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'192@bqp.gov.vn', 1, N'AEYNBwQh3dFYVEDaM2PYZq874i7rDd5KYpA52MFzXUNGYwPeLF3UsRLzN1uw4ZsQIQ==', N'7ed757b8-d4f8-4670-b37d-a7f26ca1f0ea', NULL, 0, 0, NULL, 0, 0, N'192@bqp.gov.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'0be1d50f-e15b-40e6-a2f4-5210699cbfd4', N'05715bb4-191d-4963-ad24-786c65802812', N'972', N'Học viện Quân y (Viện 103)', 0, NULL, NULL, NULL, N'Học viện Quân y (Viện 103)', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'972@bqp.gov.vn', 1, N'ACkqe1xiY6729qo9KXE8UzVt0sIukkDuEG7xqclUx80G7pIDfhSrXpbjSwPoYO1nWA==', N'fcb09e92-60ed-4d2e-90af-75e2863a64b9', NULL, 0, 0, NULL, 0, 0, N'972@bqp.gov.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'53985d42-2c95-4adc-9046-53065be32658', N'05715bb4-191d-4963-ad24-786c65802812', N'231', N'Quân đoàn 3 (Bệnh viện 211)', 0, NULL, NULL, NULL, N'Quân đoàn 3 (Bệnh viện 211)', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'231@bqp.gov.vn', 1, N'APypQjyPcGtNPHyQd1AHERMXTjhYbFNW/iJE0m4hsiqXlcB/7V+bOn6oszdsmD7lpg==', N'ef442811-d59c-4d6d-80b2-5f12679c3259', NULL, 0, 0, NULL, 0, 0, N'231@bqp.gov.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'916d4b24-931b-4f6c-8506-597040433bde', N'05715bb4-191d-4963-ad24-786c65802812', N'22', N'Quân đoàn 2', 0, NULL, NULL, NULL, N'Quân đoàn 2', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'22@bqp.gov.vn', 1, N'AHuX4cn0ay0brKE8lT6Yfid0YOPsB6SeTHRQCdaxJOXu0iyVSEeT4XPfrp7UxhtWkg==', N'15f97dab-eb75-48f7-8088-8fb80f20f7b1', NULL, 0, 0, NULL, 0, 0, N'22@bqp.gov.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'66a03ac7-1702-4661-b1a2-5a028f3cd268', N'05715bb4-191d-4963-ad24-786c65802812', N'132', N'Quân khu 3 (Bệnh viện 7)', 0, NULL, NULL, NULL, N'Quân khu 3 (Bệnh viện 7)', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'132@bqp.gov.vn', 1, N'AMSBBrskdNml0XWpE6Rru68BaKBHAptt7CrBOtwM48zKfYHfZ50/9o7TbwPmxwXETw==', N'54398bd3-1254-4a2a-bbf3-42d42c9ef2b1', NULL, 0, 0, NULL, 0, 0, N'132@bqp.gov.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'2cde8e06-aed3-43c5-a0ea-5d9abb2871e7', N'05715bb4-191d-4963-ad24-786c65802812', N'64', N'TCT 789', 0, NULL, NULL, NULL, N'TCT 789', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'64@bqp.gov.vn', 1, N'ACpLYkWTaQNCKA+ZmRwOjEWFOd45yh02Rg8rhdYt8dclb9wOK/y0eEehjQFmjSKFtA==', N'e9ef7ea0-353f-4c9a-b7c6-ec5bf47f2342', NULL, 0, 0, NULL, 0, 0, N'64@bqp.gov.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'16fb14f8-dcc5-4922-aae1-5e1fb1903f43', N'05715bb4-191d-4963-ad24-786c65802812', N'121', N'Quân khu 2 (Bệnh viện 6)', 0, NULL, NULL, NULL, N'Quân khu 2 (Bệnh viện 6)', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'121@bqp.gov.vn', 1, N'ALE7/3A8PbcL21+zLqcBgEGRCXnWZj900YPggXX5206O9lFZ1xkeml/oWmUka53DCA==', N'abb85098-56b0-4d48-838c-32dee10139aa', NULL, 0, 0, NULL, 0, 0, N'121@bqp.gov.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'd1acf82d-d820-46aa-ad58-5ee76d37c729', N'05715bb4-191d-4963-ad24-786c65802812', N'96', N'Học viện Hậu cần', 0, NULL, NULL, NULL, N'Học viện Hậu cần', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'96@bqp.gov.vn', 1, N'AAsifT/PuOiCSwrDHw/XggFdZ2OKWtZLG4J5CjpcOTtYN83ThG9IubeKfj6eSbq0QQ==', N'a62966aa-047d-4bd3-be31-8bdc18a03500', NULL, 0, 0, NULL, 0, 0, N'96@bqp.gov.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'a31a3a1d-ae62-4a61-ba38-61011ea13621', N'05715bb4-191d-4963-ad24-786c65802812', N'35', N'Binh đoàn 11', 0, NULL, NULL, NULL, N'Binh đoàn 11', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'35@bqp.gov.vn', 1, N'AApsTgJI1MtNdXu2h77pTyC7zha2ia3pZHpcU9p7QXTrAXRqaYC3H2W1IgdJf8AKQA==', N'1dcf35d2-aea3-4471-af96-6125b90c6e48', NULL, 0, 0, NULL, 0, 0, N'35@bqp.gov.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'a2a3f5a8-6ee4-42de-97cd-66d39bb6046a', N'05715bb4-191d-4963-ad24-786c65802812', N'241', N'Quân đoàn 4 (Bệnh viện 4)', 0, NULL, NULL, NULL, N'Quân đoàn 4 (Bệnh viện 4)', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'241@bqp.gov.vn', 1, N'AP4n/VfcovawT8yjSQNTUDeTlrrHVlK7zZiSdJkd5nvjjJdA249pSSC3+LFXlg6dLg==', N'f8067e26-adff-4b25-9347-c6ea34cfb133', NULL, 0, 0, NULL, 0, 0, N'241@bqp.gov.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'2adf179e-327a-4804-a18d-672eea5bda3b', N'05715bb4-191d-4963-ad24-786c65802812', N'34', N'Binh đoàn 16', 0, NULL, NULL, NULL, N'Binh đoàn 16', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'34@bqp.gov.vn', 1, N'AGwawXAH5F5WpuTYcn0ASSu0TMSAgUF/4OlvoQrqGIQLsc/qdo2pqPWvFA9sOBdj0A==', N'33927e18-5056-4781-96bc-0daa07ebe5b0', NULL, 0, 0, NULL, 0, 0, N'34@bqp.gov.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'260e4b53-4fe2-4a5c-9dd2-69b2be2b0e99', N'05715bb4-191d-4963-ad24-786c65802812', N'70', N'Tập đoàn CN - VT QĐ', 0, NULL, NULL, NULL, N'Tập đoàn CN - VT QĐ', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'70@bqp.gov.vn', 1, N'ABTmRQrg8+nshVdtIxDNYFGJ04TqQMPkYdCEEWxaCv89bavvWa1CSGctw46MtOfBNw==', N'0e657bac-981e-498a-84e4-695acb19a68b', NULL, 0, 0, NULL, 0, 0, N'70@bqp.gov.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'2e67d4bd-611d-4fc0-aad9-69ddeb461291', N'05715bb4-191d-4963-ad24-786c65802812', N'75', N'TT Nhiệt đới Việt-Nga', 0, NULL, NULL, NULL, N'TT Nhiệt đới Việt-Nga', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'75@bqp.gov.vn', 1, N'AK73W8QcGKJE7g18//cdUoUwJ1PVtRGH3mSIyHZfMNzZmOqCxFD18ezm3I46apLs5w==', N'31531198-dff1-4471-8f7a-16d852079a28', NULL, 0, 0, NULL, 0, 0, N'75@bqp.gov.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'384aee45-0a71-40cd-8fba-6d6d73a04e5c', N'05715bb4-191d-4963-ad24-786c65802812', N'191', N'Quân khu 9 (Bệnh viện 120)', 0, NULL, NULL, NULL, N'Quân khu 9 (Bệnh viện 120)', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'191@bqp.gov.vn', 1, N'AK4g66w+Q6tN4ecOMNBw5lS2JFVGOXpT53Kh4+pcUe68tHkLb4U5nH8wupTSInQhsQ==', N'4e6e663b-1aa8-4518-a4de-71bcd7535030', NULL, 0, 0, NULL, 0, 0, N'191@bqp.gov.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'22d5c8f9-f14b-448d-8e0c-6de4cf233eef', N'05715bb4-191d-4963-ad24-786c65802812', N'24', N'Quân đoàn 4', 0, NULL, NULL, NULL, N'Quân đoàn 4', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'24@bqp.gov.vn', 1, N'AJ+DJtXlegA+3xL/yYKCfbgunvl2Jql0ELe7sntvTIwVC3HMtrQA9soA/8Uap9cLcQ==', N'c56d869c-2731-4faf-b7a9-5081b7309c14', NULL, 0, 0, NULL, 0, 0, N'24@bqp.gov.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'9d744cd3-855a-4d80-bfe4-700ee0cb8868', N'05715bb4-191d-4963-ad24-786c65802812', N'13', N'Quân khu 3', 0, NULL, NULL, NULL, N'Quân khu 3', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'13@bqp.gov.vn', 1, N'ACTirot2DogcwBTJP3T3bHkFhDDk3tDg30otDDuDTyYcb2xd66L56m/2jfwwCblzQg==', N'ad46b013-c226-445a-983c-08cb0194c114', NULL, 0, 0, NULL, 0, 0, N'13@bqp.gov.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'61816e77-dfd1-4071-bb3a-722ee5c1197f', N'05715bb4-191d-4963-ad24-786c65802812', N'72', N'TCT XD Lũng Lô', 0, NULL, NULL, NULL, N'TCT XD Lũng Lô', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'72@bqp.gov.vn', 1, N'AN6PW0Uxp5BsZjtZMfysFsgqy+QA+i22ucwVluBzs/lDDokW8lNMeAsM2/TX02TUAQ==', N'f6e215af-f18b-453b-8dbc-9f7c8871ea04', NULL, 0, 0, NULL, 0, 0, N'72@bqp.gov.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'00643ee3-c618-4705-bf52-7519427ba990', N'05715bb4-191d-4963-ad24-786c65802812', N'11', N'Quân khu 1', 0, NULL, NULL, NULL, N'Quân khu 1', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'11@bqp.gov.vn', 1, N'AIUdZBoDjggBPNthTHP9w5T1nk56zOvn2UQ+hJykO4rMKgKAKmc3Whb/OxAksVDa4A==', N'38b2bcbb-04c1-4f00-939f-1ff6c2088045', NULL, 0, 0, NULL, 1, 0, N'11@bqp.gov.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'05715bb4-191d-4963-ad24-786c65802812', NULL, N'admin', N'Bộ Quốc Phòng (CTC)', 0, NULL, N'B1,B2,B3', NULL, N'Bộ Quốc Phòng (CTC)', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'admin@bqp.gov.vn', 1, N'APBuz/dTXDftAPzN/DhjkhyW6PBeLlYW0K9gjw9lAstQzNQkc72/DU3bnz2QSTZcEQ==', N'ef10ad9e-b823-4a4d-9e9e-6aa432fee671', NULL, 0, 0, NULL, 1, 0, N'admin@bqp.gov.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'23e2df91-d62b-44d8-ad33-7a2b6943c37d', N'05715bb4-191d-4963-ad24-786c65802812', N'65', N'Viện KH và CN Quân sự', 0, NULL, NULL, NULL, N'Viện KH và CN Quân sự', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'65@bqp.gov.vn', 1, N'AEIDQrsCcnvl+E5yCIkhgpbBJXj2ZcHWya97nYiwRWRaa5QAZvN5wvHrdcI4jfCCUQ==', N'16b6058a-6fa5-4c2c-8306-ee82c6f3b80d', NULL, 0, 0, NULL, 0, 0, N'65@bqp.gov.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'c21ba020-0737-4fc3-a4b2-7f9852f25940', N'05715bb4-191d-4963-ad24-786c65802812', N'131', N'Quân khu 3 (Bệnh viện 5)', 0, NULL, NULL, NULL, N'Quân khu 3 (Bệnh viện 5)', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'131@bqp.gov.vn', 1, N'AGjyiwhC0wiiu46tMJah9XdPnoQQwxaoVHDphEGlz+wteC234bnQf6E4gmluX+MsSg==', N'bf0b6512-6b94-4e5e-a402-0945a16bafcf', NULL, 0, 0, NULL, 0, 0, N'131@bqp.gov.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'16b41e0b-775f-4430-9b85-8011a1c8e7a9', N'05715bb4-191d-4963-ad24-786c65802812', N'53', N'Tổng cục Hậu cần', 0, NULL, NULL, NULL, N'Tổng cục Hậu cần', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'53@bqp.gov.vn', 1, N'AB411EEXA6TrCJpgJqT4Xhnw1xD+fG5dKdUSRTee6Q8M41LcnVUQRKZd0Ky4QZFURQ==', N'33c5da0f-96cc-4343-a8a6-94e9c80133bd', NULL, 0, 0, NULL, 0, 0, N'53@bqp.gov.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'c5920568-66c9-428f-94f7-85de5de3215d', N'05715bb4-191d-4963-ad24-786c65802812', N'531', N'Tổng cục Hậu cần (Bệnh viện 354)', 0, NULL, NULL, NULL, N'Tổng cục Hậu cần (Bệnh viện 354)', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'531@bqp.gov.vn', 1, N'AB0VKE+upKWRjymBA/EMhpQHQ2FGzRqEBA/CHQY1TWyuKvEW0KKARA8S0Ya22Ab35g==', N'ab420200-d2cb-4fab-a62f-887a30dbdde7', NULL, 0, 0, NULL, 0, 0, N'531@bqp.gov.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'c7fe9b22-7789-4020-b9f2-862455951668', N'05715bb4-191d-4963-ad24-786c65802812', N'19', N'Quân khu 9', 0, NULL, NULL, NULL, N'Quân khu 9', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'19@bqp.gov.vn', 1, N'ADrARFPEGZJYZgcr5GaRKT42PNQW7xiGH+qLIGVjN52USeXcrfRUtL0uSlVEUvFobA==', N'cd825322-1547-48d8-943a-f2e3434da4a1', NULL, 0, 0, NULL, 0, 0, N'19@bqp.gov.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'9dd2c03d-55f9-405e-8d62-865e37956d7f', N'05715bb4-191d-4963-ad24-786c65802812', N'92', N'TCT Thái Sơn', 0, NULL, NULL, NULL, N'TCT Thái Sơn', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'92@bqp.gov.vn', 1, N'ANZtQChhTzd2+A0+jyGJEl9lmdi7+oU0y8aefP0ATWtXsF/JEGWW5afexFPkpJSdsg==', N'3effd2ec-5d19-4662-967f-8b8f52f76921', NULL, 0, 0, NULL, 0, 0, N'92@bqp.gov.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'03a3a83d-5c59-4732-8760-87dbe3202126', N'05715bb4-191d-4963-ad24-786c65802812', N'534', N'Tổng cục Hậu cần (Bệnh viện Ung bướu và Phóng xạ)', 0, NULL, NULL, NULL, N'Tổng cục Hậu cần (Bệnh viện Ung bướu và Phóng xạ)', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'534@bqp.gov.vn', 1, N'ADkvLZxaXvNdixHwQVQEPLEFbUsOiZOAJ1KulRrQsHmarc1CLkqTXlZ7/ERQ5bUtaw==', N'21b25e40-5332-43d4-808f-91b352dc79af', NULL, 0, 0, NULL, 0, 0, N'534@bqp.gov.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'75f9429b-ad58-4627-89c1-8d9bc53a1729', N'05715bb4-191d-4963-ad24-786c65802812', N'55', N'Cục Bảo vệ', 0, NULL, NULL, NULL, N'Cục Bảo vệ', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'55@bqp.gov.vn', 1, N'AJdJpEQU8sfJ9l6BBOTWDIdC6DD86XjY6/cxLNJipy8a9vGhXtoAm2XxC1ItDl8BgA==', N'6ab594aa-cecc-4518-bdaf-9eee823f64a6', NULL, 0, 0, NULL, 0, 0, N'55@bqp.gov.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'c350851b-05fc-469d-a37c-8eb75a86b7b0', N'05715bb4-191d-4963-ad24-786c65802812', N'31', N'BTL Cảnh sát biển', 0, NULL, NULL, NULL, N'BTL Cảnh sát biển', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'31@bqp.gov.vn', 1, N'APsoyL3xyaiXwb7l9DBqjBeL9pP9ZRF3ZTPvJSfsH5hCYgpd48rylz5qIDV7aDN+hQ==', N'655a2b96-cc6c-49c2-ad77-078ab158a866', NULL, 0, 0, NULL, 0, 0, N'31@bqp.gov.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'70ffdb39-6c6b-4063-9e2e-93a25d2e6109', N'05715bb4-191d-4963-ad24-786c65802812', N'95', N'Học viện Kỹ thuật QS', 0, NULL, N'08', NULL, N'Học viện Kỹ thuật QS', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'95@bqp.gov.vn', 1, N'AKArWjNnXyt55g590gV2MVRUyz8pahUzrdFPw/evrb6e55WwkfZC0kI6FxlWjWhVdQ==', N'3ffff3d2-8584-42a2-911a-1e50ddeacab9', NULL, 0, 0, NULL, 0, 0, N'95@bqp.gov.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'187c1c78-4077-49a8-9268-93bd9f53dd25', N'05715bb4-191d-4963-ad24-786c65802812', N'89', N'TCT Trực thăng VN', 0, NULL, NULL, NULL, N'TCT Trực thăng VN', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'89@bqp.gov.vn', 1, N'AEMhKC+z3QqNMkjrKpQPqFOsoV8wennoAd94BnaVSJXZSId0TCW1DbRKbvkL9LuMWw==', N'85b544e9-5688-4ed5-8cb0-a36b8a41e6a4', NULL, 0, 0, NULL, 0, 0, N'89@bqp.gov.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'ddc59c79-6e76-4150-a126-980c49098708', N'05715bb4-191d-4963-ad24-786c65802812', N'81', N'Học viện Quốc phòng', 0, NULL, NULL, NULL, N'Học viện Quốc phòng', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'81@bqp.gov.vn', 1, N'AGs2HUyP1EIrc0fjMEwqelnnU++1KoqzK/w1Ao21pITIQzn/Y21F2K3Pm4YebccSQA==', N'83a5b169-f822-47e5-82dd-2a779b7e4d79', NULL, 0, 0, NULL, 0, 0, N'81@bqp.gov.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'ca00d734-9d14-4387-bd7b-9ac10863b3da', N'05715bb4-191d-4963-ad24-786c65802812', N'501', N'Binh đoàn 15 (Bệnh viện Quân y 15)', 0, NULL, NULL, NULL, N'Binh đoàn 15 (Bệnh viện Quân y 15)', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'501@bqp.gov.vn', 1, N'AB7Z0X1soQfyESv9NeNIJ+bP7WPEsDAmcHwKrVdy/P9QQpANqAAZWkUgHwH2oLarvA==', N'7b5ff4be-f5a5-4dc3-9f6e-4bbeda2cf250', NULL, 0, 0, NULL, 0, 0, N'501@bqp.gov.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'fbaf6523-3d39-4f77-b14d-9b4216605038', N'05715bb4-191d-4963-ad24-786c65802812', N'43', N'BC Pháo binh', 0, NULL, NULL, NULL, N'BC Pháo binh', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'43@bqp.gov.vn', 1, N'AAFKJNYEHGrdQTLXmULIiUe86Q+CtWWOSaebK+aF7pQSGImNI2+WFiF7lWpR9/sJKQ==', N'421b9316-6966-4f83-8795-ff27c514a8ca', NULL, 0, 0, NULL, 0, 0, N'43@bqp.gov.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'36e0b853-0a7d-4048-87f9-9d4d507dbeab', N'05715bb4-191d-4963-ad24-786c65802812', N'40', N'Bộ Tư lệnh 86', 0, NULL, NULL, NULL, N'Bộ Tư lệnh 86', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'40@bqp.gov.vn', 1, N'AKCghBR8Gi2NI8wBTKvmFPzfxqGQUwJMaGV9c9lxTuXdGKYxavt1evvcfBs+SiEBjg==', N'09282c74-985c-46fb-bfb2-89fa45d94535', NULL, 0, 0, NULL, 0, 0, N'40@bqp.gov.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'6cae287e-ea80-4e61-b6d3-a53f6f439ec8', NULL, N'admin', N'Vietnam', 0, NULL, NULL, NULL, N'Vietnam', NULL, CAST(N'2023-10-16T15:38:27.177' AS DateTime), CAST(N'2023-10-16T15:38:27.177' AS DateTime), N'admin@viettel.com.vn', 1, N'AI2BrkOaFJvfljgfvZPrcV8MDHlP6Gx9WR/WNTMUgE6xV0cKwPT/0/Rlmf4N3zZkDw==', N'e8c03a0b-b8bf-4808-af4d-532385ac0593', NULL, 0, 0, NULL, 0, 0, N'admin@viettel.com.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'85592878-3b52-420f-8d2b-adbaec314198', N'05715bb4-191d-4963-ad24-786c65802812', N'52', N'Tổng cục Chính trị', 0, NULL, NULL, NULL, N'Tổng cục Chính trị', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'52@bqp.gov.vn', 1, N'AA/3GjgSGQpGJ228KhACi+0q+a6+O8p18DZ8GBWlKQz1IxHDOMmaRU04qWCNcUV7ig==', N'd0c54415-5b0a-4fcc-8e4a-3c0ab54a24f6', NULL, 0, 0, NULL, 0, 0, N'52@bqp.gov.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'042e8da7-aecc-4257-af60-aee685a21595', N'05715bb4-191d-4963-ad24-786c65802812', N'84', N'Trường SQ Chính trị', 0, NULL, NULL, NULL, N'Trường SQ Chính trị', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'84@bqp.gov.vn', 1, N'ALMw1XfFYrxrrIf+ofy2gx8LLcsqwg0ms6CnXAAZxkGrvH4AUjmyCzmQr+qVOLH0xA==', N'b68bc025-6123-4e69-924e-5e7189c67a3c', NULL, 0, 0, NULL, 0, 0, N'84@bqp.gov.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'f3cf2c73-5032-4de4-8947-b0837eba2302', N'05715bb4-191d-4963-ad24-786c65802812', N'172', N'Quân khu 7 (Bệnh viện 7B)', 0, NULL, NULL, NULL, N'Quân khu 7 (Bệnh viện 7B)', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'172@bqp.gov.vn', 1, N'APxnoV76UTE8r1wlUVqEPgH49VwqAvaHSVHVhGqqxAM3y1zKqg1n7vYu8qN3sbJdvA==', N'9d2969a8-82ea-4492-aec9-e6a7943fc451', NULL, 0, 0, NULL, 0, 0, N'172@bqp.gov.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'5c4e4da8-85fb-45d9-8b75-b14d42f1db51', N'05715bb4-191d-4963-ad24-786c65802812', N'533', N'Tổng cục Hậu cần (Bệnh viện 87)', 0, NULL, NULL, NULL, N'Tổng cục Hậu cần (Bệnh viện 87)', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'533@bqp.gov.vn', 1, N'AJFyVl0JvA1QQdDIGAD1fZC/PU864fSiqY0nhjdW6Wmp/Rix0Jqpk+TFDV4W50zsLQ==', N'8bf33e88-3427-46a3-8a0f-d494cab861a9', NULL, 0, 0, NULL, 0, 0, N'533@bqp.gov.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'f6dcc9b4-ee1d-403b-b2b3-b39f612fc28c', N'05715bb4-191d-4963-ad24-786c65802812', N'33', N'Quân chủng Hải quân', 0, NULL, NULL, NULL, N'Quân chủng Hải quân', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'33@bqp.gov.vn', 1, N'AH47GiqTwHt3/HKS9obVeziPbrfjxxJgXyi5/wUgy/uIhJ8l51yXcxQP16iw/XcI0A==', N'cdb90af2-8019-46bd-b7c5-359041ee5665', NULL, 0, 0, NULL, 0, 0, N'33@bqp.gov.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'c0de7563-207f-45bf-a74f-b5badf8da29a', N'05715bb4-191d-4963-ad24-786c65802812', N'46', N'BC Hoá học', 0, NULL, NULL, NULL, N'BC Hoá học', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'46@bqp.gov.vn', 1, N'AHcwOw0LUEqjqJURJM/nmoMGtuqDSPh+iAiBD52YtznP9Ztq5e1cA0TjtpejKC3FUw==', N'dccf3a1c-633e-43fe-a8de-a64d89cabbc5', NULL, 0, 0, NULL, 0, 0, N'46@bqp.gov.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'05cd3545-6425-42a2-aa37-b7d8755d0d54', N'05715bb4-191d-4963-ad24-786c65802812', N'54', N'Đảm bảo CĐ, CS, phần chi TX', 0, NULL, NULL, NULL, N'Đảm bảo CĐ, CS, phần chi TX', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'54@bqp.gov.vn', 1, N'AOr2QBcxPIDrfJmee+icHtuxPFqrCMJCnSBkEZCdaFo984Bh2jFg/UxQeYcaepvNZA==', N'c6304d2d-106c-4699-8b23-42d9d962cc07', NULL, 0, 0, NULL, 0, 0, N'54@bqp.gov.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'85f7b3cd-89c6-498b-bd18-c04a536bac2b', N'05715bb4-191d-4963-ad24-786c65802812', N'98', N'Trường SQ Lục quân 2', 0, NULL, N'07,06', NULL, N'Trường SQ Lục quân 2', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'98@bqp.gov.vn', 1, N'AGQNtC21flEWN/40r7DfdE9YcNopYCz1f/S13cHgHqfoJmOqV+lQ//MoBvwjAVSgCQ==', N'e3f66973-b94d-4a0f-90c2-9de71fba6b8a', NULL, 0, 0, NULL, 0, 0, N'98@bqp.gov.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'a1c6311d-352c-413a-a8fc-c199e326cda6', N'05715bb4-191d-4963-ad24-786c65802812', N'69', N'TCT 319', 0, NULL, NULL, NULL, N'TCT 319', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'69@bqp.gov.vn', 1, N'AFfMWdMUw3vz3V/A54iNn6btn6Wu1vI7SjglIQEMg/7ZoXm56yvQmpoqKLf9RwHzRA==', N'96d58cfe-a579-4da9-a5d0-9acf8f6d4fd4', NULL, 0, 0, NULL, 0, 0, N'69@bqp.gov.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'be7c8028-f0fc-41bd-9d36-cccb4622d678', N'05715bb4-191d-4963-ad24-786c65802812', N'87', N'Trường SQ Lục quân 1', 0, NULL, NULL, NULL, N'Trường SQ Lục quân 1', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'87@bqp.gov.vn', 1, N'AE6NvPvA5xawtloyx+wRBYuYiWmXeBDfe6wcjCqGiCF5NgRqes9wpHe8dyjskEWIrg==', N'57ca3247-d32f-4964-82b3-b03b5c01b0b0', NULL, 0, 0, NULL, 0, 0, N'87@bqp.gov.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'b656bd8f-b07e-44c0-9579-ce00b0fd38bb', N'05715bb4-191d-4963-ad24-786c65802812', N'99', N'Tổng cục Kỹ thuật', 0, NULL, N'17,08', NULL, N'Tổng cục Kỹ thuật', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'99@bqp.gov.vn', 1, N'AOrb0CPz/2krddSV9a9Ghi8v7OFlZ+GCwLcR4J9R3An+BhI6IFTNLkhHacu/UbDppg==', N'e01bb1a7-75b8-4f03-ae63-5a7199b16f01', NULL, 0, 0, NULL, 0, 0, N'99@bqp.gov.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'9fd4ca2d-e3a5-4990-a350-d0363806de57', N'05715bb4-191d-4963-ad24-786c65802812', N'112', N'Quân khu 1 (Bệnh viện 110)', 0, NULL, NULL, NULL, N'Quân khu 1 (Bệnh viện 110)', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'112@bqp.gov.vn', 1, N'AGRrrcnLkLg27DCsR+GKC5eu6MMgjxFbE6Rm4eXpAhkoTBz67JQ2g1gCLjdoimBZ5w==', N'4cc46b9a-5e9c-4105-a7a5-8d1bd0b7d0c7', NULL, 0, 0, NULL, 0, 0, N'112@bqp.gov.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'bb179acb-961c-41df-a077-d096633b8fc8', N'05715bb4-191d-4963-ad24-786c65802812', N'47', N'BTL Bộ đội Biên phòng', 0, NULL, NULL, NULL, N'BTL Bộ đội Biên phòng', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'47@bqp.gov.vn', 1, N'AA7ISDpsb0jURVrHFyaYS8IzTJw4XFW468ALwE/wMamHu6Ab5stfaFQOyWky8OUT2g==', N'90d02c73-fce8-4154-add1-0ca116baef9b', NULL, 0, 0, NULL, 0, 0, N'47@bqp.gov.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'8ff5de49-b798-4973-bd99-d35738c45f35', N'05715bb4-191d-4963-ad24-786c65802812', N'291', N'QC Phòng không - Không quân (Viện y học Hàng không)', 0, NULL, NULL, NULL, N'QC Phòng không - Không quân (Viện y học Hàng không)', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'291@bqp.gov.vn', 1, N'AIWcwg69bzYUrjSMBNz52BYKW9fiyXaGavLPiEsXzTheMNMNWVmyTQuMwavJO+Cd9Q==', N'a9eee61b-4ffd-47e4-9a5f-bab6770c0898', NULL, 0, 0, NULL, 0, 0, N'291@bqp.gov.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'6f0d529c-30e5-4840-9a5a-d8ef2919efb3', N'05715bb4-191d-4963-ad24-786c65802812', N'83', N'Học viện Chính trị', 0, NULL, NULL, NULL, N'Học viện Chính trị', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'83@bqp.gov.vn', 1, N'AAr6QmoYeM53d0jSjcjDqLmWX1quWQf75n63RNOXHS+4uf7HMIbND2HChmAlY3fOIA==', N'2e7bb7a2-e84c-40d3-b031-1fa34067be6f', NULL, 0, 0, NULL, 0, 0, N'83@bqp.gov.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'c2c9c2a2-9c45-48c7-8169-dc86f12c3987', N'05715bb4-191d-4963-ad24-786c65802812', N'50', N'Binh đoàn 15', 0, NULL, NULL, NULL, N'Binh đoàn 15', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'50@bqp.gov.vn', 1, N'AOQ7qM4IKLYQzfgEu1yvsxBh0Y67CRvVmQbhr1zzGgSqi466RHWzTdcoN8lEP+0kDg==', N'2d9a6e3e-93eb-4bb9-b018-1d34e918c0da', NULL, 0, 0, NULL, 0, 0, N'50@bqp.gov.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'66932d07-4315-4dae-b8dd-dcb5c55a0632', N'05715bb4-191d-4963-ad24-786c65802812', N'331', N'Quân chủng Hải quân (Viện y học Hải quân)', 0, NULL, NULL, NULL, N'Quân chủng Hải quân (Viện y học Hải quân)', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'331@bqp.gov.vn', 1, N'AFvFwHZWeJBJMxEvLPCLb5/N43lFUk/L45R9E0hZf0U7q78PqIx85IqRWqmyf8Asmw==', N'3d13f16b-3e8b-47a4-ab73-a8c150f0f5f3', NULL, 0, 0, NULL, 0, 0, N'331@bqp.gov.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'acdf8d38-7066-4dcd-b02f-dd7450da3cf6', N'05715bb4-191d-4963-ad24-786c65802812', N'45', N'BC Đặc công', 0, NULL, NULL, NULL, N'BC Đặc công', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'45@bqp.gov.vn', 1, N'AP92mo/0voahR/x7uyxMjCD5M4P+x4TT1uaEx/1EhTPhmm7b+7taD743BKRCm0K6Kg==', N'4d128470-ad8a-4a03-b23d-7917765f0a47', NULL, 0, 0, NULL, 0, 0, N'45@bqp.gov.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'06b44f61-2057-472a-9550-de559be32abe', N'05715bb4-191d-4963-ad24-786c65802812', N'91', N'TCT Xăng dầu QĐ', 0, NULL, NULL, NULL, N'TCT Xăng dầu QĐ', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'91@bqp.gov.vn', 1, N'ACpbQYDmFGBqLHF2sx/vMfwPfZW84JAIN/IzW7TOhK/pW3QqACqywmW48n5sFRhHeg==', N'9ac57a13-f5f7-4d66-802b-222b8dc7c1d7', NULL, 0, 0, NULL, 0, 0, N'91@bqp.gov.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'dc22b4ca-744a-4d35-8ff8-dfeaf6789062', N'05715bb4-191d-4963-ad24-786c65802812', N'111', N'Quân khu 1 (Bệnh viện 91)', 0, NULL, NULL, NULL, N'Quân khu 1 (Bệnh viện 91)', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'111@bqp.gov.vn', 1, N'ALDWu8OYLzgv54+BgtvF8Coffha0LL17ZjLPXa1plYz4AZoX4nZGbev5+Q4IqCB4lA==', N'5397c3c7-f73e-466e-9be2-abc8f1eb20bc', NULL, 0, 0, NULL, 0, 0, N'111@bqp.gov.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'afad69fe-91f5-4560-80e7-e0e431bd8f0f', N'05715bb4-191d-4963-ad24-786c65802812', N'10', N'BTL Thủ đô Hà Nội', 0, NULL, NULL, NULL, N'BTL Thủ đô Hà Nội', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'10@bqp.gov.vn', 1, N'AHIKlsUN4GM1okWELLXeDaEJCVGneo9iElVReLaO0Dqn7+ILEUlHDnl3fRJqqmtbzQ==', N'bd1aacc5-e02e-43a6-840e-cfa14deaa7e4', NULL, 0, 0, NULL, 1, 0, N'10@bqp.gov.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'5a56c668-bbd2-4d36-a990-e3db03fa6735', N'05715bb4-191d-4963-ad24-786c65802812', N'44', N'BC Công binh', 0, NULL, NULL, NULL, N'BC Công binh', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'44@bqp.gov.vn', 1, N'AOUwFJh8YH3ZAHS7tnpHtcQ9S4A4E4H7rAqaDX4tnmr+mHMvNaFr8l15LHyJ5oWbEA==', N'4ed56947-93c8-44fe-9743-bc02c4da5500', NULL, 0, 0, NULL, 0, 0, N'44@bqp.gov.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'0bbfdba5-5dd7-4b37-9c35-e59d7a4ba053', N'05715bb4-191d-4963-ad24-786c65802812', N'73', N'TCT ĐTPT nhà và đô thị BQP', 0, NULL, NULL, NULL, N'TCT ĐTPT nhà và đô thị BQP', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'73@bqp.gov.vn', 1, N'AMMByNUzXw1Mx0fLrRCio7KS2NDqXzLVQT/g4yazpkEHLRUOek0Np4pGFlcCXd/3xA==', N'0eb7b4e6-017d-4b64-9318-103f0b26b966', NULL, 0, 0, NULL, 0, 0, N'73@bqp.gov.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'6bcce4bd-953f-4dbb-9fba-e5a852e75fe1', N'05715bb4-191d-4963-ad24-786c65802812', N'122', N'Quân khu 2 (Bệnh viện 109)', 0, NULL, NULL, NULL, N'Quân khu 2 (Bệnh viện 109)', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'122@bqp.gov.vn', 1, N'AIHnaZ5aybkugVeFv8229PEGEMrOh6G/bWWqV8+cYqhMDSme0JrDOUGops04zFklxg==', N'539a5bcd-8d38-4b39-af77-e2f9432734a9', NULL, 0, 0, NULL, 0, 0, N'122@bqp.gov.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'8e3b5ea6-6433-4918-9344-eaa6ffcc655c', N'05715bb4-191d-4963-ad24-786c65802812', N'142', N'Quân khu 4 (Bệnh viện 4)', 0, NULL, NULL, NULL, N'Quân khu 4 (Bệnh viện 4)', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'142@bqp.gov.vn', 1, N'AM8sE6ztj3MK3WuvOlGoLGPlZP/V+SReiFfBZA3qpSGH+ZyT8l5rZ9mFgzIiNBYa4A==', N'2fb8bddd-fea3-48de-bdfd-d3b699986f5c', NULL, 0, 0, NULL, 0, 0, N'142@bqp.gov.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'd94042cc-05a0-4f94-8dc0-eb68965ee3c5', N'05715bb4-191d-4963-ad24-786c65802812', N'29', N'QC Phòng không - Không quân', 0, NULL, NULL, NULL, N'QC Phòng không - Không quân', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'29@bqp.gov.vn', 1, N'AB1TQFGjB9HjWTXi0dygLhdgLruy8fLKl1nW42SPBEqlT1CW1L7BccnnUmOkW3vKWw==', N'a6f4b77d-f3de-496a-ba47-741708113733', NULL, 0, 0, NULL, 0, 0, N'29@bqp.gov.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'5bbb6024-0695-481c-aa45-f14ca19c8708', N'05715bb4-191d-4963-ad24-786c65802812', N'12', N'Quân khu 2', 0, NULL, NULL, NULL, N'Quân khu 2', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'12@bqp.gov.vn', 1, N'AG63EGA7/+2Oh1mSOBTlLc+ZopHjOIZTxIRKF/Z5JZZKbrQ23RbCPrFsYSLbhXttzw==', N'0c606a07-f5b7-423e-8de3-52fae0d9c71d', NULL, 0, 0, NULL, 0, 0, N'12@bqp.gov.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'19f897f3-72e2-4058-bdb3-f332bd4c734b', N'05715bb4-191d-4963-ad24-786c65802812', N'93', N'TCT 36 - CTCP', 0, NULL, NULL, NULL, N'TCT 36 - CTCP', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'93@bqp.gov.vn', 1, N'AA6ifGi2lfqwUJwOKEza7VGRSCZBaDXdS7XhCbPcMW1mG6a2mAFDtMAWuGKkvN2lXg==', N'e6e5758a-d1ce-465e-b39d-120011e91fb4', NULL, 0, 0, NULL, 0, 0, N'93@bqp.gov.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'a90778dc-d3a7-4cbf-afaa-f571e90724cd', N'05715bb4-191d-4963-ad24-786c65802812', N'21', N'Quân đoàn 1', 0, NULL, NULL, NULL, N'Quân đoàn 1', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'21@bqp.gov.vn', 1, N'ABjz49qbDhSyHwRMGfGnOuRd+qF70BdSyfSBnYFyqbzSnVXOF7OWFDZWmHX5W9vKYQ==', N'd05f6eb8-8f52-4a0e-916e-84857e906fae', NULL, 0, 0, NULL, 0, 0, N'21@bqp.gov.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'187fb8df-b36b-4298-a678-f727a093b46d', N'05715bb4-191d-4963-ad24-786c65802812', N'90', N'Công ty tư vấn thiết kế & ĐT XD', 0, NULL, NULL, NULL, N'Công ty tư vấn thiết kế & ĐT XD', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'90@bqp.gov.vn', 1, N'AJ6oDVPCuStEKUmObgwTsJ6cm0UascqriNRieHuLxW7fPc8jaFby9gxmYHNAvCgIdg==', N'1c36119c-a82d-4959-a633-3348880efce5', NULL, 0, 0, NULL, 0, 0, N'90@bqp.gov.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'4fb5daff-5b66-4911-aebb-fa2e03eea619', N'05715bb4-191d-4963-ad24-786c65802812', N'77', N'Bệnh viện 175', 0, NULL, NULL, NULL, N'Bệnh viện 175', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'77@bqp.gov.vn', 1, N'ALPAo2UEi9UVpaY68WucyDhhCJt4woRk35u2lI+SX5ORw26Zq9WSrBlQ/NCPeawV1g==', N'd1236858-1a4c-46ed-ac9c-91cbda08183e', NULL, 0, 0, NULL, 0, 0, N'77@bqp.gov.vn')
GO
INSERT [dbo].[User] ([Id], [ParentId], [Code], [Name], [Ordinal], [Rank], [Department], [Description], [Hometown], [ProfilePicture], [CreatedAt], [UpdatedAt], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'58828fee-5b79-4b2a-80e6-fc2d47506d53', N'05715bb4-191d-4963-ad24-786c65802812', N'341', N'Binh đoàn 16 (Bệnh viện Quân y 16)', 0, NULL, NULL, NULL, N'Binh đoàn 16 (Bệnh viện Quân y 16)', NULL, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'341@bqp.gov.vn', 1, N'AGoWqt9juMZ4BszUevY537DM5bSN2TsAuZipcmXKmBkWZiXVn1QTWRghkJWjv/DSqg==', N'27aad453-ecd9-4949-8cd6-ada184ce10f9', NULL, 0, 0, NULL, 0, 0, N'341@bqp.gov.vn')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'05715bb4-191d-4963-ad24-786c65802812', N'ea5cd9ee-1c3f-46b6-85da-220e994693aa')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'6cae287e-ea80-4e61-b6d3-a53f6f439ec8', N'ea5cd9ee-1c3f-46b6-85da-220e994693aa')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'05715bb4-191d-4963-ad24-786c65802812', N'b425d62d-135d-4f5e-8bef-4024e77d3886')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'6cae287e-ea80-4e61-b6d3-a53f6f439ec8', N'b425d62d-135d-4f5e-8bef-4024e77d3886')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'd7d3d7fb-326e-45de-be5f-035500fdf935', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'0003cbad-a514-4cc2-a9fa-04a5cf9af814', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'a7bf9646-4dda-4ee3-8851-051eeb3e64d7', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'73c461b5-f8f8-4166-9acd-0616de10ea0e', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'79c839e0-8c05-462e-8590-08a7055677f0', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'51dedf12-24cc-4f06-9d0c-0f9aa3d76307', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'e0e40dc5-ff3e-442e-88ee-11d44c6a5060', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'4622cd7d-19f8-41f5-97f4-145c54f0e80f', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'f0717bcb-0c00-41d0-b627-1f8dedfc6f34', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'ba50168d-9d71-4113-9b8a-22b84cc1387f', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'398908cd-d992-4960-a4d8-2815e065d42c', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'0a9c2544-cf0a-4659-b753-29449c6ef0c1', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'4d65cdfd-3feb-47e6-8de7-2a10c5444e56', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'73985696-6252-40d5-a282-2f074be7fa4e', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'49a2cabe-6cb3-46d4-ba09-373fd12da7a7', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'058a4ccf-809f-4894-a275-384b9200fbc3', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'd226cfcc-81a8-4aa0-a9ac-39a7935abc54', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'fa42ca28-2248-4678-ae5c-440b190593ed', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'df9cc551-b640-446e-8676-4553e98ce973', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'718d5e1e-8042-49c5-b665-45d4b312d4e1', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'0bc24999-757c-445a-80f3-471e8f857810', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'57908618-02e4-4bc2-9a27-4933af02c09e', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'10cc1057-0b14-4133-90bb-49e1ac980d29', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'5ebee82a-ab33-4727-b7d8-4b768ca28dd1', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'75b2f17d-c4a6-4a5c-92d3-4bbcbf1c8512', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'43d1eb02-4b4c-4817-96ad-4f1e10765f24', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'10c579dd-ce7e-4184-a2a3-4f7cf2796e1d', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'0be1d50f-e15b-40e6-a2f4-5210699cbfd4', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'53985d42-2c95-4adc-9046-53065be32658', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'916d4b24-931b-4f6c-8506-597040433bde', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'66a03ac7-1702-4661-b1a2-5a028f3cd268', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'2cde8e06-aed3-43c5-a0ea-5d9abb2871e7', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'16fb14f8-dcc5-4922-aae1-5e1fb1903f43', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'd1acf82d-d820-46aa-ad58-5ee76d37c729', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'a31a3a1d-ae62-4a61-ba38-61011ea13621', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'a2a3f5a8-6ee4-42de-97cd-66d39bb6046a', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'2adf179e-327a-4804-a18d-672eea5bda3b', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'260e4b53-4fe2-4a5c-9dd2-69b2be2b0e99', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'2e67d4bd-611d-4fc0-aad9-69ddeb461291', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'384aee45-0a71-40cd-8fba-6d6d73a04e5c', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'22d5c8f9-f14b-448d-8e0c-6de4cf233eef', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'9d744cd3-855a-4d80-bfe4-700ee0cb8868', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'61816e77-dfd1-4071-bb3a-722ee5c1197f', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'00643ee3-c618-4705-bf52-7519427ba990', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'05715bb4-191d-4963-ad24-786c65802812', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'23e2df91-d62b-44d8-ad33-7a2b6943c37d', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'c21ba020-0737-4fc3-a4b2-7f9852f25940', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'16b41e0b-775f-4430-9b85-8011a1c8e7a9', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'c5920568-66c9-428f-94f7-85de5de3215d', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'c7fe9b22-7789-4020-b9f2-862455951668', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'9dd2c03d-55f9-405e-8d62-865e37956d7f', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'03a3a83d-5c59-4732-8760-87dbe3202126', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'75f9429b-ad58-4627-89c1-8d9bc53a1729', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'c350851b-05fc-469d-a37c-8eb75a86b7b0', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'70ffdb39-6c6b-4063-9e2e-93a25d2e6109', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'187c1c78-4077-49a8-9268-93bd9f53dd25', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'ddc59c79-6e76-4150-a126-980c49098708', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'ca00d734-9d14-4387-bd7b-9ac10863b3da', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'fbaf6523-3d39-4f77-b14d-9b4216605038', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'36e0b853-0a7d-4048-87f9-9d4d507dbeab', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'6cae287e-ea80-4e61-b6d3-a53f6f439ec8', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'85592878-3b52-420f-8d2b-adbaec314198', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'042e8da7-aecc-4257-af60-aee685a21595', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'f3cf2c73-5032-4de4-8947-b0837eba2302', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'5c4e4da8-85fb-45d9-8b75-b14d42f1db51', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'f6dcc9b4-ee1d-403b-b2b3-b39f612fc28c', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'c0de7563-207f-45bf-a74f-b5badf8da29a', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'05cd3545-6425-42a2-aa37-b7d8755d0d54', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'85f7b3cd-89c6-498b-bd18-c04a536bac2b', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'a1c6311d-352c-413a-a8fc-c199e326cda6', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'be7c8028-f0fc-41bd-9d36-cccb4622d678', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'b656bd8f-b07e-44c0-9579-ce00b0fd38bb', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'9fd4ca2d-e3a5-4990-a350-d0363806de57', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'bb179acb-961c-41df-a077-d096633b8fc8', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'8ff5de49-b798-4973-bd99-d35738c45f35', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'6f0d529c-30e5-4840-9a5a-d8ef2919efb3', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'c2c9c2a2-9c45-48c7-8169-dc86f12c3987', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'66932d07-4315-4dae-b8dd-dcb5c55a0632', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'acdf8d38-7066-4dcd-b02f-dd7450da3cf6', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'06b44f61-2057-472a-9550-de559be32abe', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'dc22b4ca-744a-4d35-8ff8-dfeaf6789062', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'afad69fe-91f5-4560-80e7-e0e431bd8f0f', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'5a56c668-bbd2-4d36-a990-e3db03fa6735', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'0bbfdba5-5dd7-4b37-9c35-e59d7a4ba053', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'6bcce4bd-953f-4dbb-9fba-e5a852e75fe1', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'8e3b5ea6-6433-4918-9344-eaa6ffcc655c', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'd94042cc-05a0-4f94-8dc0-eb68965ee3c5', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'5bbb6024-0695-481c-aa45-f14ca19c8708', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'19f897f3-72e2-4058-bdb3-f332bd4c734b', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'a90778dc-d3a7-4cbf-afaa-f571e90724cd', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'187fb8df-b36b-4298-a678-f727a093b46d', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'4fb5daff-5b66-4911-aebb-fa2e03eea619', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'58828fee-5b79-4b2a-80e6-fc2d47506d53', N'b784c0ee-0f9e-427d-b216-6e08b8849717')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'd7d3d7fb-326e-45de-be5f-035500fdf935', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'0003cbad-a514-4cc2-a9fa-04a5cf9af814', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'a7bf9646-4dda-4ee3-8851-051eeb3e64d7', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'73c461b5-f8f8-4166-9acd-0616de10ea0e', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'79c839e0-8c05-462e-8590-08a7055677f0', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'51dedf12-24cc-4f06-9d0c-0f9aa3d76307', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'e0e40dc5-ff3e-442e-88ee-11d44c6a5060', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'4622cd7d-19f8-41f5-97f4-145c54f0e80f', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'f0717bcb-0c00-41d0-b627-1f8dedfc6f34', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'ba50168d-9d71-4113-9b8a-22b84cc1387f', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'398908cd-d992-4960-a4d8-2815e065d42c', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'0a9c2544-cf0a-4659-b753-29449c6ef0c1', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'4d65cdfd-3feb-47e6-8de7-2a10c5444e56', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'73985696-6252-40d5-a282-2f074be7fa4e', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'49a2cabe-6cb3-46d4-ba09-373fd12da7a7', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'058a4ccf-809f-4894-a275-384b9200fbc3', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'd226cfcc-81a8-4aa0-a9ac-39a7935abc54', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'fa42ca28-2248-4678-ae5c-440b190593ed', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'df9cc551-b640-446e-8676-4553e98ce973', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'718d5e1e-8042-49c5-b665-45d4b312d4e1', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'0bc24999-757c-445a-80f3-471e8f857810', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'57908618-02e4-4bc2-9a27-4933af02c09e', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'10cc1057-0b14-4133-90bb-49e1ac980d29', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'5ebee82a-ab33-4727-b7d8-4b768ca28dd1', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'75b2f17d-c4a6-4a5c-92d3-4bbcbf1c8512', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'43d1eb02-4b4c-4817-96ad-4f1e10765f24', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'10c579dd-ce7e-4184-a2a3-4f7cf2796e1d', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'0be1d50f-e15b-40e6-a2f4-5210699cbfd4', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'53985d42-2c95-4adc-9046-53065be32658', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'916d4b24-931b-4f6c-8506-597040433bde', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'66a03ac7-1702-4661-b1a2-5a028f3cd268', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'2cde8e06-aed3-43c5-a0ea-5d9abb2871e7', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'16fb14f8-dcc5-4922-aae1-5e1fb1903f43', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'd1acf82d-d820-46aa-ad58-5ee76d37c729', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'a31a3a1d-ae62-4a61-ba38-61011ea13621', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'a2a3f5a8-6ee4-42de-97cd-66d39bb6046a', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'2adf179e-327a-4804-a18d-672eea5bda3b', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'260e4b53-4fe2-4a5c-9dd2-69b2be2b0e99', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'2e67d4bd-611d-4fc0-aad9-69ddeb461291', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'384aee45-0a71-40cd-8fba-6d6d73a04e5c', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'22d5c8f9-f14b-448d-8e0c-6de4cf233eef', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'9d744cd3-855a-4d80-bfe4-700ee0cb8868', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'61816e77-dfd1-4071-bb3a-722ee5c1197f', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'00643ee3-c618-4705-bf52-7519427ba990', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'05715bb4-191d-4963-ad24-786c65802812', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'23e2df91-d62b-44d8-ad33-7a2b6943c37d', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'c21ba020-0737-4fc3-a4b2-7f9852f25940', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'16b41e0b-775f-4430-9b85-8011a1c8e7a9', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'c5920568-66c9-428f-94f7-85de5de3215d', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'c7fe9b22-7789-4020-b9f2-862455951668', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'9dd2c03d-55f9-405e-8d62-865e37956d7f', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'03a3a83d-5c59-4732-8760-87dbe3202126', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'75f9429b-ad58-4627-89c1-8d9bc53a1729', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'c350851b-05fc-469d-a37c-8eb75a86b7b0', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'70ffdb39-6c6b-4063-9e2e-93a25d2e6109', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'187c1c78-4077-49a8-9268-93bd9f53dd25', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'ddc59c79-6e76-4150-a126-980c49098708', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'ca00d734-9d14-4387-bd7b-9ac10863b3da', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'fbaf6523-3d39-4f77-b14d-9b4216605038', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'36e0b853-0a7d-4048-87f9-9d4d507dbeab', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'6cae287e-ea80-4e61-b6d3-a53f6f439ec8', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'85592878-3b52-420f-8d2b-adbaec314198', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'042e8da7-aecc-4257-af60-aee685a21595', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'f3cf2c73-5032-4de4-8947-b0837eba2302', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'5c4e4da8-85fb-45d9-8b75-b14d42f1db51', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'f6dcc9b4-ee1d-403b-b2b3-b39f612fc28c', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'c0de7563-207f-45bf-a74f-b5badf8da29a', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'05cd3545-6425-42a2-aa37-b7d8755d0d54', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'85f7b3cd-89c6-498b-bd18-c04a536bac2b', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'a1c6311d-352c-413a-a8fc-c199e326cda6', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'be7c8028-f0fc-41bd-9d36-cccb4622d678', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'b656bd8f-b07e-44c0-9579-ce00b0fd38bb', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'9fd4ca2d-e3a5-4990-a350-d0363806de57', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'bb179acb-961c-41df-a077-d096633b8fc8', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'8ff5de49-b798-4973-bd99-d35738c45f35', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'6f0d529c-30e5-4840-9a5a-d8ef2919efb3', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'c2c9c2a2-9c45-48c7-8169-dc86f12c3987', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'66932d07-4315-4dae-b8dd-dcb5c55a0632', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'acdf8d38-7066-4dcd-b02f-dd7450da3cf6', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'06b44f61-2057-472a-9550-de559be32abe', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'dc22b4ca-744a-4d35-8ff8-dfeaf6789062', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'afad69fe-91f5-4560-80e7-e0e431bd8f0f', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'5a56c668-bbd2-4d36-a990-e3db03fa6735', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'0bbfdba5-5dd7-4b37-9c35-e59d7a4ba053', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'6bcce4bd-953f-4dbb-9fba-e5a852e75fe1', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'8e3b5ea6-6433-4918-9344-eaa6ffcc655c', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'd94042cc-05a0-4f94-8dc0-eb68965ee3c5', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'5bbb6024-0695-481c-aa45-f14ca19c8708', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'19f897f3-72e2-4058-bdb3-f332bd4c734b', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'a90778dc-d3a7-4cbf-afaa-f571e90724cd', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'187fb8df-b36b-4298-a678-f727a093b46d', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'4fb5daff-5b66-4911-aebb-fa2e03eea619', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'58828fee-5b79-4b2a-80e6-fc2d47506d53', N'cbc98ab5-756f-42e5-a2e1-d407a7266d2f')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'05715bb4-191d-4963-ad24-786c65802812', N'752462d6-f26d-4bd1-8570-f9beaf54699b')
GO
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (N'6cae287e-ea80-4e61-b6d3-a53f6f439ec8', N'752462d6-f26d-4bd1-8570-f9beaf54699b')
GO
SET IDENTITY_INSERT [dbo].[UserClaim] ON 
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (1, N'6cae287e-ea80-4e61-b6d3-a53f6f439ec8', N'Approved', N'Approved')
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (2, N'05715bb4-191d-4963-ad24-786c65802812', N'Approved', N'Approved')
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (6, N'85f7b3cd-89c6-498b-bd18-c04a536bac2b', N'Approved', N'Approved')
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (8, N'd7d3d7fb-326e-45de-be5f-035500fdf935', N'Approved', N'Approved')
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (9, N'0003cbad-a514-4cc2-a9fa-04a5cf9af814', N'Approved', N'Approved')
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (10, N'a7bf9646-4dda-4ee3-8851-051eeb3e64d7', N'Approved', N'Approved')
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (11, N'73c461b5-f8f8-4166-9acd-0616de10ea0e', N'Approved', N'Approved')
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (12, N'79c839e0-8c05-462e-8590-08a7055677f0', N'Approved', N'Approved')
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (13, N'51dedf12-24cc-4f06-9d0c-0f9aa3d76307', N'Approved', N'Approved')
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (14, N'e0e40dc5-ff3e-442e-88ee-11d44c6a5060', N'Approved', N'Approved')
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (15, N'4622cd7d-19f8-41f5-97f4-145c54f0e80f', N'Approved', N'Approved')
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (16, N'ba50168d-9d71-4113-9b8a-22b84cc1387f', N'Approved', N'Approved')
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (17, N'398908cd-d992-4960-a4d8-2815e065d42c', N'Approved', N'Approved')
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (18, N'0a9c2544-cf0a-4659-b753-29449c6ef0c1', N'Approved', N'Approved')
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (19, N'4d65cdfd-3feb-47e6-8de7-2a10c5444e56', N'Approved', N'Approved')
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (20, N'73985696-6252-40d5-a282-2f074be7fa4e', N'Approved', N'Approved')
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (21, N'49a2cabe-6cb3-46d4-ba09-373fd12da7a7', N'Approved', N'Approved')
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (22, N'058a4ccf-809f-4894-a275-384b9200fbc3', N'Approved', N'Approved')
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (23, N'd226cfcc-81a8-4aa0-a9ac-39a7935abc54', N'Approved', N'Approved')
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (24, N'fa42ca28-2248-4678-ae5c-440b190593ed', N'Approved', N'Approved')
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (25, N'df9cc551-b640-446e-8676-4553e98ce973', N'Approved', N'Approved')
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (26, N'718d5e1e-8042-49c5-b665-45d4b312d4e1', N'Approved', N'Approved')
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (27, N'0bc24999-757c-445a-80f3-471e8f857810', N'Approved', N'Approved')
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (28, N'57908618-02e4-4bc2-9a27-4933af02c09e', N'Approved', N'Approved')
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (29, N'10cc1057-0b14-4133-90bb-49e1ac980d29', N'Approved', N'Approved')
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (30, N'5ebee82a-ab33-4727-b7d8-4b768ca28dd1', N'Approved', N'Approved')
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (31, N'75b2f17d-c4a6-4a5c-92d3-4bbcbf1c8512', N'Approved', N'Approved')
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (32, N'43d1eb02-4b4c-4817-96ad-4f1e10765f24', N'Approved', N'Approved')
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (33, N'10c579dd-ce7e-4184-a2a3-4f7cf2796e1d', N'Approved', N'Approved')
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (34, N'0be1d50f-e15b-40e6-a2f4-5210699cbfd4', N'Approved', N'Approved')
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (35, N'53985d42-2c95-4adc-9046-53065be32658', N'Approved', N'Approved')
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (36, N'916d4b24-931b-4f6c-8506-597040433bde', N'Approved', N'Approved')
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (37, N'66a03ac7-1702-4661-b1a2-5a028f3cd268', N'Approved', N'Approved')
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (38, N'2cde8e06-aed3-43c5-a0ea-5d9abb2871e7', N'Approved', N'Approved')
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (39, N'16fb14f8-dcc5-4922-aae1-5e1fb1903f43', N'Approved', N'Approved')
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (41, N'a31a3a1d-ae62-4a61-ba38-61011ea13621', N'Approved', N'Approved')
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (42, N'a2a3f5a8-6ee4-42de-97cd-66d39bb6046a', N'Approved', N'Approved')
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (43, N'2adf179e-327a-4804-a18d-672eea5bda3b', N'Approved', N'Approved')
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (44, N'260e4b53-4fe2-4a5c-9dd2-69b2be2b0e99', N'Approved', N'Approved')
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (45, N'2e67d4bd-611d-4fc0-aad9-69ddeb461291', N'Approved', N'Approved')
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (46, N'2e67d4bd-611d-4fc0-aad9-69ddeb461291', N'Approved', N'Approved')
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (47, N'384aee45-0a71-40cd-8fba-6d6d73a04e5c', N'Approved', N'Approved')
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (48, N'22d5c8f9-f14b-448d-8e0c-6de4cf233eef', N'Approved', N'Approved')
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (49, N'9d744cd3-855a-4d80-bfe4-700ee0cb8868', N'Approved', N'Approved')
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (50, N'61816e77-dfd1-4071-bb3a-722ee5c1197f', N'Approved', N'Approved')
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (51, N'00643ee3-c618-4705-bf52-7519427ba990', N'Approved', N'Approved')
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (52, N'23e2df91-d62b-44d8-ad33-7a2b6943c37d', N'Approved', N'Approved')
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (53, N'c21ba020-0737-4fc3-a4b2-7f9852f25940', N'Approved', N'Approved')
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (54, N'16b41e0b-775f-4430-9b85-8011a1c8e7a9', N'Approved', N'Approved')
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (55, N'c5920568-66c9-428f-94f7-85de5de3215d', N'Approved', N'Approved')
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (56, N'c7fe9b22-7789-4020-b9f2-862455951668', N'Approved', N'Approved')
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (57, N'9dd2c03d-55f9-405e-8d62-865e37956d7f', N'Approved', N'Approved')
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (58, N'9dd2c03d-55f9-405e-8d62-865e37956d7f', N'Approved', N'Approved')
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (59, N'03a3a83d-5c59-4732-8760-87dbe3202126', N'Approved', N'Approved')
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (60, N'75f9429b-ad58-4627-89c1-8d9bc53a1729', N'Approved', N'Approved')
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (61, N'c350851b-05fc-469d-a37c-8eb75a86b7b0', N'Approved', N'Approved')
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (63, N'187c1c78-4077-49a8-9268-93bd9f53dd25', N'Approved', N'Approved')
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (64, N'ddc59c79-6e76-4150-a126-980c49098708', N'Approved', N'Approved')
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (65, N'ca00d734-9d14-4387-bd7b-9ac10863b3da', N'Approved', N'Approved')
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (66, N'fbaf6523-3d39-4f77-b14d-9b4216605038', N'Approved', N'Approved')
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (67, N'36e0b853-0a7d-4048-87f9-9d4d507dbeab', N'Approved', N'Approved')
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (68, N'85592878-3b52-420f-8d2b-adbaec314198', N'Approved', N'Approved')
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (69, N'042e8da7-aecc-4257-af60-aee685a21595', N'Approved', N'Approved')
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (70, N'f3cf2c73-5032-4de4-8947-b0837eba2302', N'Approved', N'Approved')
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (71, N'5c4e4da8-85fb-45d9-8b75-b14d42f1db51', N'Approved', N'Approved')
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (72, N'f6dcc9b4-ee1d-403b-b2b3-b39f612fc28c', N'Approved', N'Approved')
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (73, N'c0de7563-207f-45bf-a74f-b5badf8da29a', N'Approved', N'Approved')
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (74, N'05cd3545-6425-42a2-aa37-b7d8755d0d54', N'Approved', N'Approved')
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (75, N'a1c6311d-352c-413a-a8fc-c199e326cda6', N'Approved', N'Approved')
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (76, N'be7c8028-f0fc-41bd-9d36-cccb4622d678', N'Approved', N'Approved')
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (78, N'9fd4ca2d-e3a5-4990-a350-d0363806de57', N'Approved', N'Approved')
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (79, N'bb179acb-961c-41df-a077-d096633b8fc8', N'Approved', N'Approved')
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (80, N'8ff5de49-b798-4973-bd99-d35738c45f35', N'Approved', N'Approved')
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (81, N'6f0d529c-30e5-4840-9a5a-d8ef2919efb3', N'Approved', N'Approved')
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (82, N'c2c9c2a2-9c45-48c7-8169-dc86f12c3987', N'Approved', N'Approved')
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (83, N'66932d07-4315-4dae-b8dd-dcb5c55a0632', N'Approved', N'Approved')
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (84, N'acdf8d38-7066-4dcd-b02f-dd7450da3cf6', N'Approved', N'Approved')
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (85, N'06b44f61-2057-472a-9550-de559be32abe', N'Approved', N'Approved')
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (86, N'dc22b4ca-744a-4d35-8ff8-dfeaf6789062', N'Approved', N'Approved')
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (87, N'afad69fe-91f5-4560-80e7-e0e431bd8f0f', N'Approved', N'Approved')
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (88, N'5a56c668-bbd2-4d36-a990-e3db03fa6735', N'Approved', N'Approved')
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (89, N'0bbfdba5-5dd7-4b37-9c35-e59d7a4ba053', N'Approved', N'Approved')
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (90, N'6bcce4bd-953f-4dbb-9fba-e5a852e75fe1', N'Approved', N'Approved')
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (91, N'8e3b5ea6-6433-4918-9344-eaa6ffcc655c', N'Approved', N'Approved')
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (92, N'd94042cc-05a0-4f94-8dc0-eb68965ee3c5', N'Approved', N'Approved')
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (93, N'5bbb6024-0695-481c-aa45-f14ca19c8708', N'Approved', N'Approved')
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (94, N'19f897f3-72e2-4058-bdb3-f332bd4c734b', N'Approved', N'Approved')
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (95, N'a90778dc-d3a7-4cbf-afaa-f571e90724cd', N'Approved', N'Approved')
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (96, N'187fb8df-b36b-4298-a678-f727a093b46d', N'Approved', N'Approved')
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (97, N'4fb5daff-5b66-4911-aebb-fa2e03eea619', N'Approved', N'Approved')
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (98, N'58828fee-5b79-4b2a-80e6-fc2d47506d53', N'Approved', N'Approved')
GO
INSERT [dbo].[UserClaim] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (100, N'b656bd8f-b07e-44c0-9579-ce00b0fd38bb', N'Approved', N'Approved')
GO
SET IDENTITY_INSERT [dbo].[UserClaim] OFF
GO
