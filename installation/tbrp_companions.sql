CREATE TABLE `tbrp_companions` (
    `charidentifier` INT(11) NOT NULL AUTO_INCREMENT,
    `identifier` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_general_ci',
    `dog` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_general_ci',
    `skin` INT(11) NULL DEFAULT '0',
    `xp` INT(11) NULL DEFAULT '0',
    PRIMARY KEY (`charidentifier`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=2
;
