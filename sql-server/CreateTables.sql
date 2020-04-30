BEGIN TRANSACTION

-- Add simple table
IF NOT EXISTS(SELECT *
              FROM INFORMATION_SCHEMA.TABLES
              WHERE TABLE_SCHEMA = 'dbo'
                AND TABLE_NAME = 'Status')
    BEGIN
        CREATE TABLE dbo.Status
        (
            Id   INT           NOT NULL CONSTRAINT PK_Status PRIMARY KEY CLUSTERED,
            Name nvarchar(100) NOT NULL
        )
    END
GO

-- Add initial data
IF NOT EXISTS(
        SELECT 1
        FROM dbo.Status
        WHERE Id = 1
           OR Name = 'ItemOne'
    )
    BEGIN
        INSERT INTO dbo.Status (Id, Name)
        VALUES (1, 'ItemOne')
    END
GO

IF NOT EXISTS(
        SELECT 1
        FROM dbo.Status
        WHERE Id = 2
           OR Name = 'ItemTwo'
    )
    BEGIN
        INSERT INTO dbo.Status (Id, Name)
        VALUES (2, 'ItemTwo')
    END
GO

-- Add table with named foreign keys and named unique constraint
IF NOT EXISTS(SELECT *
              FROM INFORMATION_SCHEMA.TABLES
              WHERE TABLE_SCHEMA = 'dbo'
                AND TABLE_NAME = 'TableTwo')
    BEGIN
        CREATE TABLE dbo.TableTwo
        (
            Id             INT           NOT NULL IDENTITY (1, 1) CONSTRAINT PK_TableTwo PRIMARY KEY CLUSTERED,
            OtherEntityId  INT           NOT NULL CONSTRAINT FK_TableTwo_OtherEntity FOREIGN KEY REFERENCES dbo.OtherEntity (Id),
            OrderDate      DATETIME2(7)  NOT NULL,
            Quantity       INT           NOT NULL,
            StatusId       INT           NOT NULL CONSTRAINT FK_TableTwo_Status FOREIGN KEY REFERENCES dbo.Status (Id),
            OrderId        NVARCHAR(25)  NOT NULL,
            CONSTRAINT U_OrderId UNIQUE(OrderId)
        )
    END
GO

COMMIT
