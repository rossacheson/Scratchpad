SET IDENTITY_INSERT dbo.[TableName] ON GO

-- Add Item to [TableName], including Id Identity column
IF NOT EXISTS(
        SELECT 1
        FROM dbo.[TableName]
        WHERE Id = 40
    )
    BEGIN
        INSERT INTO dbo.[TableName] (Id,Name)
        VALUES (40,'Item')
    END
GO

SET IDENTITY_INSERT dbo.[TableName] OFF GO

-- NOTE: Be careful with this workaround
-- If this represents a lookup table with items that are referred to in code by Enum,
-- it would probably be better if the Id column were NOT declared as IDENTITY.
-- But if someone already did declare that column as IDENTITY, this is the workaround.
