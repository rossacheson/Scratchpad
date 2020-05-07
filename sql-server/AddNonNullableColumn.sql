-- Add ColumnName column to TableName
-- Example here is BIT data type
IF NOT EXISTS(
        SELECT 1
        FROM [INFORMATION_SCHEMA].[COLUMNS]
        WHERE [TABLE_SCHEMA] = 'dbo'
            AND [TABLE_NAME] = 'TableName'
            AND [COLUMN_NAME] = 'ColumnName'
    )
    BEGIN

    ALTER TABLE dbo.[TableName] ADD ColumnName BIT NULL

    EXEC ('UPDATE dbo.[TableName] SET ColumnName = 1')

    ALTER TABLE dbo.[TableName] ALTER COLUMN ColumnName BIT NOT NULL

END
GO

-- Add ColumnName column to TableName with named foreign key
IF NOT EXISTS(
        SELECT 1
        FROM [INFORMATION_SCHEMA].[COLUMNS]
        WHERE [TABLE_SCHEMA] = 'dbo'
            AND [TABLE_NAME] = 'TableName'
            AND [COLUMN_NAME] = 'ColumnName'
    )
    BEGIN
        ALTER TABLE dbo.[TableName] ADD ColumnName BIGINT CONSTRAINT FK_TableName_OtherTable FOREIGN KEY REFERENCES dbo.OtherTable(ID) NULL
        EXEC ('UPDATE dbo.[TableName] SET ColumnName = (SELECT ID FROM dbo.OtherTable WHERE 1 = 1)')
        ALTER TABLE dbo.[TableName] ALTER COLUMN ColumnName BIGINT NOT NULL
    END
GO
