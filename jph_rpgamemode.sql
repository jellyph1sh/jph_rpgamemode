CREATE TABLE `users` (
    `identifier` VARCHAR(60) NOT NULL,
    `firstname` VARCHAR(16) DEFAULT NULL,
    `lastname` VARCHAR(16) DEFAULT NULL,
    `sex` VARCHAR(1) DEFAULT NULL,
    `height` INT(11) DEFAULT NULL,
    `skin` LONGTEXT DEFAULT NULL,
    `inventory` LONGTEXT DEFAULT NULL,
    `job` VARCHAR(20) DEFAULT 'unemployed',
    `job_grade` int(11) DEFAULT 0,
    `position` LONGTEXT DEFAULT NULL
);