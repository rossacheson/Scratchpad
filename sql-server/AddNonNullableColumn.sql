-- Add ColumnName column to TableName
-- Example here is BIT data type
IF NOT EXISTS(
        SELECT 1
        FROM [INFORMATION_SCHEMA].[COLUMNS]
        WHERE [TABLE_SCHEMA] = 'dbo'
            AND [TABLE_NAME] = 'User'
            AND [COLUMN_NAME] = 'ColumnName'
    )
    BEGIN

    ALTER TABLE dbo.[TableName] ADD ColumnName BIT NULL

    EXEC ('UPDATE dbo.[TableName] SET ColumnName = 1')

    ALTER TABLE dbo.[TableName] ALTER COLUMN ColumnName BIT NOT NULL

END
GO