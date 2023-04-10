DROP TRIGGER IF EXISTS jbc353_4.CheckSchedConflictInsert;
DELIMITER $$
CREATE TRIGGER jbc353_4.CheckSchedConflictInsert
BEFORE INSERT ON jbc353_4.Scheduled 
FOR EACH ROW
IF EXISTS (SELECT * FROM Scheduled
WHERE Scheduled.`Date` = NEW.`Date` AND Scheduled.`Employee Medicare Number` = NEW.`Employee Medicare Number` AND
((Scheduled.`Start Time` < NEW.`Start Time` AND Scheduled.`End Time` >= NEW.`Start Time`)
OR (Scheduled.`Start Time` >= NEW.`Start Time` AND Scheduled.`End Time` <= NEW.`End Time`)
OR (Scheduled.`Start Time` > NEW.`Start Time` AND Scheduled.`End Time` < NEW.`End Time`)
OR (Scheduled.`Start Time` <= NEW.`End Time` AND Scheduled.`End Time` > NEW.`End Time`)
OR (TIMEDIFF(NEW.`Start Time`, Scheduled.`End Time`) < TIME('1:00') AND TIMEDIFF(NEW.`Start Time`, Scheduled.`End Time`) >= TIME('0:00')) 
OR (TIMEDIFF(Scheduled.`Start Time`, NEW.`End Time`) < TIME('1:00') AND TIMEDIFF(Scheduled.`Start Time`, NEW.`End Time`) >= TIME('0:00'))
))
THEN
	SET @message = (SELECT GROUP_CONCAT(CONCAT(Scheduled.`Employee Medicare Number`, Scheduled.`Start Time`, Scheduled.`End Time`, Scheduled.`Date`) separator ';')  FROM Scheduled
		WHERE Scheduled.`Date` = NEW.`Date` AND Scheduled.`Employee Medicare Number` = NEW.`Employee Medicare Number` AND
		((Scheduled.`Start Time` < NEW.`Start Time` AND Scheduled.`End Time` >= NEW.`Start Time`)
		OR (Scheduled.`Start Time` >= NEW.`Start Time` AND Scheduled.`End Time` <= NEW.`End Time`)
		OR (Scheduled.`Start Time` > NEW.`Start Time` AND Scheduled.`End Time` < NEW.`End Time`)
		OR (Scheduled.`Start Time` <= NEW.`End Time` AND Scheduled.`End Time` > NEW.`End Time`)
		OR (TIMEDIFF(NEW.`Start Time`, Scheduled.`End Time`) < TIME('1:00') AND TIMEDIFF(NEW.`Start Time`, Scheduled.`End Time`) >= TIME('0:00')) 
		OR (TIMEDIFF(Scheduled.`Start Time`, NEW.`End Time`) < TIME('1:00') AND TIMEDIFF(Scheduled.`Start Time`, NEW.`End Time`) >= TIME('0:00'))
		));
	SIGNAL SQLSTATE '50001' SET MESSAGE_TEXT = @message;
END IF; $$ 
delimiter ;


DROP TRIGGER IF EXISTS jbc353_4.CheckSchedConflictUpdate;
DELIMITER $$
$$
CREATE TRIGGER jbc353_4.CheckSchedConflictUpdate
BEFORE UPDATE ON jbc353_4.Scheduled 
FOR EACH ROW
IF EXISTS
(SELECT * FROM Scheduled
WHERE Scheduled.`Date` = NEW.`Date` AND Scheduled.`Employee Medicare Number` = NEW.`Employee Medicare Number` AND
((DATEDIFF(Scheduled.`End Time`, NEW.`Start Time`) >= 1) OR (DATEDIFF(NEW.`End Time`, Scheduled.`Start Time`) >= 1)))
THEN
SIGNAL SQLSTATE '50001' SET MESSAGE_TEXT = 'Schedule Conflict.';
END IF; $$ 
DELIMITER ;
