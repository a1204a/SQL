USE [master]
GO
ALTER TABLE [dbo].[Betreuung] ADD  DEFAULT ((0)) FOR [VonKKBezahlt]
GO
ALTER TABLE [dbo].[Betreuung]  WITH CHECK ADD  CONSTRAINT [fk_BetreuungKunden] FOREIGN KEY([Kundennummer])
REFERENCES [dbo].[Kunden] ([Kundennummer])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Betreuung] CHECK CONSTRAINT [fk_BetreuungKunden]
GO
ALTER TABLE [dbo].[Betreuung]  WITH CHECK ADD  CONSTRAINT [fk_BetreuungMitarbeiter] FOREIGN KEY([Personalnummer])
REFERENCES [dbo].[Mitarbeiter] ([Personalnummer])
GO
ALTER TABLE [dbo].[Betreuung] CHECK CONSTRAINT [fk_BetreuungMitarbeiter]
GO
ALTER TABLE [dbo].[Kunden]  WITH CHECK ADD  CONSTRAINT [fk_KundenOrte] FOREIGN KEY([Wohnort])
REFERENCES [dbo].[Orte] ([OrtId])
GO
ALTER TABLE [dbo].[Kunden] CHECK CONSTRAINT [fk_KundenOrte]
GO
USE [master]
GO
ALTER DATABASE [FitnessCenter] SET  READ_WRITE 
GO
