DROP TRIGGER IF EXISTS jbc353_4.CheckCapacityInsert;
DELIMITER $$
CREATE TRIGGER jbc353_4.CheckCapacityInsert
BEFORE INSERT ON jbc353_4.Employed 
FOR EACH ROW
BEGIN
	SET @capacity = 
		(SELECT Capacity FROM Facility f
		WHERE f.Name = NEW.`Facility Name` AND f.`Phone Number` = NEW.`Facility Phone Number`);
	SET @currentCount =
		(SELECT COUNT(*) FROM Employed ed 
		WHERE ed.`Facility Name` = NEW.`Facility Name` AND ed.`Facility Phone Number` = NEW.`Facility Phone Number` AND ed.`End Date` IS NULL);
	IF (@currentCount >= @capacity) AND (NEW.`End Date` IS NULL)
	THEN
		SIGNAL SQLSTATE '50001' SET MESSAGE_TEXT = "Facility already at capacity. Unable to add this employee to this facility.";
	END IF; 
END;$$ 
delimiter ;

DROP TRIGGER IF EXISTS jbc353_4.CheckCapacityUpdate;
DELIMITER $$
CREATE TRIGGER jbc353_4.CheckCapacityUpdate
BEFORE UPDATE ON jbc353_4.Employed 
FOR EACH ROW
BEGIN
	SET @capacity = 
		(SELECT Capacity FROM Facility f
		WHERE f.Name = NEW.`Facility Name` AND f.`Phone Number` = NEW.`Facility Phone Number`);
	SET @currentCount =
		(SELECT COUNT(*) FROM Employed ed 
		WHERE ed.`Facility Name` = NEW.`Facility Name` AND ed.`Facility Phone Number` = NEW.`Facility Phone Number` AND ed.`End Date` IS NULL);
	IF (@currentCount >= @capacity) AND (NEW.`End Date` IS NULL)
	THEN
		SIGNAL SQLSTATE '50001' SET MESSAGE_TEXT = "Facility already at capacity. Unable to add this employee to this facility.";
	END IF; 
END;$$ 
delimiter ;