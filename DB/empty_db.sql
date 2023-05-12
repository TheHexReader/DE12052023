CREATE TABLE IF NOT EXISTS `itshka`.`devices_brands` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
;

CREATE TABLE IF NOT EXISTS `itshka`.`devices_types` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(255) NOT NULL,
  `description` TEXT NOT NULL,
  PRIMARY KEY (`id`))
;

CREATE TABLE IF NOT EXISTS `itshka`.`accessories` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `device_name` VARCHAR(255) NOT NULL,
  `price` FLOAT NOT NULL,
  `devices_brands_id` INT NOT NULL,
  `devices_types_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_accessories_devices_brands1_idx` (`devices_brands_id` ASC) VISIBLE,
  INDEX `fk_accessories_devices_types1_idx` (`devices_types_id` ASC) VISIBLE,
  CONSTRAINT `fk_accessories_devices_brands1`
    FOREIGN KEY (`devices_brands_id`)
    REFERENCES `itshka`.`devices_brands` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_accessories_devices_types1`
    FOREIGN KEY (`devices_types_id`)
    REFERENCES `itshka`.`devices_types` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

CREATE TABLE IF NOT EXISTS `itshka`.`clients` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `full_name` VARCHAR(255) NOT NULL,
  `tel_number` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id`))
;

CREATE TABLE IF NOT EXISTS `itshka`.`orders` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `date` DATE NOT NULL,
  `clients_id` INT NOT NULL,
  `price` INT NOT NULL,
  `status` ENUM('Done', 'Rejected', 'Working On', 'Accepted') NOT NULL,
  `master` VARCHAR(255) NOT NULL,
  `description` TEXT NOT NULL,
  `accessories_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_orders_clients_idx` (`clients_id` ASC) VISIBLE,
  INDEX `fk_orders_accessories1_idx` (`accessories_id` ASC) VISIBLE,
  CONSTRAINT `fk_orders_clients`
    FOREIGN KEY (`clients_id`)
    REFERENCES `itshka`.`clients` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_accessories1`
    FOREIGN KEY (`accessories_id`)
    REFERENCES `itshka`.`accessories` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;
