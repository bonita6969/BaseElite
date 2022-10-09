CREATE TABLE `ecb_roubos` (
	`id` INT(11) NULL DEFAULT NULL,
	`time` VARCHAR(50) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci',
	`user_id` INT(11) NULL DEFAULT NULL,
	`type` VARCHAR(50) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci'
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
;
