-- select duplicates on one field
SELECT
    Field1, Field2, COUNT(*)
FROM
    dbo.TableName
GROUP BY
    Field1
HAVING 
    COUNT(*) > 1

-- select duplicates on two fields
SELECT
    Field1, Field2, COUNT(*)
FROM
    dbo.TableName
GROUP BY
    Field1, Field2
HAVING 
    COUNT(*) > 1
