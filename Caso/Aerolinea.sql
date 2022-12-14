USE [DBRESERVA]
GO
/****** Object:  Table [dbo].[AEROLINEA]    Script Date: 10/08/2022 10:10:23 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AEROLINEA](
	[idaerolinea] [int] NOT NULL,
	[ruc] [char](11) NOT NULL,
	[nombre] [varchar](40) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idaerolinea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AEROPUERTO]    Script Date: 10/08/2022 10:10:23 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AEROPUERTO](
	[idaeropuerto] [char](5) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[idpais] [char](4) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ASIENTO]    Script Date: 10/08/2022 10:10:23 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ASIENTO](
	[idasiento] [int] NOT NULL,
	[letra] [char](2) NOT NULL,
	[fila] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idasiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AVION]    Script Date: 10/08/2022 10:10:23 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AVION](
	[idavion] [char](5) NOT NULL,
	[idaerolinea] [int] NOT NULL,
	[fabricante] [varchar](40) NULL,
	[tipo] [varchar](30) NOT NULL,
	[capacidad] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idavion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PAGO]    Script Date: 10/08/2022 10:10:23 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PAGO](
	[idpago] [int] IDENTITY(1,1) NOT NULL,
	[idreserva] [int] NOT NULL,
	[fecha] [date] NULL DEFAULT (getdate()),
	[idpasajero] [char](8) NOT NULL,
	[monto] [money] NOT NULL,
	[tipo_comprobante] [varchar](20) NOT NULL,
	[num_comprobante] [varchar](15) NOT NULL,
	[impuesto] [decimal](5, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idpago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PAIS]    Script Date: 10/08/2022 10:10:23 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PAIS](
	[idpais] [char](4) NOT NULL,
	[nombre] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idpais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PASAJERO]    Script Date: 10/08/2022 10:10:23 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PASAJERO](
	[idpasajero] [char](8) NOT NULL,
	[nombre] [varchar](20) NOT NULL,
	[apaterno] [varchar](20) NOT NULL,
	[amaterno] [varchar](20) NOT NULL,
	[tipo_documento] [varchar](30) NOT NULL,
	[num_documento] [varchar](12) NOT NULL,
	[fecha_nacimiento] [date] NOT NULL,
	[idpais] [char](4) NOT NULL,
	[telefono] [varchar](15) NULL,
	[email] [varchar](50) NOT NULL,
	[clave] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idpasajero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RESERVA]    Script Date: 10/08/2022 10:10:23 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RESERVA](
	[idreserva] [int] NOT NULL,
	[costo] [money] NOT NULL,
	[fecha] [date] NULL CONSTRAINT [DFL_RESERVA_FECHA]  DEFAULT (getdate()),
	[observacion] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[idreserva] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TARIFA]    Script Date: 10/08/2022 10:10:23 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TARIFA](
	[idtarifa] [int] NOT NULL,
	[clase] [varchar](20) NOT NULL,
	[precio] [money] NOT NULL,
	[impuesto] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idtarifa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[VUELO]    Script Date: 10/08/2022 10:10:23 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VUELO](
	[idasiento] [int] NOT NULL,
	[idaeropuerto] [char](5) NOT NULL,
	[idreserva] [int] NOT NULL,
	[idavion] [char](5) NOT NULL,
	[idtarifa] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idasiento] ASC,
	[idaeropuerto] ASC,
	[idreserva] ASC,
	[idavion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[AEROLINEA] ([idaerolinea], [ruc], [nombre]) VALUES (1, N'10123456789', N'LAN PERU')
INSERT [dbo].[AEROLINEA] ([idaerolinea], [ruc], [nombre]) VALUES (2, N'10123456710', N'AEROPERU')
INSERT [dbo].[AEROLINEA] ([idaerolinea], [ruc], [nombre]) VALUES (3, N'10123456711', N'TACA')
INSERT [dbo].[AEROLINEA] ([idaerolinea], [ruc], [nombre]) VALUES (4, N'10123456712', N'BIRD PERU')
INSERT [dbo].[AEROLINEA] ([idaerolinea], [ruc], [nombre]) VALUES (5, N'10123456713', N'LAN CUZCO')
INSERT [dbo].[AEROPUERTO] ([idaeropuerto], [nombre], [idpais]) VALUES (N'AE01 ', N'Bariloche', N'0003')
INSERT [dbo].[AEROPUERTO] ([idaeropuerto], [nombre], [idpais]) VALUES (N'AE02 ', N'Mar del Plata', N'0003')
INSERT [dbo].[AEROPUERTO] ([idaeropuerto], [nombre], [idpais]) VALUES (N'AE03 ', N'Jorge Chávez', N'0001')
SET IDENTITY_INSERT [dbo].[PAGO] ON 

INSERT [dbo].[PAGO] ([idpago], [idreserva], [fecha], [idpasajero], [monto], [tipo_comprobante], [num_comprobante], [impuesto]) VALUES (5, 1, CAST(N'2013-01-27' AS Date), N'P0000001', 40.0000, N'Ticket', N'0010007', CAST(0.18 AS Decimal(5, 2)))
INSERT [dbo].[PAGO] ([idpago], [idreserva], [fecha], [idpasajero], [monto], [tipo_comprobante], [num_comprobante], [impuesto]) VALUES (6, 5, CAST(N'2014-05-05' AS Date), N'P0000002', 250.0000, N'Factura', N'001-0002', CAST(0.18 AS Decimal(5, 2)))
INSERT [dbo].[PAGO] ([idpago], [idreserva], [fecha], [idpasajero], [monto], [tipo_comprobante], [num_comprobante], [impuesto]) VALUES (7, 7, CAST(N'2014-06-17' AS Date), N'P0000007', 700.0000, N'Factura', N'001-0003', CAST(0.18 AS Decimal(5, 2)))
SET IDENTITY_INSERT [dbo].[PAGO] OFF
INSERT [dbo].[PAIS] ([idpais], [nombre]) VALUES (N'0003', N'Argentina')
INSERT [dbo].[PAIS] ([idpais], [nombre]) VALUES (N'0007', N'Bolivia')
INSERT [dbo].[PAIS] ([idpais], [nombre]) VALUES (N'0004', N'Chile')
INSERT [dbo].[PAIS] ([idpais], [nombre]) VALUES (N'0005', N'Ecuador')
INSERT [dbo].[PAIS] ([idpais], [nombre]) VALUES (N'0009', N'El Salvador')
INSERT [dbo].[PAIS] ([idpais], [nombre]) VALUES (N'0010', N'España')
INSERT [dbo].[PAIS] ([idpais], [nombre]) VALUES (N'0002', N'México')
INSERT [dbo].[PAIS] ([idpais], [nombre]) VALUES (N'0001', N'Perú')
INSERT [dbo].[PAIS] ([idpais], [nombre]) VALUES (N'0008', N'Republica Dominicana')
INSERT [dbo].[PAIS] ([idpais], [nombre]) VALUES (N'0006', N'Venezuela')
INSERT [dbo].[PASAJERO] ([idpasajero], [nombre], [apaterno], [amaterno], [tipo_documento], [num_documento], [fecha_nacimiento], [idpais], [telefono], [email], [clave]) VALUES (N'P0000001', N'Juan Carlos', N'Arcila', N'Díaz', N'DNI', N'47715777', CAST(N'2014-07-01' AS Date), N'0001', N'942276513', N'jcarlos.ad7@gmail.com', N'jcarlos1')
INSERT [dbo].[PASAJERO] ([idpasajero], [nombre], [apaterno], [amaterno], [tipo_documento], [num_documento], [fecha_nacimiento], [idpais], [telefono], [email], [clave]) VALUES (N'P0000002', N'Ana', N'Díaz', N'Mundaca', N'PASS', N'10345125', CAST(N'1968-03-04' AS Date), N'0001', NULL, N'ana@gmail.com', N'anita01')
INSERT [dbo].[PASAJERO] ([idpasajero], [nombre], [apaterno], [amaterno], [tipo_documento], [num_documento], [fecha_nacimiento], [idpais], [telefono], [email], [clave]) VALUES (N'P0000003', N'Rosa', N'Guevara', N'Lozano', N'DNI', N'45698712', CAST(N'1986-02-02' AS Date), N'0002', NULL, N'rosita@hotmail.com', N'rosita01')
INSERT [dbo].[PASAJERO] ([idpasajero], [nombre], [apaterno], [amaterno], [tipo_documento], [num_documento], [fecha_nacimiento], [idpais], [telefono], [email], [clave]) VALUES (N'P0000004', N'Silvia', N'Barreda', N'Malhaber', N'PASS', N'10236598', CAST(N'1995-02-01' AS Date), N'0010', N'963258741', N'silvia@hotmail.com', N'silvia01')
INSERT [dbo].[PASAJERO] ([idpasajero], [nombre], [apaterno], [amaterno], [tipo_documento], [num_documento], [fecha_nacimiento], [idpais], [telefono], [email], [clave]) VALUES (N'P0000005', N'Juan ', N'Arcila', N'Fernández', N'DNI', N'48796523', CAST(N'1965-12-15' AS Date), N'0001', N'963214587', N'juan@gmail.com', N'juan07')
INSERT [dbo].[PASAJERO] ([idpasajero], [nombre], [apaterno], [amaterno], [tipo_documento], [num_documento], [fecha_nacimiento], [idpais], [telefono], [email], [clave]) VALUES (N'P0000006', N'Marita', N'Diaz', N'Tello', N'PASS', N'96325874', CAST(N'1994-12-12' AS Date), N'0002', NULL, N'marita@gmail.com', N'marita01')
INSERT [dbo].[PASAJERO] ([idpasajero], [nombre], [apaterno], [amaterno], [tipo_documento], [num_documento], [fecha_nacimiento], [idpais], [telefono], [email], [clave]) VALUES (N'P0000007', N'Eulogio', N'Castro', N'Castillo', N'DNI', N'98745631', CAST(N'1969-01-02' AS Date), N'0007', N'987456312', N'eulogio@hotmail.com', N'eulogio01')
INSERT [dbo].[RESERVA] ([idreserva], [costo], [fecha], [observacion]) VALUES (1, 90.0000, CAST(N'2013-01-27' AS Date), N'')
INSERT [dbo].[RESERVA] ([idreserva], [costo], [fecha], [observacion]) VALUES (2, 50.0000, CAST(N'2013-01-01' AS Date), N'')
INSERT [dbo].[RESERVA] ([idreserva], [costo], [fecha], [observacion]) VALUES (3, 300.0000, CAST(N'2014-03-04' AS Date), N'')
INSERT [dbo].[RESERVA] ([idreserva], [costo], [fecha], [observacion]) VALUES (4, 800.0000, CAST(N'2014-04-05' AS Date), N'')
INSERT [dbo].[RESERVA] ([idreserva], [costo], [fecha], [observacion]) VALUES (5, 250.0000, CAST(N'2014-06-17' AS Date), N'')
INSERT [dbo].[RESERVA] ([idreserva], [costo], [fecha], [observacion]) VALUES (6, 1150.0000, CAST(N'2014-06-17' AS Date), N'')
INSERT [dbo].[RESERVA] ([idreserva], [costo], [fecha], [observacion]) VALUES (7, 700.0000, CAST(N'2014-06-17' AS Date), N'')
INSERT [dbo].[TARIFA] ([idtarifa], [clase], [precio], [impuesto]) VALUES (1, N'Supervip', 1200.0000, 12.0000)
INSERT [dbo].[TARIFA] ([idtarifa], [clase], [precio], [impuesto]) VALUES (2, N'Vip', 1000.0000, 12.0000)
INSERT [dbo].[TARIFA] ([idtarifa], [clase], [precio], [impuesto]) VALUES (3, N'Nacional', 800.0000, 12.0000)
INSERT [dbo].[TARIFA] ([idtarifa], [clase], [precio], [impuesto]) VALUES (4, N'Económica', 500.0000, 0.0000)
SET ANSI_PADDING ON

GO
/****** Object:  Index [PK_AEROPUERTO_PAIS]    Script Date: 10/08/2022 10:10:23 p.m. ******/
ALTER TABLE [dbo].[AEROPUERTO] ADD  CONSTRAINT [PK_AEROPUERTO_PAIS] PRIMARY KEY NONCLUSTERED 
(
	[idaeropuerto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ_AEROPUERTO_NOMBRE]    Script Date: 10/08/2022 10:10:23 p.m. ******/
ALTER TABLE [dbo].[AEROPUERTO] ADD  CONSTRAINT [UQ_AEROPUERTO_NOMBRE] UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__PAIS__72AFBCC6A6F9164B]    Script Date: 10/08/2022 10:10:23 p.m. ******/
ALTER TABLE [dbo].[PAIS] ADD UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__PASAJERO__AB6E61646EAF2146]    Script Date: 10/08/2022 10:10:23 p.m. ******/
ALTER TABLE [dbo].[PASAJERO] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__TARIFA__71DF78FB991EE816]    Script Date: 10/08/2022 10:10:23 p.m. ******/
ALTER TABLE [dbo].[TARIFA] ADD UNIQUE NONCLUSTERED 
(
	[clase] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AEROPUERTO]  WITH CHECK ADD  CONSTRAINT [FK_AEROPUERTO_PAIS] FOREIGN KEY([idpais])
