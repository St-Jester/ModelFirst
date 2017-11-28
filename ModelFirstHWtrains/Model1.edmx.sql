
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 11/28/2017 19:15:00
-- Generated from EDMX file: C:\Users\Kateryna\Documents\Programming\Programming\Homework\ADONET\ModelFirstHWtrains\ModelFirstHWtrains\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [HWTickets];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'TrainSet'
CREATE TABLE [dbo].[TrainSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [TNumber] int  NOT NULL
);
GO

-- Creating table 'SitSet'
CREATE TABLE [dbo].[SitSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [SitNum] int  NOT NULL,
    [trainID] int  NOT NULL,
    [TrainId1] int  NOT NULL,
    [Ticket_Id] int  NOT NULL
);
GO

-- Creating table 'TicketSet'
CREATE TABLE [dbo].[TicketSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Owner] nvarchar(max)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'TrainSet'
ALTER TABLE [dbo].[TrainSet]
ADD CONSTRAINT [PK_TrainSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'SitSet'
ALTER TABLE [dbo].[SitSet]
ADD CONSTRAINT [PK_SitSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'TicketSet'
ALTER TABLE [dbo].[TicketSet]
ADD CONSTRAINT [PK_TicketSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [TrainId1] in table 'SitSet'
ALTER TABLE [dbo].[SitSet]
ADD CONSTRAINT [FK_TrainSit]
    FOREIGN KEY ([TrainId1])
    REFERENCES [dbo].[TrainSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TrainSit'
CREATE INDEX [IX_FK_TrainSit]
ON [dbo].[SitSet]
    ([TrainId1]);
GO

-- Creating foreign key on [Ticket_Id] in table 'SitSet'
ALTER TABLE [dbo].[SitSet]
ADD CONSTRAINT [FK_SitTicket]
    FOREIGN KEY ([Ticket_Id])
    REFERENCES [dbo].[TicketSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SitTicket'
CREATE INDEX [IX_FK_SitTicket]
ON [dbo].[SitSet]
    ([Ticket_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------