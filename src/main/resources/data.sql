INSERT INTO `personnes` (`id`, `date_naissance`, `email`, `nom`, `prenom`, `telephone`) VALUES (NULL, '1970-12-10', 'alaindupont@test.com', 'dupont', 'maurice', '0112131415'), (NULL, '1980-04-22', 'jean.dubois@test.com', 'dubois', 'jean', '0612141516');
CREATE TABLE IF NOT EXISTS test ( id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT , `test` VARCHAR(10) NOT NULL ) ENGINE = InnoDB;