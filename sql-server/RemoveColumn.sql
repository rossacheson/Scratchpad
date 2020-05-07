-- Remove ColumnName from TableName
IF EXISTS (
    SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'TableName'
    AND COLUMN_NAME = 'ColumnName'
)
BEGIN
    ALTER TABLE dbo.TableName
    DROP COLUMN ColumnName
END
GO
