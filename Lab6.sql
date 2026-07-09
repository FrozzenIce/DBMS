-- Create Role
CREATE ROLE 'app_readwrite';

SELECT User, Host FROM mysql.user WHERE account_locked = 'Y' AND password_expired = 'Y';

-- Grant permissions to role
GRANT SELECT, INSERT, UPDATE, DELETE
ON *.*
TO 'app_readwrite';

SHOW GRANTS FOR 'app_readwrite';

-- Create User
CREATE USER 'ncit'@'localhost'
IDENTIFIED BY '1234567890';

-- Grant role to user
GRANT 'app_readwrite'
TO 'ncit'@'localhost';

SHOW GRANTS FOR 'ncit'@'localhost';

-- Set the role to default
SET DEFAULT ROLE 'app_readwrite'
TO 'ncit'@'localhost';

-- Revoke permissions
REVOKE UPDATE
ON *.*
FROM 'app_readwrite';

SHOW GRANTS FOR 'app_readwrite';

-- Revoke role from user
REVOKE 'app_readwrite'
FROM 'ncit'@'localhost';

SHOW GRANTS FOR 'ncit'@'localhost';

-- Drop role
DROP ROLE 'app_readwrite';
