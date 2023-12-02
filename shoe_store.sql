
--------------------- __EFMigrationsHistory --------------------------------
CREATE TABLE [dbo].[__EFMigrationsHistory] (
    [MigrationId]    NVARCHAR (150) NOT NULL,
    [ProductVersion] NVARCHAR (32)  NOT NULL,
    CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED ([MigrationId] ASC)
);
-- done

--------------------- Articles --------------------------------
CREATE TABLE [dbo].[Articles] (
    [ArticleId] INT            IDENTITY (1, 1) NOT NULL,
    [Title]     NVARCHAR (300) NOT NULL,
    [Content]   NVARCHAR (MAX) NOT NULL,
    [Pulished]  NVARCHAR (100) NOT NULL,
    CONSTRAINT [PK_Articles] PRIMARY KEY CLUSTERED ([ArticleId] ASC)
);
--done

--------------------- AspNetRoleClaims --------------------------------

CREATE TABLE [dbo].[AspNetRoleClaims] (
    [Id]         INT            IDENTITY (1, 1) NOT NULL,
    [RoleId]     NVARCHAR (450) NOT NULL,
    [ClaimType]  NVARCHAR (MAX) NULL,
    [ClaimValue] NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [dbo].[AspNetRoles] ([Id]) ON DELETE CASCADE
);

--------------------- IX_AspNetRoleClaims_RoleId --------------------------------

GO
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId]
    ON [dbo].[AspNetRoleClaims]([RoleId] ASC);

CREATE TABLE [dbo].[AspNetRoles] (
    [Id]               NVARCHAR (450) NOT NULL,
    [Name]             NVARCHAR (256) NULL,
    [NormalizedName]   NVARCHAR (256) NULL,
    [ConcurrencyStamp] NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED ([Id] ASC)
);


--------------------- RoleNameIndex --------------------------------

GO
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex]
    ON [dbo].[AspNetRoles]([NormalizedName] ASC) WHERE ([NormalizedName] IS NOT NULL);

CREATE TABLE [dbo].[AspNetUserClaims] (
    [Id]         INT            IDENTITY (1, 1) NOT NULL,
    [UserId]     NVARCHAR (450) NOT NULL,
    [ClaimType]  NVARCHAR (MAX) NULL,
    [ClaimValue] NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[AspNetUsers] ([Id]) ON DELETE CASCADE
);

--------------------- IX_AspNetUserClaims_UserId --------------------------------

GO
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId]
    ON [dbo].[AspNetUserClaims]([UserId] ASC);

CREATE TABLE [dbo].[AspNetUserLogins] (
    [LoginProvider]       NVARCHAR (128) NOT NULL,
    [ProviderKey]         NVARCHAR (128) NOT NULL,
    [ProviderDisplayName] NVARCHAR (MAX) NULL,
    [UserId]              NVARCHAR (450) NOT NULL,
    CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED ([LoginProvider] ASC, [ProviderKey] ASC),
    CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[AspNetUsers] ([Id]) ON DELETE CASCADE
);

--------------------- IX_AspNetUserLogins_UserId --------------------------------

GO
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId]
    ON [dbo].[AspNetUserLogins]([UserId] ASC);

CREATE TABLE [dbo].[AspNetUserRoles] (
    [UserId] NVARCHAR (450) NOT NULL,
    [RoleId] NVARCHAR (450) NOT NULL,
    CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED ([UserId] ASC, [RoleId] ASC),
    CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [dbo].[AspNetRoles] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[AspNetUsers] ([Id]) ON DELETE CASCADE
);

--------------------- IX_AspNetUserRoles_RoleId --------------------------------


GO
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId]
    ON [dbo].[AspNetUserRoles]([RoleId] ASC);

CREATE TABLE [dbo].[AspNetUserRoles] (
    [UserId] NVARCHAR (450) NOT NULL,
    [RoleId] NVARCHAR (450) NOT NULL,
    CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED ([UserId] ASC, [RoleId] ASC),
    CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [dbo].[AspNetRoles] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[AspNetUsers] ([Id]) ON DELETE CASCADE
);

--------------------- IX_AspNetUserRoles_RoleId --------------------------------

GO
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId]
    ON [dbo].[AspNetUserRoles]([RoleId] ASC);

CREATE TABLE [dbo].[AspNetUserTokens] (
    [UserId]        NVARCHAR (450) NOT NULL,
    [LoginProvider] NVARCHAR (128) NOT NULL,
    [Name]          NVARCHAR (128) NOT NULL,
    [Value]         NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED ([UserId] ASC, [LoginProvider] ASC, [Name] ASC),
    CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[AspNetUsers] ([Id]) ON DELETE CASCADE
);