REFERENCES [dbo].[PAIS] ([idpais])
GO
ALTER TABLE [dbo].[AEROPUERTO] CHECK CONSTRAINT [FK_AEROPUERTO_PAIS]
GO
ALTER TABLE [dbo].[AVION]  WITH CHECK ADD  CONSTRAINT [FK_AVION_AEROLINEA] FOREIGN KEY([idaerolinea])
REFERENCES [dbo].[AEROLINEA] ([idaerolinea])
GO
ALTER TABLE [dbo].[AVION] CHECK CONSTRAINT [FK_AVION_AEROLINEA]
GO
ALTER TABLE [dbo].[PAGO]  WITH CHECK ADD  CONSTRAINT [FK_PAGO_PASAJERO] FOREIGN KEY([idpasajero])
REFERENCES [dbo].[PASAJERO] ([idpasajero])
GO
ALTER TABLE [dbo].[PAGO] CHECK CONSTRAINT [FK_PAGO_PASAJERO]
GO
ALTER TABLE [dbo].[PAGO]  WITH CHECK ADD  CONSTRAINT [FK_PAGO_RESERVA] FOREIGN KEY([idreserva])
REFERENCES [dbo].[RESERVA] ([idreserva])
GO
ALTER TABLE [dbo].[PAGO] CHECK CONSTRAINT [FK_PAGO_RESERVA]
GO
ALTER TABLE [dbo].[PASAJERO]  WITH CHECK ADD  CONSTRAINT [FK_PASAJERO_PAIS] FOREIGN KEY([idpais])
REFERENCES [dbo].[PAIS] ([idpais])
GO
ALTER TABLE [dbo].[PASAJERO] CHECK CONSTRAINT [FK_PASAJERO_PAIS]
GO
ALTER TABLE [dbo].[VUELO]  WITH CHECK ADD  CONSTRAINT [FK_VUELO_AEROPUERTO] FOREIGN KEY([idaeropuerto])
REFERENCES [dbo].[AEROPUERTO] ([idaeropuerto])
GO
ALTER TABLE [dbo].[VUELO] CHECK CONSTRAINT [FK_VUELO_AEROPUERTO]
GO
ALTER TABLE [dbo].[VUELO]  WITH CHECK ADD  CONSTRAINT [FK_VUELO_ASIENTO] FOREIGN KEY([idasiento])
REFERENCES [dbo].[ASIENTO] ([idasiento])
GO
ALTER TABLE [dbo].[VUELO] CHECK CONSTRAINT [FK_VUELO_ASIENTO]
GO
ALTER TABLE [dbo].[VUELO]  WITH CHECK ADD  CONSTRAINT [FK_VUELO_AVION] FOREIGN KEY([idavion])
REFERENCES [dbo].[AVION] ([idavion])
GO
ALTER TABLE [dbo].[VUELO] CHECK CONSTRAINT [FK_VUELO_AVION]
GO
ALTER TABLE [dbo].[VUELO]  WITH CHECK ADD  CONSTRAINT [FK_VUELO_RESERVA] FOREIGN KEY([idreserva])
REFERENCES [dbo].[RESERVA] ([idreserva])
GO
ALTER TABLE [dbo].[VUELO] CHECK CONSTRAINT [FK_VUELO_RESERVA]
GO
ALTER TABLE [dbo].[VUELO]  WITH CHECK ADD  CONSTRAINT [FK_VUELO_TARIFA] FOREIGN KEY([idtarifa])
REFERENCES [dbo].[TARIFA] ([idtarifa])
GO
ALTER TABLE [dbo].[VUELO] CHECK CONSTRAINT [FK_VUELO_TARIFA]
GO
ALTER TABLE [dbo].[PAGO]  WITH CHECK ADD  CONSTRAINT [CHK_PAGO_FECHA] CHECK  (([fecha]<=getdate()))
GO
ALTER TABLE [dbo].[PAGO] CHECK CONSTRAINT [CHK_PAGO_FECHA]
GO
