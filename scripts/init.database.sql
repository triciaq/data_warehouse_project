# Create Database and Schemas

## Purpose
This script creates a new database named **`DataWarehouse`** after checking if it already exists.  
If the database exists, it will be **dropped** and then **recreated**.  
Additionally, the script sets up three schemas within the database:

- `bronze`
- `silver`
- `gold`

---

## SQL Script

```sql
-- Use the master database
USE master;

-- Drop and recreate the 'DataWarehouse' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN 
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END;
GO

-- Create the DataWarehouse database
CREATE DATABASE DataWarehouse;
GO

-- Switch to the new database
USE DataWarehouse;
GO

-- Create Schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