--------------------- Categories --------------------------------


CREATE TABLE [dbo].[Categories] (
    [CategoryId]    INT            IDENTITY (1, 1) NOT NULL,
    [CategoryName]  NVARCHAR (150) NULL,
    [CategoryPhoto] NVARCHAR (300) NULL,
    [CategoryOrder] INT            NOT NULL,
    CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED ([CategoryId] ASC)
);
--done
--------------------- Products --------------------------------

CREATE TABLE [dbo].[Products] (
    [ProductId]          INT             IDENTITY (1, 1) NOT NULL,
    [ProductName]        NVARCHAR (300)  NOT NULL,
    [ProductDescription] NVARCHAR (3000) NULL,
    [CategoryId]         INT             NOT NULL,
    [ProductPrice]       DECIMAL (8, 2)  NULL,
    [ProductDiscount]    DECIMAL (2, 2)  NULL,
    [ProductPhoto]       NVARCHAR (300)  NULL,
    [SizeId]             INT             NOT NULL,
    [IsTrendy]           BIT             NOT NULL,
    [IsArrived]          BIT             NOT NULL,
    CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED ([ProductId] ASC),
    CONSTRAINT [FK_Products_Categories_CategoryId] FOREIGN KEY ([CategoryId]) REFERENCES [dbo].[Categories] ([CategoryId]) ON DELETE CASCADE,
    CONSTRAINT [FK_Products_Sizes_SizeId] FOREIGN KEY ([SizeId]) REFERENCES [dbo].[Sizes] ([SizeId]) ON DELETE CASCADE
);
--done

GO
CREATE NONCLUSTERED INDEX [IX_Products_CategoryId]
    ON [dbo].[Products]([CategoryId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Products_SizeId]
    ON [dbo].[Products]([SizeId] ASC);
--done
--------------------- Sizes --------------------------------


CREATE TABLE [dbo].[Sizes] (
    [SizeId]   INT           IDENTITY (1, 1) NOT NULL,
    [SizeName] NVARCHAR (10) NULL,
    CONSTRAINT [PK_Sizes] PRIMARY KEY CLUSTERED ([SizeId] ASC)
);
--done


--------------------- insert db [__EFMigrationsHistory]  --------------------------------
INSERT INTO [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'00000000000000_CreateIdentitySchema', N'6.0.21')
INSERT INTO [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231124123307_initial', N'6.0.21')



--------------------- insert db Articles --------------------------------
SET IDENTITY_INSERT [dbo].[Articles] ON
INSERT INTO [dbo].[Articles] ([ArticleId], [Title], [Content], [Pulished]) VALUES (2, N'Adidas', N'Adidas là một trong những công ty đồ thể thao hàng đầu thế giới, được biết đến với các sản phẩm chất lượng cao như giày dép, quần áo, và phụ kiện thể thao. Được thành lập vào năm 1949 tại Đức bởi Adolf Dassler, Adidas đã trở thành một biểu tượng của sự kết hợp hoàn hảo giữa thiết kế và chức năng, mang lại cho người sử dụng những trải nghiệm tốt nhất.

Logo ba sọc của Adidas đã trở thành một biểu tượng quen thuộc trên toàn cầu. Công ty luôn chú trọng vào việc phát triển công nghệ và thiết kế, với mục tiêu cung cấp cho vận động viên các sản phẩm giúp họ đạt hiệu suất cao nhất. Adidas cũng rất nổi tiếng trong lĩnh vực thời trang đường phố, với nhiều dòng sản phẩm hợp tác với các nhà thiết kế và thương hiệu nổi tiếng khác như Yeezy cùng Kanye West, và Alexander Wang.

Adidas cũng cam kết với việc bảo vệ môi trường, với nhiều dự án nhằm giảm thiểu ảnh hưởng đến môi trường trong quá trình sản xuất. Một ví dụ nổi bật là dòng giày UltraBoost Uncaged Parley, được sản xuất từ rác thải nhựa tái chế từ đại dương.

Đối với nhiều người, Adidas không chỉ đơn thuần là một thương hiệu sản xuất đồ thể thao, mà còn là nguồn cảm hứng cho sự năng động, sức mạnh và quyết tâm. Thông qua các sản phẩm của mình, Adidas góp phần khẳng định tầm quan trọng của thể thao trong việc nâng cao chất lượng cuộc sống và truyền cảm hứng cho những thế hệ tiếp theo.', N'11/3/2023')
SET IDENTITY_INSERT [dbo].[Articles] OFF

--------------------- insert db AspNetUsers --------------------------------
INSERT INTO [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'af58b8e4-1daf-437a-ba67-34d8695b6fbb', N'tpneik@gmail.com', N'TPNEIK@GMAIL.COM', N'tpneik@gmail.com', N'TPNEIK@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAECEDlrnArohzriuDbYaiZJJuqZWMMjq7VcjqgxA7Xuw6ACcxLd9fTV8XCczO+8XWOQ==', N'2TUGJIUKE3WVDVAOJRPBVQY4CEMLR33U', N'ab1451a3-e0c1-4845-a0f2-ca2e7c866353', NULL, 0, 0, NULL, 1, 0)


--------------------- insert db Categories --------------------------------

SET IDENTITY_INSERT [dbo].[Categories] ON
INSERT INTO [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryPhoto], [CategoryOrder]) VALUES (1, N'NIKE', N'C:\Users\tpnei\OneDrive\Desktop\ASP. Learning\quametmoiroi\asp2\asp2\wwwroot\img\Air Jordan 1 KO “Field Purple”.png', 1)
INSERT INTO [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryPhoto], [CategoryOrder]) VALUES (2, N'ADIDAS', N'C:\Users\tpnei\OneDrive\Desktop\ASP. Learning\quametmoiroi\asp2\asp2\wwwroot\img\Adidas Swift Run.png', 2)
INSERT INTO [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryPhoto], [CategoryOrder]) VALUES (3, N'FILA', N'C:\Users\tpnei\OneDrive\Desktop\ASP. Learning\quametmoiroi\asp2\asp2\wwwroot\img\Dunk Low Premium ‘Houston Comets Four’ DZ2780-100.png', 3)
INSERT INTO [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryPhoto], [CategoryOrder]) VALUES (5, N'CONVERSE', N'C:\Users\tpnei\OneDrive\Desktop\ASP. Learning\quametmoiroi\asp2\asp2\wwwroot\img\X_PLR PHASE.png', 4)
INSERT INTO [dbo].[Categories] ([CategoryId], [CategoryName], [CategoryPhoto], [CategoryOrder]) VALUES (6, N'LV', N'C:\Users\tpnei\OneDrive\Desktop\ASP. Learning\quametmoiroi\asp2\asp2\wwwroot\img\LOUISVUITTONTRAINER MONOGRAM DENIM.png', 5)
SET IDENTITY_INSERT [dbo].[Categories] OFF



