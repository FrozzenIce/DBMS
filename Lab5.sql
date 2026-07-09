-- Create a user
CREATE USER 'pranjal'@'localhost' IDENTIFIED BY '12234567890';

-- Grant permissions to user
GRANT SELECT, INSERT, UPDATE, DELETE
ON *.*
TO 'pranjal'@'localhost';

FLUSH PRIVILEGES;

SELECT User, Host FROM mysql.user;
SHOW GRANTS FOR 'pranjal'@'localhost';

-- Revoke permissions to user
REVOKE ALL PRIVILEGES
ON *.*
FROM 'pranjal'@'localhost';

-- Check grants
SHOW GRANTS FOR 'pranjal'@'localhost';

-- Drop user
DROP USER 'pranjal'@'localhost';
SELECT User, Host FROM mysql.user;