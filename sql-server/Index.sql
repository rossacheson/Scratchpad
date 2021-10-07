IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = 'IX_TableName_ColumnName' AND object_id = OBJECT_ID('TableName'))
  BEGIN
      CREATE NONCLUSTERED INDEX IX_TableName_ColumnName
      ON dbo.TableName (ColumnName)
  END
GO