--------------------- insert db Products --------------------------------
SET IDENTITY_INSERT [dbo].[Products] ON
INSERT INTO [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [CategoryId], [ProductPrice], [ProductDiscount], [ProductPhoto], [SizeId], [IsTrendy], [IsArrived]) VALUES (1, N'Adifom Sltn ‘Cloud White’', N'Adifom Sltn ''Cloud White'' is a captivating hue that embodies the essence of pristine beauty. This lustrous shade of white holds a timeless appeal, effortlessly enhancing any interior or exterior space. Its gentle and delicate undertones create an atmosphere of serenity and harmony, evoking a sense of calmness and purity. Whether applied to walls, furniture, or decorative elements, this color choice exudes elegance and sophistication. Adifom Sltn ''Cloud White'' is a versatile and inspiring option, transforming any environment into a tranquil haven, where light dances gracefully and the ambiance radiates with a soothing aura of tranquility.', 1, CAST(122.00 AS Decimal(8, 2)), CAST(0.20 AS Decimal(2, 2)), N'\src_shoes\Adidas Adifom Sltn ‘Cloud White’ HP6481.png', 10, 1, 1)
INSERT INTO [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [CategoryId], [ProductPrice], [ProductDiscount], [ProductPhoto], [SizeId], [IsTrendy], [IsArrived]) VALUES (2, N'Dame 8 Damian Lillard Blue', N'Adidas Dame 8 Damian Lillard Blue (mã sản phẩm: GY6465) là một đôi giày thể thao đẳng cấp từ Adidas, được thiết kế đặc biệt cho vận động viên bóng rổ nổi tiếng Damian Lillard. Màu xanh đặc trưng trên giày tạo nên sự tươi mới và phong cách tinh tế. Với công nghệ tiên tiến và chất liệu chất lượng, Adidas Dame 8 cung cấp sự thoải mái, độ bền và hỗ trợ tối đa cho việc chơi bóng rổ. Đây là một lựa chọn tuyệt vời cho những người yêu thích thể thao và đam mê bóng rổ.', 2, CAST(100.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(2, 2)), N'\src_shoes\Adidas Dame 8 Damian Lillard Blue Gy6465.png', 3, 1, 1)
INSERT INTO [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [CategoryId], [ProductPrice], [ProductDiscount], [ProductPhoto], [SizeId], [IsTrendy], [IsArrived]) VALUES (3, N'Harden Vol 7 J ‘Scarlet’', N'Adidas Harden Vol 7 J ''Scarlet'' (mã sản phẩm: HQ9102) là một phiên bản đặc biệt của dòng giày thể thao Harden Vol 7, được thiết kế dành riêng cho các tín đồ sneaker nhí. Màu đỏ Scarlet nổi bật trên giày tạo nên sự cá tính và năng động. Với thiết kế hiện đại và công nghệ tiên tiến, Adidas Harden Vol 7 J cung cấp sự thoải mái, độ bền và hỗ trợ tối đa cho các hoạt động thể thao của trẻ em. Đây là một sự lựa chọn không thể thiếu cho các fan nhí của James Harden và người yêu thích thể thao.', 2, CAST(230.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(2, 2)), N'\src_shoes\Adidas Harden Vol 7 J ‘Scarlet’ HQ9102.png', 5, 1, 1)
INSERT INTO [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [CategoryId], [ProductPrice], [ProductDiscount], [ProductPhoto], [SizeId], [IsTrendy], [IsArrived]) VALUES (4, N'Neo Entrap', N'Adidas Neo Entrap White là một đôi giày thuộc dòng sản phẩm Adidas Neo, mang đến sự trẻ trung và phong cách đương đại. Với màu trắng tinh khiết, nó tạo nên vẻ thanh lịch và dễ phối hợp với nhiều trang phục. Giày được thiết kế với chất liệu chất lượng và công nghệ tiên tiến, mang lại sự thoải mái và độ bền trong suốt quá trình sử dụng. Adidas Neo Entrap White là sự lựa chọn hoàn hảo cho những người yêu thích phong cách thể thao và đang tìm kiếm một đôi giày đơn giản nhưng không kém phần phong cách.', 2, CAST(324.00 AS Decimal(8, 2)), CAST(0.01 AS Decimal(2, 2)), N'\src_shoes\Adidas Neo Entrap White.png', 1, 1, 1)
INSERT INTO [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [CategoryId], [ProductPrice], [ProductDiscount], [ProductPhoto], [SizeId], [IsTrendy], [IsArrived]) VALUES (5, N'NMD R1', N'Adidas NMD R1 (mã sản phẩm: H01926) là một đôi giày thể thao đẳng cấp từ Adidas, thuộc dòng sản phẩm NMD (Nomad). Được thiết kế với phong cách hiện đại và độc đáo, NMD R1 kết hợp giữa yếu tố thể thao và thời trang. Mã sản phẩm H01926 đề cập đến một phiên bản cụ thể của NMD R1, với các chi tiết và màu sắc đặc trưng.  Giày Adidas NMD R1 H01926 mang đến sự thoải mái và độ bền nhờ sử dụng các công nghệ tiên tiến của Adidas. Đặc biệt, nó có đế Boost đáng kinh ngạc, mang lại sự đệm êm ái và phản hồi năng động cho bước đi. Màu sắc và các chi tiết trên giày tạo nên sự thú vị và phong cách độc đáo, làm nổi bật phong cách cá nhân của bạn. Adidas NMD R1 H01926 là một lựa chọn tuyệt vời cho những ai đam mê thể thao và muốn thể hiện phong cách riêng của mình.', 2, CAST(127.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(2, 2)), N'\src_shoes\Adidas NMD R1 H01926.png', 5, 1, 1)
INSERT INTO [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [CategoryId], [ProductPrice], [ProductDiscount], [ProductPhoto], [SizeId], [IsTrendy], [IsArrived]) VALUES (6, N'NMD_S1 BLACK', N'NMD_S1 Black là một phiên bản của dòng sản phẩm Adidas NMD. Được thiết kế với màu đen đặc trưng, đôi giày này tạo nên vẻ ngoài sang trọng và hiện đại. NMD_S1 Black mang đến sự kết hợp hoàn hảo giữa phong cách thể thao và đường phố, tạo nên một diện mạo cá nhân độc đáo.  Với thiết kế đẳng cấp và chất liệu chất lượng, NMD_S1 Black đem lại sự thoải mái và độ bền trong suốt quá trình sử dụng. Đế Boost đặc trưng của Adidas mang lại sự đệm êm ái và phản hồi linh hoạt cho bước đi. Đồng thời, các chi tiết và logo thương hiệu trên giày tạo nên điểm nhấn thú vị.  NMD_S1 Black là một sự lựa chọn tuyệt vời cho những người yêu thích phong cách đường phố và muốn tự tin thể hiện cá nhân thông qua giày dép. Với sự kết hợp giữa màu sắc đen tinh tế và tiện ích của công nghệ Adidas, NMD_S1 Black sẽ là một điểm nhấn phong cách trong bộ sưu tập giày của bạn.', 2, CAST(120.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(2, 2)), N'\src_shoes\ADIDAS NMD_S1 BLACK.png', 1, 1, 1)
INSERT INTO [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [CategoryId], [ProductPrice], [ProductDiscount], [ProductPhoto], [SizeId], [IsTrendy], [IsArrived]) VALUES (7, N'Originals Forum Mid', N'Originals Forum Mid Sneaker là một đôi giày thuộc dòng sản phẩm Originals của Adidas. Được thiết kế dựa trên mẫu giày bóng rổ cổ điển, Forum Mid Sneaker mang đến sự pha trộn giữa phong cách retro và hiện đại.  Giày Forum Mid Sneaker có nguyên bản từ những năm 1980 và đã trở thành biểu tượng trong thế giới giày dép. Với thiết kế cổ cao và dây buộc, nó mang đến sự ổn định và hỗ trợ cho chân. Đế giày cao su có độ bám tốt, giúp tránh trượt và mang đến sự thoải mái trong suốt quá trình sử dụng.  Originals Forum Mid Sneaker có nhiều phiên bản màu sắc và chất liệu khác nhau, cho phép bạn tạo ra phong cách cá nhân. Dù bạn muốn kết hợp với trang phục thể thao hay đường phố, đôi giày này sẽ thêm phần phong cách và cá tính cho bộ trang phục của bạn.  Originals Forum Mid Sneaker là lựa chọn lý tưởng cho những người yêu thích phong cách retro và đang tìm kiếm một đôi giày đẹp mắt và đáng tin cậy.', 2, CAST(156.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(2, 2)), N'\src_shoes\Adidas Originals Forum Mid Sneaker.png', 13, 1, 1)
INSERT INTO [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [CategoryId], [ProductPrice], [ProductDiscount], [ProductPhoto], [SizeId], [IsTrendy], [IsArrived]) VALUES (8, N'Ozweego ‘Khaki Beige’', N'Originals Forum Mid Sneaker là một đôi giày thuộc dòng sản phẩm Originals của Adidas. Được thiết kế dựa trên mẫu giày bóng rổ cổ điển, Forum Mid Sneaker mang đến sự pha trộn giữa phong cách retro và hiện đại.  Giày Forum Mid Sneaker có nguyên bản từ những năm 1980 và đã trở thành biểu tượng trong thế giới giày dép. Với thiết kế cổ cao và dây buộc, nó mang đến sự ổn định và hỗ trợ cho chân. Đế giày cao su có độ bám tốt, giúp tránh trượt và mang đến sự thoải mái trong suốt quá trình sử dụng.  Originals Forum Mid Sneaker có nhiều phiên bản màu sắc và chất liệu khác nhau, cho phép bạn tạo ra phong cách cá nhân. Dù bạn muốn kết hợp với trang phục thể thao hay đường phố, đôi giày này sẽ thêm phần phong cách và cá tính cho bộ trang phục của bạn.  Originals Forum Mid Sneaker là lựa chọn lý tưởng cho những người yêu thích phong cách retro và đang tìm kiếm một đôi giày đẹp mắt và đáng tin cậy.', 1, CAST(350.00 AS Decimal(8, 2)), CAST(0.01 AS Decimal(2, 2)), N'\src_shoes\Adidas Ozweego ‘Khaki Beige’ GY3157.png', 28, 1, 1)
INSERT INTO [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [CategoryId], [ProductPrice], [ProductDiscount], [ProductPhoto], [SizeId], [IsTrendy], [IsArrived]) VALUES (9, N'Cloud White Court Green', N'Dunk Low Disrupt 2 ''Mint Foam'' (mã sản phẩm: FJ7745-181) là một phiên bản đặc biệt của dòng giày Dunk Low Disrupt 2 từ Nike. ''Mint Foam'' ám chỉ màu xanh lá cây nhạt trên giày, tạo nên một vẻ ngoài tươi mới và thu hút.  Thiết kế Dunk Low Disrupt 2 ''Mint Foam'' mang đến sự phá cách và độc đáo. Với đế giày dày và phần trên hiện đại, giày này tạo nên một phong cách thể thao đương đại và cá tính. Màu xanh lá cây nhạt như ''Mint Foam'' tạo điểm nhấn sáng mắt và độc đáo trên giày.  Dunk Low Disrupt 2 ''Mint Foam'' được chế tạo với chất liệu và công nghệ tốt nhất từ Nike, mang đến sự thoải mái và độ bền. Đế giày dày và đệm êm ái cung cấp sự hỗ trợ và thoải mái cho bàn chân.  Đôi giày Dunk Low Disrupt 2 ''Mint Foam'' FJ7745-181 là một lựa chọn tuyệt vời cho những người yêu thích phong cách thể thao độc đáo và muốn thể hiện cái tôi riêng của mình thông qua giày dép.', 1, CAST(280.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(2, 2)), N'\src_shoes\adidas Stan Smith - Cloud White Court Green.png', 1, 1, 1)
INSERT INTO [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [CategoryId], [ProductPrice], [ProductDiscount], [ProductPhoto], [SizeId], [IsTrendy], [IsArrived]) VALUES (17, N'Swift Run', N'Swift Run Swift Run Swift Run Swift Run Swift Run Swift Run ', 5, CAST(350.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(2, 2)), N'\src_shoes\Adidas Swift Run.png', 4, 1, 1)
INSERT INTO [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [CategoryId], [ProductPrice], [ProductDiscount], [ProductPhoto], [SizeId], [IsTrendy], [IsArrived]) VALUES (22, N'X_PLRPHASE ‘White’', N'X_PLRPHASE ‘White’ X_PLRPHASE ‘White’', 5, CAST(333.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(2, 2)), N'\src_shoes\Adidas X_PLRPHASE ‘White’ IG4767.png', 10, 1, 1)
INSERT INTO [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [CategoryId], [ProductPrice], [ProductDiscount], [ProductPhoto], [SizeId], [IsTrendy], [IsArrived]) VALUES (24, N'Jordan 1 KO “Field Purple”', N'Jordan 1 KO “Field Purple” Jordan 1 KO “Field Purple” Jordan 1 KO “Field Purple”', 5, CAST(342.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(2, 2)), N'\src_shoes\Air Jordan 1 KO “Field Purple”.png', 22, 1, 1)
INSERT INTO [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [CategoryId], [ProductPrice], [ProductDiscount], [ProductPhoto], [SizeId], [IsTrendy], [IsArrived]) VALUES (25, N'Jordan 3 Retro ‘Lucky Green’', N'Jordan 3 Retro ‘Lucky Green’ Jordan 3 Retro ‘Lucky Green’ Jordan 3 Retro ‘Lucky Green’', 5, CAST(213.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(2, 2)), N'\src_shoes\Air Jordan 3 Retro ‘Lucky Green’ CK9246-136.png', 21, 1, 1)
INSERT INTO [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [CategoryId], [ProductPrice], [ProductDiscount], [ProductPhoto], [SizeId], [IsTrendy], [IsArrived]) VALUES (26, N'Jordan 3 Retro', N'Jordan 3 Retro Jordan 3 Retro Jordan 3 Retro', 5, CAST(164.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(2, 2)), N'\src_shoes\Air Jordan 3 Retro DR8869-200.png', 20, 1, 1)
INSERT INTO [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [CategoryId], [ProductPrice], [ProductDiscount], [ProductPhoto], [SizeId], [IsTrendy], [IsArrived]) VALUES (27, N'Court Borough Low', N'Court Borough Low Court Borough Low Court Borough Low', 5, CAST(251.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(2, 2)), N'\src_shoes\Court Borough Low 2 GS _Mocha Mint_.png', 19, 1, 1)
INSERT INTO [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [CategoryId], [ProductPrice], [ProductDiscount], [ProductPhoto], [SizeId], [IsTrendy], [IsArrived]) VALUES (30, N'Dunk Low ‘Siempre Familia’', N'Dunk Low ‘Siempre Familia’ Dunk Low ‘Siempre Familia’ Dunk Low ‘Siempre Familia’ Dunk Low ‘Siempre Familia’', 3, CAST(513.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(2, 2)), N'\src_shoes\Dunk Low ‘Siempre Familia’ DO2160-335.png', 11, 1, 1)
INSERT INTO [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [CategoryId], [ProductPrice], [ProductDiscount], [ProductPhoto], [SizeId], [IsTrendy], [IsArrived]) VALUES (31, N'Low Disrupt 2 ‘Mint Foam’', N'Low Disrupt 2 ‘Mint Foam’ Low Disrupt 2 ‘Mint Foam’ Low Disrupt 2 ‘Mint Foam’', 6, CAST(214.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(2, 2)), N'\src_shoes\Dunk Low Disrupt 2 ‘Mint Foam’ FJ7745-181.png', 6, 1, 1)
INSERT INTO [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [CategoryId], [ProductPrice], [ProductDiscount], [ProductPhoto], [SizeId], [IsTrendy], [IsArrived]) VALUES (32, N'Disrupt 2 For', N'Disrupt 2 For Disrupt 2 For Disrupt 2 For Disrupt 2 For', 2, CAST(413.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(2, 2)), N'\src_shoes\Dunk Low Disrupt 2 For Native American Heritage FN8917-141.png', 7, 1, 1)
INSERT INTO [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [CategoryId], [ProductPrice], [ProductDiscount], [ProductPhoto], [SizeId], [IsTrendy], [IsArrived]) VALUES (33, N'Dunk Low Lisa Leslie', N'Dunk Low Lisa Leslie Dunk Low Lisa Leslie Dunk Low Lisa Leslie', 2, CAST(555.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(2, 2)), N'\src_shoes\Dunk Low Lisa Leslie.png', 5, 1, 1)
INSERT INTO [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [CategoryId], [ProductPrice], [ProductDiscount], [ProductPhoto], [SizeId], [IsTrendy], [IsArrived]) VALUES (35, N'\Dunk Low Premium ‘Housto', N'\Dunk Low Premium ‘Housto \Dunk Low Premium ‘Housto \Dunk Low Premium ‘Housto', 1, CAST(534.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(2, 2)), N'\src_shoes\Dunk Low Premium ‘Houston Comets Four’ DZ2780-100.png', 5, 1, 1)
INSERT INTO [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [CategoryId], [ProductPrice], [ProductDiscount], [ProductPhoto], [SizeId], [IsTrendy], [IsArrived]) VALUES (37, N'Dunk Low Premium ‘Magenta’', N'Dunk Low Premium ‘Magenta’ Dunk Low Premium ‘Magenta’ Dunk Low Premium ‘Magenta’', 3, CAST(352.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(2, 2)), N'\src_shoes\Dunk Low Premium ‘Magenta’ DV7415-500.png', 5, 1, 1)
INSERT INTO [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [CategoryId], [ProductPrice], [ProductDiscount], [ProductPhoto], [SizeId], [IsTrendy], [IsArrived]) VALUES (38, N'Dunk Low Premium ‘Magenta’', N'Dunk Low Premium ‘Magenta’ Dunk Low Premium ‘Magenta’ Dunk Low Premium ‘Magenta’', 3, CAST(346.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(2, 2)), N'\src_shoes\Dunk Low Premium ‘Magenta’ DV7415-500.png', 5, 1, 0)
INSERT INTO [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [CategoryId], [ProductPrice], [ProductDiscount], [ProductPhoto], [SizeId], [IsTrendy], [IsArrived]) VALUES (39, N'FILA Distorter', N'FILA Distorter FILA DistorterFILA Distorter ', 2, CAST(563.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(2, 2)), N'\src_shoes\FILA Distorter WSS23011-106 (code nữ).png', 4, 1, 1)
INSERT INTO [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [CategoryId], [ProductPrice], [ProductDiscount], [ProductPhoto], [SizeId], [IsTrendy], [IsArrived]) VALUES (40, N'FORUM BOLD', N'FORUM BOLD FORUM BOLD FORUM BOLD', 3, CAST(123.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(2, 2)), N'\src_shoes\FORUM BOLD SHOES.png', 2, 1, 1)
INSERT INTO [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [CategoryId], [ProductPrice], [ProductDiscount], [ProductPhoto], [SizeId], [IsTrendy], [IsArrived]) VALUES (42, N'Forum Low Big Kid ', N'Forum Low Big Kid', 2, CAST(176.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(2, 2)), N'\src_shoes\Forum Low Big Kid _Save The Bees_ HP6245.png', 6, 1, 1)
INSERT INTO [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [CategoryId], [ProductPrice], [ProductDiscount], [ProductPhoto], [SizeId], [IsTrendy], [IsArrived]) VALUES (44, N'LOW CLASSIC X ANDRÉ', N'LOW CLASSIC X ANDRÉ LOW CLASSIC X ANDRÉ LOW CLASSIC X ANDRÉ', 6, CAST(134.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(2, 2)), N'\src_shoes\FORUM LOW CLASSIC X ANDRÉ SARAIVA SHOES.png', 9, 1, 1)
INSERT INTO [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [CategoryId], [ProductPrice], [ProductDiscount], [ProductPhoto], [SizeId], [IsTrendy], [IsArrived]) VALUES (46, N'FORUM LOW CLASSIC', N'FORUM LOW CLASSIC FORUM LOW CLASSIC FORUM LOW CLASSIC', 5, CAST(264.00 AS Decimal(8, 2)), CAST(0.10 AS Decimal(2, 2)), N'\src_shoes\FORUM LOW CLASSIC X ANDRÉ SARAIVA SHOES.png', 6, 1, 1)
INSERT INTO [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [CategoryId], [ProductPrice], [ProductDiscount], [ProductPhoto], [SizeId], [IsTrendy], [IsArrived]) VALUES (48, N'Fierce Pink', N'Fierce Pink Fierce Pink Fierce Pink', 6, CAST(135.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(2, 2)), N'\src_shoes\Jordan 1 Low GS _Fierce Pink_ DZ5365-601.png', 8, 1, 1)
INSERT INTO [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [CategoryId], [ProductPrice], [ProductDiscount], [ProductPhoto], [SizeId], [IsTrendy], [IsArrived]) VALUES (51, N'Lucky Green', N'Lucky Green Lucky Green Lucky Green', 5, CAST(462.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(2, 2)), N'\src_shoes\Jordan 1 Low GS _Lucky Green_ 553560-065 (code KID).png', 4, 1, 1)
SET IDENTITY_INSERT [dbo].[Products] OFF



