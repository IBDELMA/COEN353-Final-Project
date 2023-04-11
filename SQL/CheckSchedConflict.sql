DROP TRIGGER IF EXISTS jbc353_4.CheckSchedConflictInsert;
DELIMITER $$
CREATE TRIGGER jbc353_4.CheckSchedConflictInsert
BEFORE INSERT ON jbc353_4.Scheduled 
FOR EACH ROW
BEGIN
IF EXISTS (
	SELECT * FROM Scheduled
	WHERE Scheduled.`Date` = NEW.`Date` AND Scheduled.`Employee Medicare Number` = NEW.`Employee Medicare Number`
	AND ((Scheduled.`Start Time` < NEW.`Start Time` AND Scheduled.`End Time` >= NEW.`Start Time`)
	OR (Scheduled.`Start Time` >= NEW.`Start Time` AND Scheduled.`End Time` <= NEW.`End Time`)
	OR (Scheduled.`Start Time` > NEW.`Start Time` AND Scheduled.`End Time` < NEW.`End Time`)
	OR (Scheduled.`Start Time` <= NEW.`End Time` AND Scheduled.`End Time` > NEW.`End Time`)
	OR (TIMEDIFF(NEW.`Start Time`, Scheduled.`End Time`) < TIME('1:00') AND TIMEDIFF(NEW.`Start Time`, Scheduled.`End Time`) >= TIME('0:00')) 
	OR (TIMEDIFF(Scheduled.`Start Time`, NEW.`End Time`) < TIME('1:00') AND TIMEDIFF(Scheduled.`Start Time`, NEW.`End Time`) >= TIME('0:00'))))
THEN
	SIGNAL SQLSTATE '50001' SET MESSAGE_TEXT = "Scheduling time conflict. Unable to add this schedule for this time.";
ELSE 
	IF DATEDIFF(NEW.`Date`, current_date()) > 14
	THEN
	SIGNAL SQLSTATE '50001' SET MESSAGE_TEXT = "Unable to add this schedule more than two weeks in advance.";
	END IF;
END IF; 
END;$$ 
delimiter ;


DROP TRIGGER IF EXISTS jbc353_4.CheckSchedConflictUpdate;
DELIMITER $$
$$
CREATE TRIGGER jbc353_4.CheckSchedConflictUpdate
BEFORE UPDATE ON jbc353_4.Scheduled 
FOR EACH ROW
BEGIN
IF EXISTS (
	SELECT * FROM Scheduled
	WHERE Scheduled.`Date` = NEW.`Date` AND Scheduled.`Employee Medicare Number` = NEW.`Employee Medicare Number`
	AND ((Scheduled.`Start Time` < NEW.`Start Time` AND Scheduled.`End Time` >= NEW.`Start Time`)
	OR (Scheduled.`Start Time` >= NEW.`Start Time` AND Scheduled.`End Time` <= NEW.`End Time`)
	OR (Scheduled.`Start Time` > NEW.`Start Time` AND Scheduled.`End Time` < NEW.`End Time`)
	OR (Scheduled.`Start Time` <= NEW.`End Time` AND Scheduled.`End Time` > NEW.`End Time`)
	OR (TIMEDIFF(NEW.`Start Time`, Scheduled.`End Time`) < TIME('1:00') AND TIMEDIFF(NEW.`Start Time`, Scheduled.`End Time`) >= TIME('0:00')) 
	OR (TIMEDIFF(Scheduled.`Start Time`, NEW.`End Time`) < TIME('1:00') AND TIMEDIFF(Scheduled.`Start Time`, NEW.`End Time`) >= TIME('0:00'))))
THEN
	SIGNAL SQLSTATE '50001' SET MESSAGE_TEXT = "Scheduling time conflict. Unable to update schedule for this time.";
ELSE 
	IF DATEDIFF(NEW.`Date`, current_date()) > 14
	THEN
	SIGNAL SQLSTATE '50001' SET MESSAGE_TEXT = "Unable to add this schedule more than two weeks in advance.";
	END IF;
END IF; 
END;$$ 
delimiter ;
