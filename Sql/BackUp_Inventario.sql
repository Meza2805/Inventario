-- Utilizar 'master' para ejecutar comandos de alto nivel
USE master;
GO

-- Verificar si la base de datos existe
IF EXISTS (SELECT name FROM sys.databases WHERE name = N'Punto_Venta_Inventario')
BEGIN
    -- Si la base de datos existe, elimínala
    ALTER DATABASE [Punto_Venta_Inventario] SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE [Punto_Venta_Inventario];
END
GO

-- Crear la base de datos
CREATE DATABASE [Punto_Venta_Inventario];
GO

USE [Punto_Venta_Inventario]
GO

SET NOCOUNT ON 
CREATE TYPE [dbo].[DetalleCompraType] AS TABLE(
	[Id_Producto] [int] NULL,
	[Cantidad] [int] NULL,
	[Precio_Unitario] [decimal](18, 0) NULL
)
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 18/10/2024 09:40:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[Id_Categoria] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](max) NULL,
	[Descripcion] [nvarchar](max) NULL,
	[Usuario_Crea] [nvarchar](max) NULL,
	[Fecha_Creacion] [datetime] NULL,
	[Usuario_Actualiza] [nvarchar](max) NULL,
	[Fecha_Actualizacion] [datetime] NULL,
	[Estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Categoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 18/10/2024 09:40:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[Id_Cliente] [int] IDENTITY(1,1) NOT NULL,
	[No_Cedula] [nvarchar](18) NULL,
	[Primer_Nombre] [nvarchar](max) NULL,
	[Segundo_Nombre] [nvarchar](max) NULL,
	[Primer_Apellido] [nvarchar](max) NULL,
	[Segundo_Apellido] [nvarchar](max) NULL,
	[Fecha_Nacimiento] [datetime] NULL,
	[Direccion] [nvarchar](max) NULL,
	[Telefono] [nvarchar](9) NULL,
	[Email] [nvarchar](max) NULL,
	[Usuario_Crea] [nvarchar](max) NULL,
	[Fecha_Creacion] [datetime] NULL,
	[Usuario_Actualiza] [nvarchar](max) NULL,
	[Fecha_Actualizacion] [datetime] NULL,
	[Estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Compra]    Script Date: 18/10/2024 09:40:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Compra](
	[Id_Compra] [int] IDENTITY(1,1) NOT NULL,
	[Id_Proveedor] [int] NULL,
	[Fecha_Compra] [datetime] NULL,
	[Total_Compra] [decimal](18, 0) NULL,
	[Usuario_Crea] [nvarchar](max) NULL,
	[Fecha_Creacion] [datetime] NULL,
	[Usuario_Modifica] [nvarchar](max) NULL,
	[Fecha_Modificacion] [datetime] NULL,
	[Estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Compra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Detalle_Compra]    Script Date: 18/10/2024 09:40:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detalle_Compra](
	[Id_Detalle_C] [int] IDENTITY(1,1) NOT NULL,
	[Id_Compra] [int] NULL,
	[Id_Producto] [int] NULL,
	[Cantidad] [int] NULL,
	[Precio_Unitario] [decimal](18, 0) NULL,
	[SubTotal] [decimal](18, 0) NULL,
	[Usuario_Crea] [nvarchar](max) NULL,
	[Fecha_Creacion] [datetime] NULL,
	[Usuario_Actualiza] [nvarchar](max) NULL,
	[Fecha_Actualizacion] [datetime] NULL,
	[Estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Detalle_C] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Detalle_Venta]    Script Date: 18/10/2024 09:40:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detalle_Venta](
	[Id_Detalle] [int] IDENTITY(1,1) NOT NULL,
	[Id_Venta] [int] NULL,
	[Id_Producto] [int] NULL,
	[Cantidad] [int] NULL,
	[Precio_Unitario] [decimal](18, 0) NULL,
	[Sub_Total] [decimal](18, 0) NULL,
	[Usuario_Crea] [nvarchar](max) NULL,
	[Fecha_Creacion] [datetime] NULL,
	[Usuario_Actualiza] [nvarchar](max) NULL,
	[Fecha_Actualizacion] [datetime] NULL,
	[Estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Detalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventario]    Script Date: 18/10/2024 09:40:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventario](
	[Id_Inventario] [int] IDENTITY(1,1) NOT NULL,
	[Id_Producto] [int] NOT NULL,
	[Tipo_Movimiento] [bit] NOT NULL,
	[Cantidad] [int] NULL,
	[Usuario_Crea] [nvarchar](max) NULL,
	[Fecha_Creacion] [datetime] NULL,
	[Usuario_Actualiza] [nvarchar](max) NULL,
	[Fecha_Actualizacion] [datetime] NULL,
	[Estado] [bit] NULL,
	[Id_Factura_Compra] [int] NULL,
	[Id_Factura_Venta] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Inventario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Marca]    Script Date: 18/10/2024 09:40:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marca](
	[Id_Marca] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](max) NULL,
	[Descripcion] [nvarchar](max) NULL,
	[Usuario_Crea] [nvarchar](max) NULL,
	[Fecha_Creacion] [datetime] NULL,
	[Usuario_Actualiza] [nvarchar](max) NULL,
	[Fecha_Actualizacion] [datetime] NULL,
	[Estado] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Marca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 18/10/2024 09:40:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[Id_Producto] [int] IDENTITY(1,1) NOT NULL,
	[Id_Categoria] [int] NOT NULL,
	[Id_Marca] [int] NULL,
	[Nombre] [nvarchar](max) NULL,
	[Descripcion] [nvarchar](max) NULL,
	[Modelo] [nvarchar](max) NULL,
	[Precio_Venta] [decimal](18, 0) NOT NULL,
	[Precio_Costo] [decimal](18, 0) NOT NULL,
	[Cantidad_Inventario] [int] NULL,
	[Usuario_Crea] [nvarchar](max) NULL,
	[Fecha_Creacion] [datetime] NULL,
	[Usuario_Actualiza] [nvarchar](max) NULL,
	[Fecha_Actualizacion] [datetime] NULL,
	[Estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proveedor]    Script Date: 18/10/2024 09:40:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedor](
	[Id_Proveedor] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](max) NULL,
	[Contacto] [nvarchar](max) NULL,
	[Telefono] [nvarchar](max) NULL,
	[Direccion] [nvarchar](max) NULL,
	[Usuario_Crea] [nvarchar](max) NULL,
	[Fecha_Creacion] [datetime] NULL,
	[Usuario_Actualiza] [nvarchar](max) NULL,
	[Fecha_Actualizacion] [datetime] NULL,
	[Estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Proveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Venta]    Script Date: 18/10/2024 09:40:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venta](
	[Id_Venta] [int] IDENTITY(1,1) NOT NULL,
	[Id_Cliente] [int] NOT NULL,
	[Fecha_Venta] [datetime] NOT NULL,
	[Total] [decimal](18, 0) NOT NULL,
	[Usuario_Crea] [nvarchar](max) NULL,
	[Fecha_Creacion] [datetime] NULL,
	[Usuario_Actualiza] [nvarchar](max) NULL,
	[Fecha_Actualizacion] [datetime] NULL,
	[Estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Venta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categoria] ON 

INSERT [dbo].[Categoria] ([Id_Categoria], [Nombre], [Descripcion], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (1, N'CELULARES', N'DISPOSITIVOS MÓVILES Y SMARTPHONES', N'ADMIN', CAST(N'2024-10-14T13:25:34.857' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Categoria] ([Id_Categoria], [Nombre], [Descripcion], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (2, N'SMARTWATCHES', N'RELOJES INTELIGENTES Y ACCESORIOS', N'ADMIN', CAST(N'2024-10-14T13:25:34.880' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Categoria] ([Id_Categoria], [Nombre], [Descripcion], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (3, N'LÍNEA BLANCA', N'ELECTRODOMÉSTICOS PARA EL HOGAR', N'ADMIN', CAST(N'2024-10-14T13:25:34.883' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Categoria] ([Id_Categoria], [Nombre], [Descripcion], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (4, N'COCINA Y HOGAR', N'ELECTRODOMÉSTICOS DE COCINA Y PRODUCTOS DEL HOGAR', N'ADMIN', CAST(N'2024-10-14T13:25:34.887' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Categoria] ([Id_Categoria], [Nombre], [Descripcion], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (5, N'ENTRETENIMIENTO', N'DISPOSITIVOS DE AUDIO Y VIDEO', N'ADMIN', CAST(N'2024-10-14T13:25:34.887' AS DateTime), NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Categoria] OFF
GO
SET IDENTITY_INSERT [dbo].[Cliente] ON 

INSERT [dbo].[Cliente] ([Id_Cliente], [No_Cedula], [Primer_Nombre], [Segundo_Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Direccion], [Telefono], [Email], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (1, N'0011205800011A', N'CARLOS', N'EDUARDO', N'RAMIREZ', N'LÓPEZ', CAST(N'1980-12-05T00:00:00.000' AS DateTime), N'MANAGUA, NICARAGUA', N'88881234', N'carlos.ramirez@example.com', N'ADMIN', CAST(N'2024-10-14T14:00:42.133' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Cliente] ([Id_Cliente], [No_Cedula], [Primer_Nombre], [Segundo_Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Direccion], [Telefono], [Email], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (2, N'0021505900032B', N'ANA', N'MARÍA', N'MARTÍNEZ', N'SÁNCHEZ', CAST(N'1990-05-15T00:00:00.000' AS DateTime), N'LEÓN, NICARAGUA', N'88882345', N'ana.martinez@example.com', N'ADMIN', CAST(N'2024-10-14T14:01:28.167' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Cliente] ([Id_Cliente], [No_Cedula], [Primer_Nombre], [Segundo_Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Direccion], [Telefono], [Email], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (3, N'0010101830044C', N'JOSÉ', N'FERNANDO', N'GONZÁLEZ', N'PÉREZ', CAST(N'1983-01-01T00:00:00.000' AS DateTime), N'MANAGUA, NICARAGUA', N'88883456', N'jose.gonzalez@example.com', N'ADMIN', CAST(N'2024-10-14T14:01:28.167' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Cliente] ([Id_Cliente], [No_Cedula], [Primer_Nombre], [Segundo_Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Direccion], [Telefono], [Email], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (4, N'0032007850032D', N'LUISA', N'FERNANDA', N'LOPEZ', N'HERNÁNDEZ', CAST(N'1985-07-20T00:00:00.000' AS DateTime), N'GRANADA, NICARAGUA', N'88884567', N'luisa.lopez@example.com', N'ADMIN', CAST(N'2024-10-14T14:01:28.170' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Cliente] ([Id_Cliente], [No_Cedula], [Primer_Nombre], [Segundo_Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Direccion], [Telefono], [Email], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (5, N'0013109930031E', N'MARIO', N'ANDRÉS', N'VARGAS', N'CASTILLO', CAST(N'1993-10-31T00:00:00.000' AS DateTime), N'MANAGUA, NICARAGUA', N'88885678', N'mario.vargas@example.com', N'ADMIN', CAST(N'2024-10-14T14:01:28.170' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Cliente] ([Id_Cliente], [No_Cedula], [Primer_Nombre], [Segundo_Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Direccion], [Telefono], [Email], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (6, N'0041505870041F', N'ANDREA', N'SOFÍA', N'TORRES', N'MEJÍA', CAST(N'1987-05-15T00:00:00.000' AS DateTime), N'MASAYA, NICARAGUA', N'88886789', N'andrea.torres@example.com', N'ADMIN', CAST(N'2024-10-14T14:01:28.170' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Cliente] ([Id_Cliente], [No_Cedula], [Primer_Nombre], [Segundo_Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Direccion], [Telefono], [Email], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (7, N'0022605920053G', N'JUAN', N'CARLOS', N'SALINAS', N'RIVAS', CAST(N'1992-06-26T00:00:00.000' AS DateTime), N'LEÓN, NICARAGUA', N'88887890', N'juan.salinas@example.com', N'ADMIN', CAST(N'2024-10-14T14:01:28.173' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Cliente] ([Id_Cliente], [No_Cedula], [Primer_Nombre], [Segundo_Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Direccion], [Telefono], [Email], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (8, N'0031409800064H', N'SOFÍA', N'MARIANA', N'ALVAREZ', N'ORTIZ', CAST(N'1980-04-14T00:00:00.000' AS DateTime), N'GRANADA, NICARAGUA', N'88888901', N'sofia.alvarez@example.com', N'ADMIN', CAST(N'2024-10-14T14:01:28.173' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Cliente] ([Id_Cliente], [No_Cedula], [Primer_Nombre], [Segundo_Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Direccion], [Telefono], [Email], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (9, N'0012505950025I', N'MIGUEL', N'ÁNGEL', N'ROJAS', N'CRUZ', CAST(N'1995-05-25T00:00:00.000' AS DateTime), N'MANAGUA, NICARAGUA', N'88889012', N'miguel.rojas@example.com', N'ADMIN', CAST(N'2024-10-14T14:01:28.177' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Cliente] ([Id_Cliente], [No_Cedula], [Primer_Nombre], [Segundo_Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Direccion], [Telefono], [Email], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (10, N'0043009870013J', N'GABRIELA', N'PAOLA', N'CASTRO', N'JIMÉNEZ', CAST(N'1987-03-30T00:00:00.000' AS DateTime), N'MASAYA, NICARAGUA', N'88889013', N'gabriela.castro@example.com', N'ADMIN', CAST(N'2024-10-14T14:01:28.177' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Cliente] ([Id_Cliente], [No_Cedula], [Primer_Nombre], [Segundo_Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Direccion], [Telefono], [Email], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (11, N'0020110950022K', N'RAÚL', N'EMILIO', N'MORALES', N'NÚÑEZ', CAST(N'1995-01-01T00:00:00.000' AS DateTime), N'LEÓN, NICARAGUA', N'88889014', N'raul.morales@example.com', N'ADMIN', CAST(N'2024-10-14T14:01:28.180' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Cliente] ([Id_Cliente], [No_Cedula], [Primer_Nombre], [Segundo_Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Direccion], [Telefono], [Email], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (12, N'0011809880054L', N'FABIOLA', N'ISABEL', N'MENDOZA', N'VEGA', CAST(N'1988-08-18T00:00:00.000' AS DateTime), N'MANAGUA, NICARAGUA', N'88889015', N'fabiola.mendoza@example.com', N'ADMIN', CAST(N'2024-10-14T14:01:28.180' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Cliente] ([Id_Cliente], [No_Cedula], [Primer_Nombre], [Segundo_Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Direccion], [Telefono], [Email], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (13, N'0033107890035M', N'DANIEL', N'ESTEBAN', N'PEÑA', N'ROMERO', CAST(N'1989-10-31T00:00:00.000' AS DateTime), N'GRANADA, NICARAGUA', N'88889016', N'daniel.pena@example.com', N'ADMIN', CAST(N'2024-10-14T14:01:28.183' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Cliente] ([Id_Cliente], [No_Cedula], [Primer_Nombre], [Segundo_Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Direccion], [Telefono], [Email], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (14, N'0020507930026N', N'VERÓNICA', N'PATRICIA', N'REYES', N'GARCÍA', CAST(N'1993-05-05T00:00:00.000' AS DateTime), N'LEÓN, NICARAGUA', N'88889017', N'veronica.reyes@example.com', N'ADMIN', CAST(N'2024-10-14T14:01:28.183' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Cliente] ([Id_Cliente], [No_Cedula], [Primer_Nombre], [Segundo_Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Direccion], [Telefono], [Email], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (15, N'0010906990044O', N'FRANCISCO', N'JAVIER', N'NAVARRO', N'FUENTES', CAST(N'1999-06-09T00:00:00.000' AS DateTime), N'MANAGUA, NICARAGUA', N'88889018', N'francisco.navarro@example.com', N'ADMIN', CAST(N'2024-10-14T14:01:28.187' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Cliente] ([Id_Cliente], [No_Cedula], [Primer_Nombre], [Segundo_Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Direccion], [Telefono], [Email], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (16, N'0011509920021A', N'LUIS', N'MANUEL', N'PÉREZ', N'RUIZ', CAST(N'1992-05-15T00:00:00.000' AS DateTime), N'MANAGUA, NICARAGUA', N'88881234', N'luis.perez@example.com', N'ADMIN', CAST(N'2024-10-14T14:04:28.033' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Cliente] ([Id_Cliente], [No_Cedula], [Primer_Nombre], [Segundo_Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Direccion], [Telefono], [Email], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (17, N'0022101890032B', N'MARÍA', N'JOSÉ', N'GÓMEZ', N'RAMÍREZ', CAST(N'1989-01-21T00:00:00.000' AS DateTime), N'LEÓN, NICARAGUA', N'88882345', N'maria.gomez@example.com', N'ADMIN', CAST(N'2024-10-14T14:04:28.037' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Cliente] ([Id_Cliente], [No_Cedula], [Primer_Nombre], [Segundo_Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Direccion], [Telefono], [Email], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (18, N'0010707900013C', N'CARLOS', N'ALBERTO', N'MARTÍNEZ', N'LÓPEZ', CAST(N'1990-07-07T00:00:00.000' AS DateTime), N'MANAGUA, NICARAGUA', N'88883456', N'carlos.martinez@example.com', N'ADMIN', CAST(N'2024-10-14T14:04:28.037' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Cliente] ([Id_Cliente], [No_Cedula], [Primer_Nombre], [Segundo_Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Direccion], [Telefono], [Email], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (19, N'0031508850041D', N'CLAUDIA', N'ESTHER', N'RODRÍGUEZ', N'HERNÁNDEZ', CAST(N'1985-08-15T00:00:00.000' AS DateTime), N'GRANADA, NICARAGUA', N'88884567', N'claudia.rodriguez@example.com', N'ADMIN', CAST(N'2024-10-14T14:04:28.040' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Cliente] ([Id_Cliente], [No_Cedula], [Primer_Nombre], [Segundo_Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Direccion], [Telefono], [Email], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (20, N'0042005960032E', N'DAVID', N'ANTONIO', N'FERNÁNDEZ', N'ROJAS', CAST(N'1996-06-20T00:00:00.000' AS DateTime), N'MASAYA, NICARAGUA', N'88885678', N'david.fernandez@example.com', N'ADMIN', CAST(N'2024-10-14T14:04:28.040' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Cliente] ([Id_Cliente], [No_Cedula], [Primer_Nombre], [Segundo_Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Direccion], [Telefono], [Email], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (21, N'0012707980044F', N'LUCÍA', N'FERNANDA', N'CASTILLO', N'MEJÍA', CAST(N'1998-07-27T00:00:00.000' AS DateTime), N'MANAGUA, NICARAGUA', N'88886789', N'lucia.castillo@example.com', N'ADMIN', CAST(N'2024-10-14T14:04:28.040' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Cliente] ([Id_Cliente], [No_Cedula], [Primer_Nombre], [Segundo_Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Direccion], [Telefono], [Email], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (22, N'0021007920053G', N'JUAN', N'FRANCISCO', N'SALAZAR', N'VARGAS', CAST(N'1992-07-10T00:00:00.000' AS DateTime), N'LEÓN, NICARAGUA', N'88887890', N'juan.salazar@example.com', N'ADMIN', CAST(N'2024-10-14T14:04:28.043' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Cliente] ([Id_Cliente], [No_Cedula], [Primer_Nombre], [Segundo_Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Direccion], [Telefono], [Email], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (23, N'0030905900061H', N'PATRICIA', N'GABRIELA', N'ORTEGA', N'MORALES', CAST(N'1990-05-09T00:00:00.000' AS DateTime), N'GRANADA, NICARAGUA', N'88888901', N'patricia.ortega@example.com', N'ADMIN', CAST(N'2024-10-14T14:04:28.043' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Cliente] ([Id_Cliente], [No_Cedula], [Primer_Nombre], [Segundo_Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Direccion], [Telefono], [Email], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (24, N'0041204880025I', N'MIGUEL', N'ÁNGEL', N'PINEDA', N'DÍAZ', CAST(N'1988-04-12T00:00:00.000' AS DateTime), N'MASAYA, NICARAGUA', N'88889012', N'miguel.pineda@example.com', N'ADMIN', CAST(N'2024-10-14T14:04:28.047' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Cliente] ([Id_Cliente], [No_Cedula], [Primer_Nombre], [Segundo_Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Direccion], [Telefono], [Email], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (25, N'0023005850013J', N'GABRIELA', N'BEATRIZ', N'CHÁVEZ', N'FUENTES', CAST(N'1985-05-30T00:00:00.000' AS DateTime), N'LEÓN, NICARAGUA', N'88889013', N'gabriela.chavez@example.com', N'ADMIN', CAST(N'2024-10-14T14:04:28.047' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Cliente] ([Id_Cliente], [No_Cedula], [Primer_Nombre], [Segundo_Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Direccion], [Telefono], [Email], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (26, N'0010505930022K', N'RAÚL', N'IGNACIO', N'MORENO', N'LÓPEZ', CAST(N'1993-05-05T00:00:00.000' AS DateTime), N'MANAGUA, NICARAGUA', N'88889014', N'raul.moreno@example.com', N'ADMIN', CAST(N'2024-10-14T14:04:28.050' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Cliente] ([Id_Cliente], [No_Cedula], [Primer_Nombre], [Segundo_Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Direccion], [Telefono], [Email], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (27, N'0041407940054L', N'FABIOLA', N'ALEJANDRA', N'MENDOZA', N'TORRES', CAST(N'1994-07-14T00:00:00.000' AS DateTime), N'MASAYA, NICARAGUA', N'88889015', N'fabiola.mendoza@example.com', N'ADMIN', CAST(N'2024-10-14T14:04:28.050' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Cliente] ([Id_Cliente], [No_Cedula], [Primer_Nombre], [Segundo_Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Direccion], [Telefono], [Email], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (28, N'0013108810035M', N'DANIEL', N'ENRIQUE', N'RUIZ', N'PÉREZ', CAST(N'1981-08-31T00:00:00.000' AS DateTime), N'MANAGUA, NICARAGUA', N'88889016', N'daniel.ruiz@example.com', N'ADMIN', CAST(N'2024-10-14T14:04:28.050' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Cliente] ([Id_Cliente], [No_Cedula], [Primer_Nombre], [Segundo_Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Direccion], [Telefono], [Email], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (29, N'0020605970026N', N'MARÍA', N'PATRICIA', N'REYES', N'ORTIZ', CAST(N'1997-06-06T00:00:00.000' AS DateTime), N'LEÓN, NICARAGUA', N'88889017', N'maria.reyes@example.com', N'ADMIN', CAST(N'2024-10-14T14:04:28.053' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Cliente] ([Id_Cliente], [No_Cedula], [Primer_Nombre], [Segundo_Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Direccion], [Telefono], [Email], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (30, N'0031806880044O', N'FRANCISCO', N'JAVIER', N'PONCE', N'GARCIA', CAST(N'1988-06-18T00:00:00.000' AS DateTime), N'GRANADA, NICARAGUA', N'88889018', N'francisco.ponce@example.com', N'ADMIN', CAST(N'2024-10-14T14:04:28.053' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Cliente] ([Id_Cliente], [No_Cedula], [Primer_Nombre], [Segundo_Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Direccion], [Telefono], [Email], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (31, N'0010709970031X', N'SEBASTIAN', N'', N'MEZA', N'', CAST(N'1997-09-07T00:00:00.000' AS DateTime), N'D', N'78968574', N'', N'ADMIN', CAST(N'2024-10-17T18:17:38.670' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Cliente] ([Id_Cliente], [No_Cedula], [Primer_Nombre], [Segundo_Nombre], [Primer_Apellido], [Segundo_Apellido], [Fecha_Nacimiento], [Direccion], [Telefono], [Email], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (32, N'0010709970031W', N'MEYLING', N'', N'PEREZ', N'', CAST(N'1997-09-07T00:00:00.000' AS DateTime), N'DIRECCION', N'88779947', N'', N'ADMIN', CAST(N'2024-10-18T09:10:13.857' AS DateTime), NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Cliente] OFF
GO
SET IDENTITY_INSERT [dbo].[Compra] ON 

INSERT [dbo].[Compra] ([Id_Compra], [Id_Proveedor], [Fecha_Compra], [Total_Compra], [Usuario_Crea], [Fecha_Creacion], [Usuario_Modifica], [Fecha_Modificacion], [Estado]) VALUES (4, 16, CAST(N'2024-10-15T12:18:05.827' AS DateTime), CAST(24200 AS Decimal(18, 0)), N'ADMIN', CAST(N'2024-10-15T12:18:05.827' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Compra] ([Id_Compra], [Id_Proveedor], [Fecha_Compra], [Total_Compra], [Usuario_Crea], [Fecha_Creacion], [Usuario_Modifica], [Fecha_Modificacion], [Estado]) VALUES (5, 17, CAST(N'2024-10-15T15:05:45.610' AS DateTime), CAST(2400 AS Decimal(18, 0)), N'ADMIN', CAST(N'2024-10-15T15:05:45.610' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Compra] ([Id_Compra], [Id_Proveedor], [Fecha_Compra], [Total_Compra], [Usuario_Crea], [Fecha_Creacion], [Usuario_Modifica], [Fecha_Modificacion], [Estado]) VALUES (6, 12, CAST(N'2024-10-15T15:06:57.333' AS DateTime), CAST(15000 AS Decimal(18, 0)), N'ADMIN', CAST(N'2024-10-15T15:06:57.333' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Compra] ([Id_Compra], [Id_Proveedor], [Fecha_Compra], [Total_Compra], [Usuario_Crea], [Fecha_Creacion], [Usuario_Modifica], [Fecha_Modificacion], [Estado]) VALUES (11, 12, CAST(N'2024-10-15T15:42:12.427' AS DateTime), CAST(15000 AS Decimal(18, 0)), N'ADMIN', CAST(N'2024-10-15T15:42:12.427' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Compra] ([Id_Compra], [Id_Proveedor], [Fecha_Compra], [Total_Compra], [Usuario_Crea], [Fecha_Creacion], [Usuario_Modifica], [Fecha_Modificacion], [Estado]) VALUES (12, 12, CAST(N'2024-10-15T16:53:31.283' AS DateTime), CAST(74000 AS Decimal(18, 0)), N'ADMIN', CAST(N'2024-10-15T16:53:31.283' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Compra] ([Id_Compra], [Id_Proveedor], [Fecha_Compra], [Total_Compra], [Usuario_Crea], [Fecha_Creacion], [Usuario_Modifica], [Fecha_Modificacion], [Estado]) VALUES (13, 12, CAST(N'2024-10-15T16:57:10.397' AS DateTime), CAST(74000 AS Decimal(18, 0)), N'ADMIN', CAST(N'2024-10-15T16:57:10.397' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Compra] ([Id_Compra], [Id_Proveedor], [Fecha_Compra], [Total_Compra], [Usuario_Crea], [Fecha_Creacion], [Usuario_Modifica], [Fecha_Modificacion], [Estado]) VALUES (14, 12, CAST(N'2024-10-15T17:03:45.810' AS DateTime), CAST(74000 AS Decimal(18, 0)), N'ADMIN', CAST(N'2024-10-15T17:03:45.810' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Compra] ([Id_Compra], [Id_Proveedor], [Fecha_Compra], [Total_Compra], [Usuario_Crea], [Fecha_Creacion], [Usuario_Modifica], [Fecha_Modificacion], [Estado]) VALUES (15, 12, CAST(N'2024-10-18T09:14:08.273' AS DateTime), CAST(110400 AS Decimal(18, 0)), N'ADMIN', CAST(N'2024-10-18T09:14:08.273' AS DateTime), NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Compra] OFF
GO
SET IDENTITY_INSERT [dbo].[Detalle_Compra] ON 

INSERT [dbo].[Detalle_Compra] ([Id_Detalle_C], [Id_Compra], [Id_Producto], [Cantidad], [Precio_Unitario], [SubTotal], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (1, 4, 4, 10, CAST(1200 AS Decimal(18, 0)), CAST(12000 AS Decimal(18, 0)), N'ADMIN', CAST(N'2024-10-15T12:18:05.830' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Detalle_Compra] ([Id_Detalle_C], [Id_Compra], [Id_Producto], [Cantidad], [Precio_Unitario], [SubTotal], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (2, 4, 5, 5, CAST(1000 AS Decimal(18, 0)), CAST(5000 AS Decimal(18, 0)), N'ADMIN', CAST(N'2024-10-15T12:18:05.830' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Detalle_Compra] ([Id_Detalle_C], [Id_Compra], [Id_Producto], [Cantidad], [Precio_Unitario], [SubTotal], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (3, 4, 6, 8, CAST(900 AS Decimal(18, 0)), CAST(7200 AS Decimal(18, 0)), N'ADMIN', CAST(N'2024-10-15T12:18:05.830' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Detalle_Compra] ([Id_Detalle_C], [Id_Compra], [Id_Producto], [Cantidad], [Precio_Unitario], [SubTotal], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (4, 5, 11, 4, CAST(600 AS Decimal(18, 0)), CAST(2400 AS Decimal(18, 0)), N'ADMIN', CAST(N'2024-10-15T15:05:45.613' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Detalle_Compra] ([Id_Detalle_C], [Id_Compra], [Id_Producto], [Cantidad], [Precio_Unitario], [SubTotal], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (5, 6, 4, 10, CAST(1200 AS Decimal(18, 0)), CAST(12000 AS Decimal(18, 0)), N'ADMIN', CAST(N'2024-10-15T15:06:57.333' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Detalle_Compra] ([Id_Detalle_C], [Id_Compra], [Id_Producto], [Cantidad], [Precio_Unitario], [SubTotal], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (6, 6, 7, 6, CAST(500 AS Decimal(18, 0)), CAST(3000 AS Decimal(18, 0)), N'ADMIN', CAST(N'2024-10-15T15:06:57.333' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Detalle_Compra] ([Id_Detalle_C], [Id_Compra], [Id_Producto], [Cantidad], [Precio_Unitario], [SubTotal], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (15, 11, 4, 10, CAST(1200 AS Decimal(18, 0)), CAST(12000 AS Decimal(18, 0)), N'ADMIN', CAST(N'2024-10-15T15:42:12.427' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Detalle_Compra] ([Id_Detalle_C], [Id_Compra], [Id_Producto], [Cantidad], [Precio_Unitario], [SubTotal], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (16, 11, 7, 6, CAST(500 AS Decimal(18, 0)), CAST(3000 AS Decimal(18, 0)), N'ADMIN', CAST(N'2024-10-15T15:42:12.427' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Detalle_Compra] ([Id_Detalle_C], [Id_Compra], [Id_Producto], [Cantidad], [Precio_Unitario], [SubTotal], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (17, 12, 17, 10, CAST(2800 AS Decimal(18, 0)), CAST(28000 AS Decimal(18, 0)), N'ADMIN', CAST(N'2024-10-15T16:53:31.287' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Detalle_Compra] ([Id_Detalle_C], [Id_Compra], [Id_Producto], [Cantidad], [Precio_Unitario], [SubTotal], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (18, 12, 15, 13, CAST(2800 AS Decimal(18, 0)), CAST(36400 AS Decimal(18, 0)), N'ADMIN', CAST(N'2024-10-15T16:53:31.287' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Detalle_Compra] ([Id_Detalle_C], [Id_Compra], [Id_Producto], [Cantidad], [Precio_Unitario], [SubTotal], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (19, 12, 16, 6, CAST(1600 AS Decimal(18, 0)), CAST(9600 AS Decimal(18, 0)), N'ADMIN', CAST(N'2024-10-15T16:53:31.287' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Detalle_Compra] ([Id_Detalle_C], [Id_Compra], [Id_Producto], [Cantidad], [Precio_Unitario], [SubTotal], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (20, 13, 17, 10, CAST(2800 AS Decimal(18, 0)), CAST(28000 AS Decimal(18, 0)), N'ADMIN', CAST(N'2024-10-15T16:57:10.397' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Detalle_Compra] ([Id_Detalle_C], [Id_Compra], [Id_Producto], [Cantidad], [Precio_Unitario], [SubTotal], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (21, 13, 15, 13, CAST(2800 AS Decimal(18, 0)), CAST(36400 AS Decimal(18, 0)), N'ADMIN', CAST(N'2024-10-15T16:57:10.397' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Detalle_Compra] ([Id_Detalle_C], [Id_Compra], [Id_Producto], [Cantidad], [Precio_Unitario], [SubTotal], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (22, 13, 16, 6, CAST(1600 AS Decimal(18, 0)), CAST(9600 AS Decimal(18, 0)), N'ADMIN', CAST(N'2024-10-15T16:57:10.397' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Detalle_Compra] ([Id_Detalle_C], [Id_Compra], [Id_Producto], [Cantidad], [Precio_Unitario], [SubTotal], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (23, 14, 17, 10, CAST(2800 AS Decimal(18, 0)), CAST(28000 AS Decimal(18, 0)), N'ADMIN', CAST(N'2024-10-15T17:03:45.810' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Detalle_Compra] ([Id_Detalle_C], [Id_Compra], [Id_Producto], [Cantidad], [Precio_Unitario], [SubTotal], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (24, 14, 15, 13, CAST(2800 AS Decimal(18, 0)), CAST(36400 AS Decimal(18, 0)), N'ADMIN', CAST(N'2024-10-15T17:03:45.810' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Detalle_Compra] ([Id_Detalle_C], [Id_Compra], [Id_Producto], [Cantidad], [Precio_Unitario], [SubTotal], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (25, 14, 16, 6, CAST(1600 AS Decimal(18, 0)), CAST(9600 AS Decimal(18, 0)), N'ADMIN', CAST(N'2024-10-15T17:03:45.810' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Detalle_Compra] ([Id_Detalle_C], [Id_Compra], [Id_Producto], [Cantidad], [Precio_Unitario], [SubTotal], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (26, 15, 25, 10, CAST(2800 AS Decimal(18, 0)), CAST(28000 AS Decimal(18, 0)), N'ADMIN', CAST(N'2024-10-18T09:14:08.283' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Detalle_Compra] ([Id_Detalle_C], [Id_Compra], [Id_Producto], [Cantidad], [Precio_Unitario], [SubTotal], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (27, 15, 24, 13, CAST(2800 AS Decimal(18, 0)), CAST(36400 AS Decimal(18, 0)), N'ADMIN', CAST(N'2024-10-18T09:14:08.283' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Detalle_Compra] ([Id_Detalle_C], [Id_Compra], [Id_Producto], [Cantidad], [Precio_Unitario], [SubTotal], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (28, 15, 23, 13, CAST(2800 AS Decimal(18, 0)), CAST(36400 AS Decimal(18, 0)), N'ADMIN', CAST(N'2024-10-18T09:14:08.283' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Detalle_Compra] ([Id_Detalle_C], [Id_Compra], [Id_Producto], [Cantidad], [Precio_Unitario], [SubTotal], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (29, 15, 21, 6, CAST(1600 AS Decimal(18, 0)), CAST(9600 AS Decimal(18, 0)), N'ADMIN', CAST(N'2024-10-18T09:14:08.283' AS DateTime), NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Detalle_Compra] OFF
GO
SET IDENTITY_INSERT [dbo].[Detalle_Venta] ON 

INSERT [dbo].[Detalle_Venta] ([Id_Detalle], [Id_Venta], [Id_Producto], [Cantidad], [Precio_Unitario], [Sub_Total], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (1, 2, 4, 2, CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'ADMIN', CAST(N'2024-10-15T16:40:46.800' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Detalle_Venta] ([Id_Detalle], [Id_Venta], [Id_Producto], [Cantidad], [Precio_Unitario], [Sub_Total], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (2, 2, 5, 1, CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'ADMIN', CAST(N'2024-10-15T16:40:46.800' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Detalle_Venta] ([Id_Detalle], [Id_Venta], [Id_Producto], [Cantidad], [Precio_Unitario], [Sub_Total], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (3, 2, 7, 3, CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), N'ADMIN', CAST(N'2024-10-15T16:40:46.800' AS DateTime), NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Detalle_Venta] OFF
GO
SET IDENTITY_INSERT [dbo].[Inventario] ON 

INSERT [dbo].[Inventario] ([Id_Inventario], [Id_Producto], [Tipo_Movimiento], [Cantidad], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado], [Id_Factura_Compra], [Id_Factura_Venta]) VALUES (1, 4, 1, 10, N'ADMIN', CAST(N'2024-10-15T12:18:05.837' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Inventario] ([Id_Inventario], [Id_Producto], [Tipo_Movimiento], [Cantidad], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado], [Id_Factura_Compra], [Id_Factura_Venta]) VALUES (2, 5, 1, 5, N'ADMIN', CAST(N'2024-10-15T12:18:05.837' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Inventario] ([Id_Inventario], [Id_Producto], [Tipo_Movimiento], [Cantidad], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado], [Id_Factura_Compra], [Id_Factura_Venta]) VALUES (3, 6, 1, 8, N'ADMIN', CAST(N'2024-10-15T12:18:05.837' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Inventario] ([Id_Inventario], [Id_Producto], [Tipo_Movimiento], [Cantidad], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado], [Id_Factura_Compra], [Id_Factura_Venta]) VALUES (4, 11, 1, 4, N'ADMIN', CAST(N'2024-10-15T15:05:45.613' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Inventario] ([Id_Inventario], [Id_Producto], [Tipo_Movimiento], [Cantidad], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado], [Id_Factura_Compra], [Id_Factura_Venta]) VALUES (5, 4, 1, 10, N'ADMIN', CAST(N'2024-10-15T15:06:57.333' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Inventario] ([Id_Inventario], [Id_Producto], [Tipo_Movimiento], [Cantidad], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado], [Id_Factura_Compra], [Id_Factura_Venta]) VALUES (6, 7, 1, 6, N'ADMIN', CAST(N'2024-10-15T15:06:57.333' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Inventario] ([Id_Inventario], [Id_Producto], [Tipo_Movimiento], [Cantidad], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado], [Id_Factura_Compra], [Id_Factura_Venta]) VALUES (11, 4, 1, 10, N'ADMIN', CAST(N'2024-10-15T15:42:12.427' AS DateTime), NULL, NULL, 1, 11, NULL)
INSERT [dbo].[Inventario] ([Id_Inventario], [Id_Producto], [Tipo_Movimiento], [Cantidad], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado], [Id_Factura_Compra], [Id_Factura_Venta]) VALUES (12, 7, 1, 6, N'ADMIN', CAST(N'2024-10-15T15:42:12.430' AS DateTime), NULL, NULL, 1, 11, NULL)
INSERT [dbo].[Inventario] ([Id_Inventario], [Id_Producto], [Tipo_Movimiento], [Cantidad], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado], [Id_Factura_Compra], [Id_Factura_Venta]) VALUES (13, 4, 0, -2, N'ADMIN', CAST(N'2024-10-15T16:40:46.803' AS DateTime), NULL, NULL, 1, NULL, 2)
INSERT [dbo].[Inventario] ([Id_Inventario], [Id_Producto], [Tipo_Movimiento], [Cantidad], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado], [Id_Factura_Compra], [Id_Factura_Venta]) VALUES (14, 5, 0, -1, N'ADMIN', CAST(N'2024-10-15T16:40:46.803' AS DateTime), NULL, NULL, 1, NULL, 2)
INSERT [dbo].[Inventario] ([Id_Inventario], [Id_Producto], [Tipo_Movimiento], [Cantidad], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado], [Id_Factura_Compra], [Id_Factura_Venta]) VALUES (15, 7, 0, -3, N'ADMIN', CAST(N'2024-10-15T16:40:46.803' AS DateTime), NULL, NULL, 1, NULL, 2)
INSERT [dbo].[Inventario] ([Id_Inventario], [Id_Producto], [Tipo_Movimiento], [Cantidad], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado], [Id_Factura_Compra], [Id_Factura_Venta]) VALUES (16, 17, 1, 10, N'ADMIN', CAST(N'2024-10-15T16:53:31.287' AS DateTime), NULL, NULL, 1, 12, NULL)
INSERT [dbo].[Inventario] ([Id_Inventario], [Id_Producto], [Tipo_Movimiento], [Cantidad], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado], [Id_Factura_Compra], [Id_Factura_Venta]) VALUES (17, 15, 1, 13, N'ADMIN', CAST(N'2024-10-15T16:53:31.290' AS DateTime), NULL, NULL, 1, 12, NULL)
INSERT [dbo].[Inventario] ([Id_Inventario], [Id_Producto], [Tipo_Movimiento], [Cantidad], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado], [Id_Factura_Compra], [Id_Factura_Venta]) VALUES (18, 16, 1, 6, N'ADMIN', CAST(N'2024-10-15T16:53:31.290' AS DateTime), NULL, NULL, 1, 12, NULL)
INSERT [dbo].[Inventario] ([Id_Inventario], [Id_Producto], [Tipo_Movimiento], [Cantidad], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado], [Id_Factura_Compra], [Id_Factura_Venta]) VALUES (19, 17, 1, 10, N'ADMIN', CAST(N'2024-10-15T16:57:10.400' AS DateTime), NULL, NULL, 1, 13, NULL)
INSERT [dbo].[Inventario] ([Id_Inventario], [Id_Producto], [Tipo_Movimiento], [Cantidad], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado], [Id_Factura_Compra], [Id_Factura_Venta]) VALUES (20, 15, 1, 13, N'ADMIN', CAST(N'2024-10-15T16:57:10.400' AS DateTime), NULL, NULL, 1, 13, NULL)
INSERT [dbo].[Inventario] ([Id_Inventario], [Id_Producto], [Tipo_Movimiento], [Cantidad], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado], [Id_Factura_Compra], [Id_Factura_Venta]) VALUES (21, 16, 1, 6, N'ADMIN', CAST(N'2024-10-15T16:57:10.400' AS DateTime), NULL, NULL, 1, 13, NULL)
INSERT [dbo].[Inventario] ([Id_Inventario], [Id_Producto], [Tipo_Movimiento], [Cantidad], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado], [Id_Factura_Compra], [Id_Factura_Venta]) VALUES (22, 17, 1, 10, N'ADMIN', CAST(N'2024-10-15T17:03:45.810' AS DateTime), NULL, NULL, 1, 14, NULL)
INSERT [dbo].[Inventario] ([Id_Inventario], [Id_Producto], [Tipo_Movimiento], [Cantidad], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado], [Id_Factura_Compra], [Id_Factura_Venta]) VALUES (23, 15, 1, 13, N'ADMIN', CAST(N'2024-10-15T17:03:45.813' AS DateTime), NULL, NULL, 1, 14, NULL)
INSERT [dbo].[Inventario] ([Id_Inventario], [Id_Producto], [Tipo_Movimiento], [Cantidad], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado], [Id_Factura_Compra], [Id_Factura_Venta]) VALUES (24, 16, 1, 6, N'ADMIN', CAST(N'2024-10-15T17:03:45.817' AS DateTime), NULL, NULL, 1, 14, NULL)
INSERT [dbo].[Inventario] ([Id_Inventario], [Id_Producto], [Tipo_Movimiento], [Cantidad], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado], [Id_Factura_Compra], [Id_Factura_Venta]) VALUES (25, 25, 1, 10, N'ADMIN', CAST(N'2024-10-18T09:14:08.323' AS DateTime), NULL, NULL, 1, 15, NULL)
INSERT [dbo].[Inventario] ([Id_Inventario], [Id_Producto], [Tipo_Movimiento], [Cantidad], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado], [Id_Factura_Compra], [Id_Factura_Venta]) VALUES (26, 24, 1, 13, N'ADMIN', CAST(N'2024-10-18T09:14:08.337' AS DateTime), NULL, NULL, 1, 15, NULL)
INSERT [dbo].[Inventario] ([Id_Inventario], [Id_Producto], [Tipo_Movimiento], [Cantidad], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado], [Id_Factura_Compra], [Id_Factura_Venta]) VALUES (27, 23, 1, 13, N'ADMIN', CAST(N'2024-10-18T09:14:08.337' AS DateTime), NULL, NULL, 1, 15, NULL)
INSERT [dbo].[Inventario] ([Id_Inventario], [Id_Producto], [Tipo_Movimiento], [Cantidad], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado], [Id_Factura_Compra], [Id_Factura_Venta]) VALUES (28, 21, 1, 6, N'ADMIN', CAST(N'2024-10-18T09:14:08.337' AS DateTime), NULL, NULL, 1, 15, NULL)
SET IDENTITY_INSERT [dbo].[Inventario] OFF
GO
SET IDENTITY_INSERT [dbo].[Marca] ON 

INSERT [dbo].[Marca] ([Id_Marca], [Nombre], [Descripcion], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (36, N'APPLE', N'CELULARES Y PRODUCTOS TECNOLÓGICOS', N'ADMIN', CAST(N'2024-10-14T13:18:11.857' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Marca] ([Id_Marca], [Nombre], [Descripcion], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (37, N'SAMSUNG', N'DISPOSITIVOS MÓVILES Y ELECTRÓNICA', N'ADMIN', CAST(N'2024-10-14T13:18:11.873' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Marca] ([Id_Marca], [Nombre], [Descripcion], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (38, N'HUAWEI', N'CELULARES Y TECNOLOGÍA', N'ADMIN', CAST(N'2024-10-14T13:18:11.873' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Marca] ([Id_Marca], [Nombre], [Descripcion], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (39, N'XIAOMI', N'CELULARES Y PRODUCTOS ELECTRÓNICOS', N'ADMIN', CAST(N'2024-10-14T13:18:11.873' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Marca] ([Id_Marca], [Nombre], [Descripcion], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (40, N'OPPO', N'DISPOSITIVOS MÓVILES', N'ADMIN', CAST(N'2024-10-14T13:18:11.877' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Marca] ([Id_Marca], [Nombre], [Descripcion], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (41, N'PHILIPS', N'ELECTRODOMÉSTICOS Y PRODUCTOS ELECTRÓNICOS', N'ADMIN', CAST(N'2024-10-14T13:20:06.040' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Marca] ([Id_Marca], [Nombre], [Descripcion], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (42, N'PANASONIC', N'ELECTRODOMÉSTICOS Y TECNOLOGÍA AVANZADA', N'ADMIN', CAST(N'2024-10-14T13:20:06.040' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Marca] ([Id_Marca], [Nombre], [Descripcion], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (43, N'ELECTROLUX', N'ELECTRODOMÉSTICOS PARA EL HOGAR Y LA COCINA', N'ADMIN', CAST(N'2024-10-14T13:20:06.050' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Marca] ([Id_Marca], [Nombre], [Descripcion], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (44, N'KENMORE', N'ELECTRODOMÉSTICOS Y ELECTRÓNICA DE CONSUMO', N'ADMIN', CAST(N'2024-10-14T13:20:06.053' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Marca] ([Id_Marca], [Nombre], [Descripcion], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (45, N'MABE', N'ELECTRODOMÉSTICOS PARA EL HOGAR Y LÍNEA BLANCA', N'ADMIN', CAST(N'2024-10-14T13:20:06.053' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Marca] ([Id_Marca], [Nombre], [Descripcion], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (46, N'LG', N'ELECTRODOMÉSTICOS Y ELECTRÓNICA', N'ADMIN', CAST(N'2024-10-14T13:20:16.200' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Marca] ([Id_Marca], [Nombre], [Descripcion], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (47, N'WHIRLPOOL', N'ELECTRODOMÉSTICOS PARA EL HOGAR', N'ADMIN', CAST(N'2024-10-14T13:20:16.200' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Marca] ([Id_Marca], [Nombre], [Descripcion], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (48, N'GENERAL ELECTRIC', N'ELECTRODOMÉSTICOS DE COCINA Y HOGAR', N'ADMIN', CAST(N'2024-10-14T13:20:16.200' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Marca] ([Id_Marca], [Nombre], [Descripcion], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (49, N'BOSCH', N'ELECTRODOMÉSTICOS Y HERRAMIENTAS', N'ADMIN', CAST(N'2024-10-14T13:20:16.203' AS DateTime), NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Marca] OFF
GO
SET IDENTITY_INSERT [dbo].[Producto] ON 

INSERT [dbo].[Producto] ([Id_Producto], [Id_Categoria], [Id_Marca], [Nombre], [Descripcion], [Modelo], [Precio_Venta], [Precio_Costo], [Cantidad_Inventario], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (4, 1, 36, N'IPHONE 14', N'SMARTPHONE DE ÚLTIMA GENERACIÓN', N'A2643', CAST(1560 AS Decimal(18, 0)), CAST(1200 AS Decimal(18, 0)), 0, N'ADMIN', CAST(N'2024-10-14T13:42:30.113' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Producto] ([Id_Producto], [Id_Categoria], [Id_Marca], [Nombre], [Descripcion], [Modelo], [Precio_Venta], [Precio_Costo], [Cantidad_Inventario], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (5, 1, 37, N'GALAXY S22', N'SMARTPHONE CON PANTALLA AMOLED', N'SM-S901U', CAST(1000 AS Decimal(18, 0)), CAST(750 AS Decimal(18, 0)), 0, N'ADMIN', CAST(N'2024-10-14T13:42:30.143' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Producto] ([Id_Producto], [Id_Categoria], [Id_Marca], [Nombre], [Descripcion], [Modelo], [Precio_Venta], [Precio_Costo], [Cantidad_Inventario], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (6, 1, 38, N'HUAWEI P50', N'SMARTPHONE CON CÁMARA DE ALTA CALIDAD', N'JAD-AL50', CAST(900 AS Decimal(18, 0)), CAST(700 AS Decimal(18, 0)), 0, N'ADMIN', CAST(N'2024-10-14T13:42:30.143' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Producto] ([Id_Producto], [Id_Categoria], [Id_Marca], [Nombre], [Descripcion], [Modelo], [Precio_Venta], [Precio_Costo], [Cantidad_Inventario], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (7, 2, 36, N'APPLE WATCH SERIES 7', N'RELOJ INTELIGENTE CON ECG', N'A2476', CAST(650 AS Decimal(18, 0)), CAST(500 AS Decimal(18, 0)), 0, N'ADMIN', CAST(N'2024-10-14T13:43:13.983' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Producto] ([Id_Producto], [Id_Categoria], [Id_Marca], [Nombre], [Descripcion], [Modelo], [Precio_Venta], [Precio_Costo], [Cantidad_Inventario], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (8, 2, 37, N'GALAXY WATCH 4', N'RELOJ INTELIGENTE CON MONITOR DE SALUD', N'SM-R870', CAST(350 AS Decimal(18, 0)), CAST(250 AS Decimal(18, 0)), 0, N'ADMIN', CAST(N'2024-10-14T13:43:13.983' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Producto] ([Id_Producto], [Id_Categoria], [Id_Marca], [Nombre], [Descripcion], [Modelo], [Precio_Venta], [Precio_Costo], [Cantidad_Inventario], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (9, 2, 39, N'XIAOMI MI WATCH', N'RELOJ INTELIGENTE CON MÚLTIPLES FUNCIONES DEPORTIVAS', N'XMWTCL02', CAST(200 AS Decimal(18, 0)), CAST(150 AS Decimal(18, 0)), 0, N'ADMIN', CAST(N'2024-10-14T13:43:13.987' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Producto] ([Id_Producto], [Id_Categoria], [Id_Marca], [Nombre], [Descripcion], [Modelo], [Precio_Venta], [Precio_Costo], [Cantidad_Inventario], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (10, 3, 43, N'REFRIGERADOR ELECTROLUX', N'REFRIGERADOR DE ALTA EFICIENCIA', N'ERF4116AOW', CAST(800 AS Decimal(18, 0)), CAST(600 AS Decimal(18, 0)), 0, N'ADMIN', CAST(N'2024-10-14T13:43:13.987' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Producto] ([Id_Producto], [Id_Categoria], [Id_Marca], [Nombre], [Descripcion], [Modelo], [Precio_Venta], [Precio_Costo], [Cantidad_Inventario], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (11, 3, 45, N'LAVADORA MABE', N'LAVADORA AUTOMÁTICA DE 12KG', N'LMA8524WBAB0', CAST(600 AS Decimal(18, 0)), CAST(450 AS Decimal(18, 0)), 0, N'ADMIN', CAST(N'2024-10-14T13:43:13.990' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Producto] ([Id_Producto], [Id_Categoria], [Id_Marca], [Nombre], [Descripcion], [Modelo], [Precio_Venta], [Precio_Costo], [Cantidad_Inventario], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (12, 3, 46, N'SECADORA LG', N'SECADORA DE ROPA CON SENSOR INTELIGENTE', N'RC9041W', CAST(700 AS Decimal(18, 0)), CAST(500 AS Decimal(18, 0)), 0, N'ADMIN', CAST(N'2024-10-14T13:43:13.990' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Producto] ([Id_Producto], [Id_Categoria], [Id_Marca], [Nombre], [Descripcion], [Modelo], [Precio_Venta], [Precio_Costo], [Cantidad_Inventario], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (13, 4, 41, N'LICUADORA PHILIPS', N'LICUADORA DE 3 VELOCIDADES', N'HR2056/03', CAST(150 AS Decimal(18, 0)), CAST(100 AS Decimal(18, 0)), 0, N'ADMIN', CAST(N'2024-10-14T13:43:13.990' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Producto] ([Id_Producto], [Id_Categoria], [Id_Marca], [Nombre], [Descripcion], [Modelo], [Precio_Venta], [Precio_Costo], [Cantidad_Inventario], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (14, 4, 42, N'MICROONDAS PANASONIC', N'MICROONDAS DIGITAL DE 1000W', N'NN-SN686S', CAST(250 AS Decimal(18, 0)), CAST(180 AS Decimal(18, 0)), 0, N'ADMIN', CAST(N'2024-10-14T13:43:13.990' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Producto] ([Id_Producto], [Id_Categoria], [Id_Marca], [Nombre], [Descripcion], [Modelo], [Precio_Venta], [Precio_Costo], [Cantidad_Inventario], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (15, 4, 44, N'TOSTADORA KENMORE', N'TOSTADORA DE 4 REBANADAS', N'0064065', CAST(3640 AS Decimal(18, 0)), CAST(2800 AS Decimal(18, 0)), 39, N'ADMIN', CAST(N'2024-10-14T13:43:13.993' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Producto] ([Id_Producto], [Id_Categoria], [Id_Marca], [Nombre], [Descripcion], [Modelo], [Precio_Venta], [Precio_Costo], [Cantidad_Inventario], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (16, 5, 37, N'SAMSUNG SOUNDBAR', N'BARRA DE SONIDO CON SUBWOOFER INALÁMBRICO', N'HW-Q60T', CAST(2080 AS Decimal(18, 0)), CAST(1600 AS Decimal(18, 0)), 18, N'ADMIN', CAST(N'2024-10-14T13:43:13.993' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Producto] ([Id_Producto], [Id_Categoria], [Id_Marca], [Nombre], [Descripcion], [Modelo], [Precio_Venta], [Precio_Costo], [Cantidad_Inventario], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (17, 5, 46, N'TELEVISOR LG OLED', N'TELEVISOR OLED DE 55 PULGADAS', N'OLED55CXPUB', CAST(3640 AS Decimal(18, 0)), CAST(2800 AS Decimal(18, 0)), 30, N'ADMIN', CAST(N'2024-10-14T13:43:13.997' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Producto] ([Id_Producto], [Id_Categoria], [Id_Marca], [Nombre], [Descripcion], [Modelo], [Precio_Venta], [Precio_Costo], [Cantidad_Inventario], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (18, 5, 41, N'AUDÍFONOS PHILIPS', N'AUDÍFONOS INALÁMBRICOS CON CANCELACIÓN DE RUIDO', N'TAPH805BK', CAST(200 AS Decimal(18, 0)), CAST(150 AS Decimal(18, 0)), 0, N'ADMIN', CAST(N'2024-10-14T13:43:13.997' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Producto] ([Id_Producto], [Id_Categoria], [Id_Marca], [Nombre], [Descripcion], [Modelo], [Precio_Venta], [Precio_Costo], [Cantidad_Inventario], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (21, 4, 38, N'CAMARA DE SEGURIDAD', N'CAMARA DE SEGURIDAD HD', N'AS148-4', CAST(2080 AS Decimal(18, 0)), CAST(1600 AS Decimal(18, 0)), 6, N'ADMIN', CAST(N'2024-10-17T15:07:45.090' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Producto] ([Id_Producto], [Id_Categoria], [Id_Marca], [Nombre], [Descripcion], [Modelo], [Precio_Venta], [Precio_Costo], [Cantidad_Inventario], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (22, 5, 46, N'TELEVISOR SMART', N'TELEVISOR SMART TV 56 PULGADAS', N'AS744474-484', CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 0, N'ADMIN', CAST(N'2024-10-17T15:08:36.523' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Producto] ([Id_Producto], [Id_Categoria], [Id_Marca], [Nombre], [Descripcion], [Modelo], [Precio_Venta], [Precio_Costo], [Cantidad_Inventario], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (23, 3, 45, N'CAMA QUEEN', N'CAMA QUEEN', N'ASQW-78', CAST(3640 AS Decimal(18, 0)), CAST(2800 AS Decimal(18, 0)), 13, N'ADMIN', CAST(N'2024-10-17T15:09:26.800' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Producto] ([Id_Producto], [Id_Categoria], [Id_Marca], [Nombre], [Descripcion], [Modelo], [Precio_Venta], [Precio_Costo], [Cantidad_Inventario], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (24, 4, 46, N'LAVADORA', N'LAVADORA SEMI AUTOMATICA', N'LG', CAST(3640 AS Decimal(18, 0)), CAST(2800 AS Decimal(18, 0)), 13, N'ADMIN', CAST(N'2024-10-17T17:51:16.980' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Producto] ([Id_Producto], [Id_Categoria], [Id_Marca], [Nombre], [Descripcion], [Modelo], [Precio_Venta], [Precio_Costo], [Cantidad_Inventario], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (25, 5, 39, N'MANOS LIBRES', N'AURICULARES XIAOMI', N'XRL8', CAST(3640 AS Decimal(18, 0)), CAST(2800 AS Decimal(18, 0)), 10, N'ADMIN', CAST(N'2024-10-18T09:08:22.430' AS DateTime), NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Producto] OFF
GO
SET IDENTITY_INSERT [dbo].[Proveedor] ON 

INSERT [dbo].[Proveedor] ([Id_Proveedor], [Nombre], [Contacto], [Telefono], [Direccion], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (12, N'APPLE DISTRIBUTION INC.', N'JOHN DOE', N'50522430001', N'CUPERTINO, CA, USA', N'ADMIN', CAST(N'2024-10-15T11:41:51.710' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Proveedor] ([Id_Proveedor], [Nombre], [Contacto], [Telefono], [Direccion], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (13, N'SAMSUNG ELECTRONICS AMERICA', N'JANE SMITH', N'50522430002', N'RIDGEFIELD PARK, NJ, USA', N'ADMIN', CAST(N'2024-10-15T11:42:08.297' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Proveedor] ([Id_Proveedor], [Nombre], [Contacto], [Telefono], [Direccion], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (14, N'HUAWEI TECHNOLOGIES', N'LI WEI', N'50522430003', N'SHENZHEN, CHINA', N'ADMIN', CAST(N'2024-10-15T11:42:08.300' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Proveedor] ([Id_Proveedor], [Nombre], [Contacto], [Telefono], [Direccion], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (15, N'XIAOMI CORPORATION', N'LEI JUN', N'50522430004', N'BEIJING, CHINA', N'ADMIN', CAST(N'2024-10-15T11:42:08.300' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Proveedor] ([Id_Proveedor], [Nombre], [Contacto], [Telefono], [Direccion], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (16, N'ELECTROLUX HOME PRODUCTS', N'EMILY JOHNSON', N'50522430005', N'STOCKHOLM, SWEDEN', N'ADMIN', CAST(N'2024-10-15T11:42:08.300' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Proveedor] ([Id_Proveedor], [Nombre], [Contacto], [Telefono], [Direccion], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (17, N'MABE INTERNATIONAL', N'CARLOS HERNÁNDEZ', N'50522430006', N'MEXICO CITY, MEXICO', N'ADMIN', CAST(N'2024-10-15T11:42:08.303' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Proveedor] ([Id_Proveedor], [Nombre], [Contacto], [Telefono], [Direccion], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (18, N'LG ELECTRONICS INC.', N'KIM SOO HYUN', N'50522430007', N'SEOUL, SOUTH KOREA', N'ADMIN', CAST(N'2024-10-15T11:42:08.303' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Proveedor] ([Id_Proveedor], [Nombre], [Contacto], [Telefono], [Direccion], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (19, N'PHILIPS ELECTRONICS', N'TOM PHILIPS', N'50522430008', N'AMSTERDAM, NETHERLANDS', N'ADMIN', CAST(N'2024-10-15T11:42:08.307' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Proveedor] ([Id_Proveedor], [Nombre], [Contacto], [Telefono], [Direccion], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (20, N'PANASONIC CORPORATION', N'YUKI TANAKA', N'50522430009', N'OSAKA, JAPAN', N'ADMIN', CAST(N'2024-10-15T11:42:08.307' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Proveedor] ([Id_Proveedor], [Nombre], [Contacto], [Telefono], [Direccion], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (21, N'KENMORE APPLIANCES', N'LAURA WILLIAMS', N'50522430010', N'HOFFMAN ESTATES, IL, USA', N'ADMIN', CAST(N'2024-10-15T11:42:08.310' AS DateTime), NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Proveedor] OFF
GO
SET IDENTITY_INSERT [dbo].[Venta] ON 

INSERT [dbo].[Venta] ([Id_Venta], [Id_Cliente], [Fecha_Venta], [Total], [Usuario_Crea], [Fecha_Creacion], [Usuario_Actualiza], [Fecha_Actualizacion], [Estado]) VALUES (2, 1, CAST(N'2024-10-15T16:40:46.793' AS DateTime), CAST(0 AS Decimal(18, 0)), N'ADMIN', CAST(N'2024-10-15T16:40:46.793' AS DateTime), NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Venta] OFF
GO
ALTER TABLE [dbo].[Compra]  WITH CHECK ADD  CONSTRAINT [Compra_Id_Proveedor_fk] FOREIGN KEY([Id_Proveedor])
REFERENCES [dbo].[Proveedor] ([Id_Proveedor])
GO
ALTER TABLE [dbo].[Compra] CHECK CONSTRAINT [Compra_Id_Proveedor_fk]
GO
ALTER TABLE [dbo].[Detalle_Compra]  WITH CHECK ADD  CONSTRAINT [Detalle_Compra_Id_Compra_fk] FOREIGN KEY([Id_Compra])
REFERENCES [dbo].[Compra] ([Id_Compra])
GO
ALTER TABLE [dbo].[Detalle_Compra] CHECK CONSTRAINT [Detalle_Compra_Id_Compra_fk]
GO
ALTER TABLE [dbo].[Detalle_Compra]  WITH CHECK ADD  CONSTRAINT [Detalle_Compra_Id_Producto_fk] FOREIGN KEY([Id_Producto])
REFERENCES [dbo].[Producto] ([Id_Producto])
GO
ALTER TABLE [dbo].[Detalle_Compra] CHECK CONSTRAINT [Detalle_Compra_Id_Producto_fk]
GO
ALTER TABLE [dbo].[Detalle_Venta]  WITH CHECK ADD  CONSTRAINT [Venta_Detalle_Id_Producto_fk] FOREIGN KEY([Id_Producto])
REFERENCES [dbo].[Producto] ([Id_Producto])
GO
ALTER TABLE [dbo].[Detalle_Venta] CHECK CONSTRAINT [Venta_Detalle_Id_Producto_fk]
GO
ALTER TABLE [dbo].[Detalle_Venta]  WITH CHECK ADD  CONSTRAINT [Venta_Detalle_Id_Venta_fk] FOREIGN KEY([Id_Venta])
REFERENCES [dbo].[Venta] ([Id_Venta])
GO
ALTER TABLE [dbo].[Detalle_Venta] CHECK CONSTRAINT [Venta_Detalle_Id_Venta_fk]
GO
ALTER TABLE [dbo].[Inventario]  WITH CHECK ADD  CONSTRAINT [Inventario_Id_Producto_fk] FOREIGN KEY([Id_Producto])
REFERENCES [dbo].[Producto] ([Id_Producto])
GO
ALTER TABLE [dbo].[Inventario] CHECK CONSTRAINT [Inventario_Id_Producto_fk]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [Producto_Id_Marca_fk] FOREIGN KEY([Id_Marca])
REFERENCES [dbo].[Marca] ([Id_Marca])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [Producto_Id_Marca_fk]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [Producto_IdCategoria_fk] FOREIGN KEY([Id_Categoria])
REFERENCES [dbo].[Categoria] ([Id_Categoria])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [Producto_IdCategoria_fk]
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [Venta_Id_Cliente_fk] FOREIGN KEY([Id_Cliente])
REFERENCES [dbo].[Cliente] ([Id_Cliente])
GO
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [Venta_Id_Cliente_fk]
GO
/****** Object:  StoredProcedure [dbo].[Sp_ActualizarCategoria]    Script Date: 18/10/2024 09:40:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Sp_ActualizarCategoria]
    @Id_Categoria INT,
    @Nombre NVARCHAR(MAX),
    @Descripcion NVARCHAR(MAX),
    @Usuario_Actualiza NVARCHAR(MAX),
    @Resultado INT OUTPUT -- Variable de salida
AS
BEGIN
    SET NOCOUNT ON;
    
    -- Usar el nivel de aislamiento SERIALIZABLE
    SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
    
    BEGIN TRY
        -- Iniciar la transacción
        BEGIN TRANSACTION;
        
        -- Eliminar espacios en blanco a los lados y convertir a mayúsculas
        SET @Nombre = UPPER(LTRIM(RTRIM(@Nombre)));
        SET @Descripcion = UPPER(LTRIM(RTRIM(@Descripcion)));
        SET @Usuario_Actualiza = UPPER(LTRIM(RTRIM(@Usuario_Actualiza)));
        
        -- Verificar si existe la categoría que se va a actualizar
        IF NOT EXISTS (SELECT 1 FROM dbo.Categoria WHERE Id_Categoria = @Id_Categoria)
        BEGIN
            -- La categoría no existe
            SET @Resultado = 0;
            ROLLBACK TRANSACTION;
            RETURN;
        END
        
        -- Verificar si existe otra categoría con el mismo nombre
        IF EXISTS (SELECT 1 FROM dbo.Categoria WHERE Nombre = @Nombre AND Id_Categoria <> @Id_Categoria)
        BEGIN
            -- Ya existe otra categoría con el mismo nombre
            SET @Resultado = 2;
            ROLLBACK TRANSACTION;
            RETURN;
        END
        
        -- Actualizar la categoría
        UPDATE dbo.Categoria
        SET Nombre = @Nombre,
            Descripcion = @Descripcion,
            Usuario_Actualiza = @Usuario_Actualiza,
            Fecha_Actualizacion = GETDATE()
        WHERE Id_Categoria = @Id_Categoria;

        -- Confirmar la transacción
        COMMIT TRANSACTION;
        
        -- Actualización exitosa
        SET @Resultado = 1;
    END TRY
    BEGIN CATCH
        -- En caso de error, revertir la transacción
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        -- Asignar 0 como resultado de error
        SET @Resultado = 0;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_ActualizarCliente]    Script Date: 18/10/2024 09:40:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROC [dbo].[Sp_ActualizarCliente]
    @Id_Cliente INT,
    @No_Cedula NVARCHAR(18),
    @Primer_Nombre NVARCHAR(MAX),
    @Segundo_Nombre NVARCHAR(MAX),
    @Primer_Apellido NVARCHAR(MAX),
    @Segundo_Apellido NVARCHAR(MAX),
    @Fecha_Nacimiento DATETIME,
    @Direccion NVARCHAR(MAX),
    @Telefono NVARCHAR(9),
    @Email NVARCHAR(MAX),
    @Usuario_Actualiza NVARCHAR(MAX),
    @Resultado INT OUTPUT -- Variable de salida
AS
BEGIN
    SET NOCOUNT ON;

    -- Usar el nivel de aislamiento SERIALIZABLE
    SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

    BEGIN TRY
        -- Iniciar la transacción
        BEGIN TRANSACTION;

        -- Eliminar espacios en blanco a los lados y convertir a mayúsculas
        SET @No_Cedula = UPPER(LTRIM(RTRIM(@No_Cedula)));
        SET @Primer_Nombre = UPPER(LTRIM(RTRIM(@Primer_Nombre)));
        SET @Segundo_Nombre = UPPER(LTRIM(RTRIM(@Segundo_Nombre)));
        SET @Primer_Apellido = UPPER(LTRIM(RTRIM(@Primer_Apellido)));
        SET @Segundo_Apellido = UPPER(LTRIM(RTRIM(@Segundo_Apellido)));
        SET @Direccion = UPPER(LTRIM(RTRIM(@Direccion)));
        SET @Telefono = LTRIM(RTRIM(@Telefono));
        SET @Email = LOWER(LTRIM(RTRIM(@Email))); -- El email se guarda en minúsculas
        SET @Usuario_Actualiza = UPPER(LTRIM(RTRIM(@Usuario_Actualiza)));

        -- Verificar si existe otro cliente con la misma cédula pero diferente Id_Cliente
        IF EXISTS (SELECT 1 FROM dbo.Cliente WHERE No_Cedula = @No_Cedula AND Id_Cliente <> @Id_Cliente)
        BEGIN
            -- Ya existe un cliente con la misma cédula
            SET @Resultado = 2;
            ROLLBACK TRANSACTION;
            RETURN;
        END

        -- Actualizar el cliente
        UPDATE dbo.Cliente
        SET 
            No_Cedula = @No_Cedula,
            Primer_Nombre = @Primer_Nombre,
            Segundo_Nombre = @Segundo_Nombre,
            Primer_Apellido = @Primer_Apellido,
            Segundo_Apellido = @Segundo_Apellido,
            Fecha_Nacimiento = @Fecha_Nacimiento,
            Direccion = @Direccion,
            Telefono = @Telefono,
            Email = @Email,
            Usuario_Actualiza = @Usuario_Actualiza,
            Fecha_Actualizacion = GETDATE()
        WHERE Id_Cliente = @Id_Cliente;

        -- Confirmar la transacción
        COMMIT TRANSACTION;

        -- Actualización exitosa
        SET @Resultado = 1;
    END TRY
    BEGIN CATCH
        -- En caso de error, revertir la transacción
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        -- Asignar 0 como resultado de error
        SET @Resultado = 0;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_ActualizarMarca]    Script Date: 18/10/2024 09:40:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[Sp_ActualizarMarca]
    @Id_Marca INT,  -- Identificador de la marca a actualizar
    @Nombre NVARCHAR(MAX),
    @Descripcion NVARCHAR(MAX),
    @Usuario_Actualiza NVARCHAR(MAX),
    @Resultado INT OUTPUT -- Variable de salida
AS
BEGIN
    SET NOCOUNT ON;

    -- Usar el nivel de aislamiento SERIALIZABLE
    SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

    BEGIN TRY
        -- Iniciar la transacción
        BEGIN TRANSACTION;

        -- Eliminar espacios en blanco a los lados y convertir a mayúsculas
        SET @Nombre = UPPER(LTRIM(RTRIM(@Nombre)));
        SET @Descripcion = UPPER(LTRIM(RTRIM(@Descripcion)));
        SET @Usuario_Actualiza = UPPER(LTRIM(RTRIM(@Usuario_Actualiza)));

        -- Verificar si la marca a actualizar existe
        IF NOT EXISTS (SELECT 1 FROM dbo.Marca WHERE Id_Marca = @Id_Marca)
        BEGIN
            -- La marca no existe
            SET @Resultado = 2; -- Indicar que no se encontró la marca
            ROLLBACK TRANSACTION;
            RETURN;
        END

        -- Verificar si ya existe una marca con el mismo nombre y diferente Id_Marca
        IF EXISTS (SELECT 1 FROM dbo.Marca WHERE Nombre = @Nombre AND Id_Marca <> @Id_Marca)
        BEGIN
            -- Ya existe una marca con el mismo nombre
            SET @Resultado = 3; -- Indicar que el nombre ya existe
            ROLLBACK TRANSACTION;
            RETURN;
        END

        -- Actualizar los datos de la marca
        UPDATE dbo.Marca
        SET Nombre = @Nombre,
            Descripcion = @Descripcion,
            Usuario_Actualiza = @Usuario_Actualiza,
            Fecha_Actualizacion = GETDATE()
        WHERE Id_Marca = @Id_Marca;

        -- Confirmar la transacción
        COMMIT TRANSACTION;

        -- Actualización exitosa
        SET @Resultado = 1;
    END TRY
    BEGIN CATCH
        -- En caso de error, revertir la transacción
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        -- Asignar 0 como resultado de error
        SET @Resultado = 0;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_ActualizarProducto]    Script Date: 18/10/2024 09:40:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Sp_ActualizarProducto]
    @Id_Producto INT,
    @Id_Categoria INT,
    @Id_Marca INT,
    @Nombre NVARCHAR(MAX),
    @Descripcion NVARCHAR(MAX),
    @Modelo NVARCHAR(max),
    @Precio_Venta DECIMAL(18, 0),
    @Precio_Costo DECIMAL(18, 0),
    @Cantidad_Inventario INT,
    @Usuario_Actualiza NVARCHAR(MAX),
    @Resultado INT OUTPUT -- Variable de salida
AS
BEGIN
    SET NOCOUNT ON;
    
    -- Usar el nivel de aislamiento SERIALIZABLE
    SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
    
    BEGIN TRY
        -- Iniciar la transacción
        BEGIN TRANSACTION;

        -- Eliminar espacios en blanco a los lados y convertir a mayúsculas
        SET @Nombre = UPPER(LTRIM(RTRIM(@Nombre)));
        SET @Descripcion = UPPER(LTRIM(RTRIM(@Descripcion)));
        SET @Usuario_Actualiza = UPPER(LTRIM(RTRIM(@Usuario_Actualiza)));
		 SET  @Modelo = UPPER(LTRIM(RTRIM( @Modelo)));

        -- Verificar si el producto existe
        IF NOT EXISTS (SELECT 1 FROM dbo.Producto WHERE Id_Producto = @Id_Producto)
        BEGIN
            -- El producto no existe
            SET @Resultado = 2;
            ROLLBACK TRANSACTION;
            RETURN;
        END

        -- Actualizar el producto
        UPDATE dbo.Producto
        SET 
            Id_Categoria = @Id_Categoria,
            Id_Marca = @Id_Marca,
            Nombre = @Nombre,
            Descripcion = @Descripcion,
            Modelo = @Modelo,
            Precio_Venta = @Precio_Venta,
            Precio_Costo = @Precio_Costo,
            Cantidad_Inventario = @Cantidad_Inventario,
            Usuario_Actualiza = @Usuario_Actualiza,
            Fecha_Actualizacion = GETDATE()
        WHERE Id_Producto = @Id_Producto;

        -- Confirmar la transacción
        COMMIT TRANSACTION;
        
        -- Actualización exitosa
        SET @Resultado = 1;
    END TRY
    BEGIN CATCH
        -- En caso de error, revertir la transacción
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        -- Asignar 0 como resultado de error
        SET @Resultado = 0;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_ActualizarProveedor]    Script Date: 18/10/2024 09:40:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


Create PROC [dbo].[Sp_ActualizarProveedor]
    @Id_Proveedor INT,
    @Nombre NVARCHAR(MAX),
    @Contacto NVARCHAR(MAX),
    @Telefono NVARCHAR(MAX),
    @Direccion NVARCHAR(MAX),
    @Usuario_Actualiza NVARCHAR(MAX),
    @Resultado INT OUTPUT -- Variable de salida
AS
BEGIN
    SET NOCOUNT ON;

    -- Usar el nivel de aislamiento SERIALIZABLE
    SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

    BEGIN TRY
        -- Iniciar la transacción
        BEGIN TRANSACTION;

        -- Eliminar espacios en blanco a los lados y convertir a mayúsculas
        SET @Nombre = UPPER(LTRIM(RTRIM(@Nombre)));
        SET @Contacto = UPPER(LTRIM(RTRIM(@Contacto)));
        SET @Telefono = LTRIM(RTRIM(@Telefono));
        SET @Direccion = UPPER(LTRIM(RTRIM(@Direccion)));
        SET @Usuario_Actualiza = UPPER(LTRIM(RTRIM(@Usuario_Actualiza)));

        -- Verificar si el proveedor existe
        IF NOT EXISTS (SELECT 1 FROM dbo.Proveedor WHERE Id_Proveedor = @Id_Proveedor)
        BEGIN
            -- No existe el proveedor
            SET @Resultado = 2;
            ROLLBACK TRANSACTION;
            RETURN;
        END

        -- Actualizar el proveedor
        UPDATE dbo.Proveedor
        SET Nombre = @Nombre,
            Contacto = @Contacto,
            Telefono = @Telefono,
            Direccion = @Direccion,
            Usuario_Actualiza = @Usuario_Actualiza,
            Fecha_Actualizacion = GETDATE()
        WHERE Id_Proveedor = @Id_Proveedor;

        -- Confirmar la transacción
        COMMIT TRANSACTION;

        -- Actualización exitosa
        SET @Resultado = 1;
    END TRY
    BEGIN CATCH
        -- En caso de error, revertir la transacción
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        -- Asignar 0 como resultado de error
        SET @Resultado = 0;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_InsertarCategoria]    Script Date: 18/10/2024 09:40:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Sp_InsertarCategoria]
    @Nombre NVARCHAR(MAX),
    @Descripcion NVARCHAR(MAX),
    @Usuario_Crea NVARCHAR(MAX),
    @Resultado INT OUTPUT -- Variable de salida
AS
BEGIN
    SET NOCOUNT ON;
    
    -- Usar el nivel de aislamiento SERIALIZABLE
    SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
    
    BEGIN TRY
        -- Iniciar la transacción
        BEGIN TRANSACTION;
        
        -- Eliminar espacios en blanco a los lados y convertir a mayúsculas
        SET @Nombre = UPPER(LTRIM(RTRIM(@Nombre)));
        SET @Descripcion = UPPER(LTRIM(RTRIM(@Descripcion)));
        SET @Usuario_Crea = UPPER(LTRIM(RTRIM(@Usuario_Crea)));
        
        -- Validar si ya existe una categoría con el mismo nombre
        IF EXISTS (SELECT 1 FROM dbo.Categoria WHERE Nombre = @Nombre)
        BEGIN
            -- Ya existe la categoría
            SET @Resultado = 2;
            ROLLBACK TRANSACTION;
            RETURN;
        END

        -- Insertar la nueva categoría
        INSERT INTO dbo.Categoria (Nombre, Descripcion, Usuario_Crea, Fecha_Creacion,Estado)
        VALUES (@Nombre, @Descripcion, @Usuario_Crea, GETDATE(),1);

        -- Confirmar la transacción
        COMMIT TRANSACTION;
        
        -- Inserción exitosa
        SET @Resultado = 1;
    END TRY
    BEGIN CATCH
        -- En caso de error, revertir la transacción
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        -- Asignar 0 como resultado de error
        SET @Resultado = 0;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_InsertarCliente]    Script Date: 18/10/2024 09:40:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Sp_InsertarCliente]
    @No_Cedula NVARCHAR(18),
    @Primer_Nombre NVARCHAR(MAX),
    @Segundo_Nombre NVARCHAR(MAX),
    @Primer_Apellido NVARCHAR(MAX),
    @Segundo_Apellido NVARCHAR(MAX),
    @Fecha_Nacimiento DATETIME,
    @Direccion NVARCHAR(MAX),
    @Telefono NVARCHAR(9),
    @Email NVARCHAR(MAX),
    @Usuario_Crea NVARCHAR(MAX),
    @Resultado INT OUTPUT -- Variable de salida
AS
BEGIN
    SET NOCOUNT ON;
END

GO
/****** Object:  StoredProcedure [dbo].[Sp_InsertarMarca]    Script Date: 18/10/2024 09:40:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Sp_InsertarMarca]
    @Nombre NVARCHAR(MAX),
    @Descripcion NVARCHAR(MAX),
    @Usuario_Crea NVARCHAR(MAX),
    @Resultado INT OUTPUT -- Variable de salida
AS
BEGIN
    SET NOCOUNT ON;

    -- Usar el nivel de aislamiento SERIALIZABLE
    SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

    BEGIN TRY
        -- Iniciar la transacción
        BEGIN TRANSACTION;

        -- Eliminar espacios en blanco a los lados y convertir a mayúsculas
        SET @Nombre = UPPER(LTRIM(RTRIM(@Nombre)));
        SET @Descripcion = UPPER(LTRIM(RTRIM(@Descripcion)));
        SET @Usuario_Crea = UPPER(LTRIM(RTRIM(@Usuario_Crea)));

        -- Verificar si ya existe una marca con el mismo nombre
        IF EXISTS (SELECT 1 FROM dbo.Marca WHERE Nombre = @Nombre)
        BEGIN
            -- Ya existe una marca con el mismo nombre
            SET @Resultado = 2;
            ROLLBACK TRANSACTION;
            RETURN;
        END

        -- Insertar la nueva marca con Estado = 1
		INSERT INTO dbo.Marca
		(
		    Nombre,
		    Descripcion,
		    Usuario_Crea,
		    Fecha_Creacion,
		    Estado
		)
        VALUES (@Nombre, @Descripcion, @Usuario_Crea, GETDATE(), 1);

        -- Confirmar la transacción
        COMMIT TRANSACTION;

        -- Inserción exitosa
        SET @Resultado = 1;
    END TRY
    BEGIN CATCH
        -- En caso de error, revertir la transacción
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        -- Asignar 0 como resultado de error
        SET @Resultado = 0;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_InsertarProducto]    Script Date: 18/10/2024 09:40:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Sp_InsertarProducto]
    @Id_Categoria INT,
    @Id_Marca INT,
    @Nombre NVARCHAR(MAX),
    @Descripcion NVARCHAR(MAX),
    @Modelo NVARCHAR(max),
    @Precio_Venta DECIMAL(18, 0),
    @Precio_Costo DECIMAL(18, 0),
    @Usuario_Crea NVARCHAR(MAX),
    @Resultado INT OUTPUT -- Variable de salida
AS
BEGIN
    SET NOCOUNT ON;

END
GO
/****** Object:  StoredProcedure [dbo].[Sp_InsertarProveedor]    Script Date: 18/10/2024 09:40:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROC [dbo].[Sp_InsertarProveedor]
    @Nombre NVARCHAR(MAX),
    @Contacto NVARCHAR(MAX),
    @Telefono NVARCHAR(MAX),
    @Direccion NVARCHAR(MAX),
    @Usuario_Crea NVARCHAR(MAX),
    @Resultado INT OUTPUT -- Variable de salida
AS
BEGIN
    SET NOCOUNT ON;

    -- Usar el nivel de aislamiento SERIALIZABLE
    SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

    BEGIN TRY
        -- Iniciar la transacción
        BEGIN TRANSACTION;

        -- Eliminar espacios en blanco a los lados y convertir a mayúsculas
        SET @Nombre = UPPER(LTRIM(RTRIM(@Nombre)));
        SET @Contacto = UPPER(LTRIM(RTRIM(@Contacto)));
        SET @Telefono = LTRIM(RTRIM(@Telefono));
        SET @Direccion = UPPER(LTRIM(RTRIM(@Direccion)));
        SET @Usuario_Crea = UPPER(LTRIM(RTRIM(@Usuario_Crea)));

        -- Verificar si ya existe un proveedor con el mismo nombre
        IF EXISTS (SELECT 1 FROM dbo.Proveedor WHERE Nombre = @Nombre)
        BEGIN
            -- Ya existe el proveedor
            SET @Resultado = 2;
            ROLLBACK TRANSACTION;
            RETURN;
        END

        -- Insertar el nuevo proveedor con Estado = 1
        INSERT INTO dbo.Proveedor (Nombre, Contacto, Telefono, Direccion, Usuario_Crea, Fecha_Creacion, Estado)
        VALUES (@Nombre, @Contacto, @Telefono, @Direccion, @Usuario_Crea, GETDATE(), 1);

        -- Confirmar la transacción
        COMMIT TRANSACTION;

        -- Inserción exitosa
        SET @Resultado = 1;
    END TRY
    BEGIN CATCH
        -- En caso de error, revertir la transacción
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        -- Asignar 0 como resultado de error
        SET @Resultado = 0;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_RegistrarCompra]    Script Date: 18/10/2024 09:40:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Sp_RegistrarCompra]
    @Id_Proveedor INT,
    @DetalleCompra dbo.DetalleCompraType READONLY, -- Usar el tipo de tabla creado
    @Usuario_Crea NVARCHAR(MAX),
    @Resultado INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    -- Usar nivel de aislamiento SERIALIZABLE
    SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
    
    BEGIN TRY
        -- Iniciar la transacción
        BEGIN TRANSACTION;
        
        -- Variable para almacenar el ID de la compra recién insertada
        DECLARE @Id_Compra INT;
        DECLARE @Total_Compra DECIMAL(18, 0) = 0;
        
        -- Calcular el total de la compra
        SELECT @Total_Compra = SUM(Cantidad * Precio_Unitario) FROM @DetalleCompra;

        -- Insertar la compra en la tabla Compra
        INSERT INTO dbo.Compra (Id_Proveedor, Fecha_Compra, Total_Compra, Usuario_Crea, Fecha_Creacion, Estado)
        VALUES (@Id_Proveedor, GETDATE(), @Total_Compra, @Usuario_Crea, GETDATE(), 1);
        
        -- Obtener el ID de la compra recién creada
        SET @Id_Compra = SCOPE_IDENTITY();
        
        -- Insertar los detalles de la compra en la tabla Detalle_Compra
        INSERT INTO dbo.Detalle_Compra (Id_Compra, Id_Producto, Cantidad, Precio_Unitario, SubTotal, Usuario_Crea, Fecha_Creacion, Estado)
        SELECT @Id_Compra, Id_Producto, Cantidad, Precio_Unitario, (Cantidad * Precio_Unitario), @Usuario_Crea, GETDATE(), 1
        FROM @DetalleCompra;

        -- Actualizar el inventario por cada producto comprado
        DECLARE @Id_Producto INT, @Cantidad INT;
		DECLARE @PrecioCosto DECIMAL(18,0), @PrecioVenta DECIMAL(18,0);
		DECLARE @Cantidad_Inventario int;

        DECLARE cur CURSOR FOR
        SELECT Id_Producto, Cantidad FROM @DetalleCompra;

        OPEN cur;
        FETCH NEXT FROM cur INTO @Id_Producto, @Cantidad;

        WHILE @@FETCH_STATUS = 0
        BEGIN
            -- Insertar el movimiento de inventario como entrada (1)
            INSERT INTO dbo.Inventario (Id_Producto, Tipo_Movimiento, Cantidad, Usuario_Crea, Fecha_Creacion, Estado,Id_Factura_Compra)
            VALUES (@Id_Producto, 1, @Cantidad, @Usuario_Crea, GETDATE(), 1, @Id_Compra);

			SET @PrecioCosto = (SELECT TOP 1 Precio_Unitario FROM @DetalleCompra WHERE Id_Producto = @Id_Producto);
			SET @PrecioVenta = (@PrecioCosto + (@PrecioCosto * 0.30));

			---Actualizamos el Precio del Producto
			UPDATE dbo.Producto SET Precio_Costo = @PrecioCosto, Precio_Venta = @PrecioVenta WHERE Id_Producto = @Id_Producto;

			----Actualizamos el Inventario para la tabla de producto
			SET @Cantidad_Inventario = (SELECT SUM(Cantidad) FROM dbo.Inventario WHERE Id_Producto = @Id_Producto);
			UPDATE dbo.Producto SET Cantidad_Inventario = @Cantidad_Inventario WHERE Id_Producto = @Id_Producto;

            FETCH NEXT FROM cur INTO @Id_Producto, @Cantidad;
        END;

        CLOSE cur;
        DEALLOCATE cur;

        -- Confirmar la transacción
        COMMIT TRANSACTION;

        -- Devolver éxito
        SET @Resultado = 1;
    END TRY
    BEGIN CATCH
        -- En caso de error, revertir la transacción
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

		  -- -- Imprimir el mensaje de error
    --PRINT 'Error: ' + ERROR_MESSAGE();
    --PRINT 'Severidad: ' + CAST(ERROR_SEVERITY() AS NVARCHAR(10));
    --PRINT 'Estado: ' + CAST(ERROR_STATE() AS NVARCHAR(10));
    --PRINT 'Línea: ' + CAST(ERROR_LINE() AS NVARCHAR(10));
    --PRINT 'Procedimiento: ' + ISNULL(ERROR_PROCEDURE(), 'N/A');
        -- Devolver error
        SET @Resultado = 0;
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[Sp_RegistrarVenta]    Script Date: 18/10/2024 09:40:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_RegistrarVenta]
    @Id_Cliente INT,
    @DetalleVenta dbo.DetalleCompraType READONLY, -- Usar el mismo tipo definido de tabla para detalles
    @Usuario_Crea NVARCHAR(MAX),
    @Resultado INT OUTPUT -- Variable de salida
AS
BEGIN
    SET NOCOUNT ON;
    -- Usar el nivel de aislamiento SERIALIZABLE para evitar problemas de concurrencia
    SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

    BEGIN TRY
        -- Iniciar la transacción
        BEGIN TRANSACTION;

        -- Insertar la venta en la tabla Venta
        DECLARE @Id_Venta INT;
        DECLARE @Total DECIMAL(18, 0);
		DECLARE @Cantidad_Inventario INT=0;

        -- Calcular el total de la venta
        SELECT @Total = SUM(Cantidad * Precio_Unitario) FROM @DetalleVenta;

        INSERT INTO dbo.Venta (Id_Cliente, Fecha_Venta, Total, Usuario_Crea, Fecha_Creacion, Estado)
        VALUES (@Id_Cliente, GETDATE(), @Total, @Usuario_Crea, GETDATE(), 1);

        -- Obtener el Id de la venta recién insertada
        SET @Id_Venta = SCOPE_IDENTITY();

        -- Insertar los detalles de la venta en la tabla Detalle_Venta
        INSERT INTO dbo.Detalle_Venta (Id_Venta, Id_Producto, Cantidad, Precio_Unitario, Sub_Total, Usuario_Crea, Fecha_Creacion, Estado)
        SELECT @Id_Venta, Id_Producto, Cantidad, Precio_Unitario, @Total, @Usuario_Crea, GETDATE(), 1
        FROM @DetalleVenta;

        -- Actualizar el inventario restando la cantidad vendida
        DECLARE @Id_Producto INT, @Cantidad INT;

        DECLARE cur CURSOR FOR
        SELECT Id_Producto, Cantidad
        FROM @DetalleVenta;

        OPEN cur;
        FETCH NEXT FROM cur INTO @Id_Producto, @Cantidad;

        WHILE @@FETCH_STATUS = 0
        BEGIN
            -- Registrar en la tabla Inventario con movimiento de salida (0) y cantidad negativa
            INSERT INTO dbo.Inventario (Id_Producto, Tipo_Movimiento, Cantidad, Usuario_Crea, Fecha_Creacion, Estado,Id_Factura_Venta)
            VALUES (@Id_Producto, 0, -@Cantidad, @Usuario_Crea, GETDATE(), 1, @Id_Venta);


			----Actualizamos el Inventario para la tabla de producto
			SET @Cantidad_Inventario = (SELECT SUM(Cantidad) FROM dbo.Inventario WHERE Id_Producto = @Id_Producto);
			UPDATE dbo.Producto SET Cantidad_Inventario = @Cantidad_Inventario WHERE Id_Producto = @Id_Producto;
            -- Continuar con el siguiente producto
            FETCH NEXT FROM cur INTO @Id_Producto, @Cantidad;
        END


		----Actualizamos el Inventario para la tabla de producto
		SET @Cantidad_Inventario = (SELECT SUM(Cantidad) FROM dbo.Inventario WHERE Id_Producto = @Id_Producto);
		UPDATE dbo.Producto SET Cantidad_Inventario = @Cantidad_Inventario WHERE Id_Producto = @Id_Producto;

        CLOSE cur;
        DEALLOCATE cur;

        -- Confirmar la transacción
        COMMIT TRANSACTION;

        -- Asignar 1 como resultado de éxito
        SET @Resultado = 1;
    END TRY
    BEGIN CATCH
        -- En caso de error, revertir la transacción
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        -- Imprimir el error para depuración
        PRINT ERROR_MESSAGE();

        -- Asignar 0 como resultado de error
        SET @Resultado = 0;
    END CATCH
END
GO
-- Mensaje de confirmación
PRINT 'La base de datos Punto_Venta_Inventario ha sido creada exitosamente.  :-)';
GO