--------------------- insert db Sizes --------------------------------
SET IDENTITY_INSERT [dbo].[Sizes] ON
INSERT INTO [dbo].[Sizes] ([SizeId], [SizeName]) VALUES (1, N'16')
INSERT INTO [dbo].[Sizes] ([SizeId], [SizeName]) VALUES (2, N'17')
INSERT INTO [dbo].[Sizes] ([SizeId], [SizeName]) VALUES (3, N'18')
INSERT INTO [dbo].[Sizes] ([SizeId], [SizeName]) VALUES (4, N'19')
INSERT INTO [dbo].[Sizes] ([SizeId], [SizeName]) VALUES (5, N'20')
INSERT INTO [dbo].[Sizes] ([SizeId], [SizeName]) VALUES (6, N'21')
INSERT INTO [dbo].[Sizes] ([SizeId], [SizeName]) VALUES (7, N'22')
INSERT INTO [dbo].[Sizes] ([SizeId], [SizeName]) VALUES (8, N'23')
INSERT INTO [dbo].[Sizes] ([SizeId], [SizeName]) VALUES (9, N'24')
INSERT INTO [dbo].[Sizes] ([SizeId], [SizeName]) VALUES (10, N'25')
INSERT INTO [dbo].[Sizes] ([SizeId], [SizeName]) VALUES (11, N'26')
INSERT INTO [dbo].[Sizes] ([SizeId], [SizeName]) VALUES (12, N'27')
INSERT INTO [dbo].[Sizes] ([SizeId], [SizeName]) VALUES (13, N'28')
INSERT INTO [dbo].[Sizes] ([SizeId], [SizeName]) VALUES (14, N'29')
INSERT INTO [dbo].[Sizes] ([SizeId], [SizeName]) VALUES (15, N'30')
INSERT INTO [dbo].[Sizes] ([SizeId], [SizeName]) VALUES (16, N'31')
INSERT INTO [dbo].[Sizes] ([SizeId], [SizeName]) VALUES (17, N'32')
INSERT INTO [dbo].[Sizes] ([SizeId], [SizeName]) VALUES (18, N'33')
INSERT INTO [dbo].[Sizes] ([SizeId], [SizeName]) VALUES (19, N'34')
INSERT INTO [dbo].[Sizes] ([SizeId], [SizeName]) VALUES (20, N'35')
INSERT INTO [dbo].[Sizes] ([SizeId], [SizeName]) VALUES (21, N'36')
INSERT INTO [dbo].[Sizes] ([SizeId], [SizeName]) VALUES (22, N'37')
INSERT INTO [dbo].[Sizes] ([SizeId], [SizeName]) VALUES (23, N'38')
INSERT INTO [dbo].[Sizes] ([SizeId], [SizeName]) VALUES (24, N'39')
INSERT INTO [dbo].[Sizes] ([SizeId], [SizeName]) VALUES (25, N'40')
INSERT INTO [dbo].[Sizes] ([SizeId], [SizeName]) VALUES (26, N'41')
INSERT INTO [dbo].[Sizes] ([SizeId], [SizeName]) VALUES (27, N'42')
INSERT INTO [dbo].[Sizes] ([SizeId], [SizeName]) VALUES (28, N'43')
INSERT INTO [dbo].[Sizes] ([SizeId], [SizeName]) VALUES (29, N'44')
INSERT INTO [dbo].[Sizes] ([SizeId], [SizeName]) VALUES (30, N'45')
INSERT INTO [dbo].[Sizes] ([SizeId], [SizeName]) VALUES (31, N'46')
SET IDENTITY_INSERT [dbo].[Sizes] OFF

