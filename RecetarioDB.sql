USE [master]
GO
CREATE DATABASE [RecetarioDB]
GO
USE [RecetarioDB]
GO
/****** Object:  Table [dbo].[receta]    Script Date: 10/23/2014 23:49:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[receta](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](150) NOT NULL,
	[porciones] [int] NOT NULL,
	[descripcion] [text] NOT NULL,
	[pathImage] [varchar](100) NULL,
 CONSTRAINT [PK_receta] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[receta] ON
INSERT [dbo].[receta] ([id], [nombre], [porciones], [descripcion], [pathImage]) VALUES (5, N'Receta', 1, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL)
INSERT [dbo].[receta] ([id], [nombre], [porciones], [descripcion], [pathImage]) VALUES (26, N'Carpaccio de champin~ones', 4, N'Carpaccio de champin~ones', NULL)
INSERT [dbo].[receta] ([id], [nombre], [porciones], [descripcion], [pathImage]) VALUES (27, N'Portobello con germinado y queso azul', 4, N'Portobello con germinado y queso azul', NULL)
SET IDENTITY_INSERT [dbo].[receta] OFF
/****** Object:  Table [dbo].[paso]    Script Date: 10/23/2014 23:49:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[paso](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[numero] [int] NOT NULL,
	[descripcion] [text] NOT NULL,
	[idReceta] [int] NOT NULL,
	[idx] [int] NULL,
 CONSTRAINT [PK_paso] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[paso] ON
INSERT [dbo].[paso] ([id], [numero], [descripcion], [idReceta], [idx]) VALUES (1, 1, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. tuyu', 5, 0)
INSERT [dbo].[paso] ([id], [numero], [descripcion], [idReceta], [idx]) VALUES (3, 2, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. tyut', 5, 1)
INSERT [dbo].[paso] ([id], [numero], [descripcion], [idReceta], [idx]) VALUES (14, 1, N'Rebana los champiñones y el portobello lo más fino posible. Acomódalos en la base de un plato.', 26, 0)
INSERT [dbo].[paso] ([id], [numero], [descripcion], [idReceta], [idx]) VALUES (15, 2, N'Distribuye los elotitos y el jitomate sobre el carpaccio.', 26, 1)
INSERT [dbo].[paso] ([id], [numero], [descripcion], [idReceta], [idx]) VALUES (16, 3, N'Cucharea de manera uniforme el aceite de oliva y el vinagre balsámico sobre el carpaccio.', 26, 2)
INSERT [dbo].[paso] ([id], [numero], [descripcion], [idReceta], [idx]) VALUES (17, 4, N'Espolvorea el perejil picado y el eneldo.', 26, 3)
INSERT [dbo].[paso] ([id], [numero], [descripcion], [idReceta], [idx]) VALUES (18, 5, N'Sazona y ofrece.', 26, 4)
INSERT [dbo].[paso] ([id], [numero], [descripcion], [idReceta], [idx]) VALUES (19, 1, N'Con un poco del aceite unta los hongos y salpícalos con el ajo, salpimiéntalos y ásalos a la plancha.', 27, 0)
INSERT [dbo].[paso] ([id], [numero], [descripcion], [idReceta], [idx]) VALUES (20, 2, N'Combina el aceite restante con el jugo del limón, la sal y la pimienta. Adereza con esta mezcla el germinado.', 27, 1)
INSERT [dbo].[paso] ([id], [numero], [descripcion], [idReceta], [idx]) VALUES (21, 3, N'Sirve en los platos los hongos con el queso azul, las nueces picadas y el germinado.', 27, 2)
SET IDENTITY_INSERT [dbo].[paso] OFF
/****** Object:  Table [dbo].[ingrediente]    Script Date: 10/23/2014 23:49:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ingrediente](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[cantidad] [varchar](50) NOT NULL,
	[idReceta] [int] NOT NULL,
	[idx] [int] NULL,
 CONSTRAINT [PK_ingrediente] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[ingrediente] ON
INSERT [dbo].[ingrediente] ([id], [nombre], [cantidad], [idReceta], [idx]) VALUES (3, N'Ingrediente 1', N'1', 5, 0)
INSERT [dbo].[ingrediente] ([id], [nombre], [cantidad], [idReceta], [idx]) VALUES (4, N'Ingrediente 2', N'2', 5, 1)
INSERT [dbo].[ingrediente] ([id], [nombre], [cantidad], [idReceta], [idx]) VALUES (16, N'champin~ones', N'100 g', 26, 0)
INSERT [dbo].[ingrediente] ([id], [nombre], [cantidad], [idReceta], [idx]) VALUES (17, N'portobello', N'100 g', 26, 1)
INSERT [dbo].[ingrediente] ([id], [nombre], [cantidad], [idReceta], [idx]) VALUES (18, N'jitomate picado finamente', N'1/2 taza', 26, 2)
INSERT [dbo].[ingrediente] ([id], [nombre], [cantidad], [idReceta], [idx]) VALUES (19, N'perejil picado', N'1 cucharada', 26, 3)
INSERT [dbo].[ingrediente] ([id], [nombre], [cantidad], [idReceta], [idx]) VALUES (20, N'eneldo', N'1 cucharada', 26, 4)
INSERT [dbo].[ingrediente] ([id], [nombre], [cantidad], [idReceta], [idx]) VALUES (21, N'aceite de oliva', N'2 cucharadas', 26, 5)
INSERT [dbo].[ingrediente] ([id], [nombre], [cantidad], [idReceta], [idx]) VALUES (22, N'granos de elote cocidos', N'1 taza', 26, 6)
INSERT [dbo].[ingrediente] ([id], [nombre], [cantidad], [idReceta], [idx]) VALUES (23, N'vinagre balsa´mico', N'1 cucharada', 26, 7)
INSERT [dbo].[ingrediente] ([id], [nombre], [cantidad], [idReceta], [idx]) VALUES (24, N'aceite de oliva', N'1/2 taza', 27, 0)
INSERT [dbo].[ingrediente] ([id], [nombre], [cantidad], [idReceta], [idx]) VALUES (25, N'hongos portobello', N'4', 27, 1)
INSERT [dbo].[ingrediente] ([id], [nombre], [cantidad], [idReceta], [idx]) VALUES (26, N'diente de ajo picado finamente Sal', N'1', 27, 2)
INSERT [dbo].[ingrediente] ([id], [nombre], [cantidad], [idReceta], [idx]) VALUES (27, N'Sal', N'-', 27, 3)
INSERT [dbo].[ingrediente] ([id], [nombre], [cantidad], [idReceta], [idx]) VALUES (28, N'pimienta', N'-', 27, 4)
INSERT [dbo].[ingrediente] ([id], [nombre], [cantidad], [idReceta], [idx]) VALUES (29, N'limo´n', N'1', 27, 5)
INSERT [dbo].[ingrediente] ([id], [nombre], [cantidad], [idReceta], [idx]) VALUES (30, N'germinado de alfalfa', N'1 taza', 27, 6)
INSERT [dbo].[ingrediente] ([id], [nombre], [cantidad], [idReceta], [idx]) VALUES (31, N'nueces picadas', N'1/2 taza', 27, 7)
INSERT [dbo].[ingrediente] ([id], [nombre], [cantidad], [idReceta], [idx]) VALUES (32, N'queso azul desmoronado', N'1/2 taza', 27, 8)
SET IDENTITY_INSERT [dbo].[ingrediente] OFF
/****** Object:  ForeignKey [FK_ingrediente_receta]    Script Date: 10/23/2014 23:49:54 ******/
ALTER TABLE [dbo].[ingrediente]  WITH CHECK ADD  CONSTRAINT [FK_ingrediente_receta] FOREIGN KEY([idReceta])
REFERENCES [dbo].[receta] ([id])
GO
ALTER TABLE [dbo].[ingrediente] CHECK CONSTRAINT [FK_ingrediente_receta]
GO
/****** Object:  ForeignKey [FK_paso_receta]    Script Date: 10/23/2014 23:49:54 ******/
ALTER TABLE [dbo].[paso]  WITH CHECK ADD  CONSTRAINT [FK_paso_receta] FOREIGN KEY([idReceta])
REFERENCES [dbo].[receta] ([id])
GO
ALTER TABLE [dbo].[paso] CHECK CONSTRAINT [FK_paso_receta]
GO
