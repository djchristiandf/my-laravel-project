USE mysql;

CREATE USER 'djchristiandf'@'%' IDENTIFIED BY '2412';
GRANT ALL PRIVILEGES ON *.* TO 'djchristiandf'@'%';
GRANT ALL PRIVILEGES ON *.* TO 'laraveluser'@'%';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%';
FLUSH PRIVILEGES;

USE laravel;
