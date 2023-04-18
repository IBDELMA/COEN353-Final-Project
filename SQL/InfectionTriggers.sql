/* 
“If a doctor or a nurse gets infected by COVID-19, then the system should automatically cancel 
all the assignments for the infected employee for two weeks from the date of infection. 
Also, the system should send an email to inform/track all the doctors and nurses who have been in 
contact by having the same schedule as the infected employee. Each email should have as a subject “Warning” 
and as a body “One of your colleagues that you have worked with in the past two weeks have been infected with 
COVID-19”. 
*/

DROP TRIGGER IF EXISTS jbc353_4.InfectionInsert;
DELIMITER $$
CREATE TRIGGER jbc353_4.InfectionInsert
BEFORE INSERT ON jbc353_4.Infection 
FOR EACH ROW
BEGIN
	IF NEW.Type = 'COVID-19' 
		AND (SELECT e.`Role` FROM Employee e WHERE e.`Medicare Number` = NEW.`Employee Medicare Number`) IN ('Doctor', 'Nurse')
	THEN
		DELETE FROM Scheduled s	
		WHERE s.`Employee Medicare Number` = NEW.`Employee Medicare Number`
		AND (DATEDIFF(s.`Date`, NEW.Date) <= 14 AND DATEDIFF(s.`Date`, NEW.Date) >= 0);
		
		INSERT INTO MailStack (`Facility Name`, Recipient, Subject, Content)
		SELECT s.`Facility Name`, e.Email, 'Warning', 'One of your colleagues that you have worked with in the past two weeks have been infected with COVID-19'
		FROM Scheduled s
		JOIN Employee e ON s.`Employee Medicare Number` = e.`Medicare Number`
		WHERE s.`Employee Medicare Number` != NEW.`Employee Medicare Number` 
		AND e.`Role` IN ('Doctor', 'Nurse')
		AND DATEDIFF(NEW.Date, s.`Date`) <= 14 AND DATEDIFF(NEW.Date, s.`Date`) >= 0
		AND (s.`Date`, s.`Facility Name`, s.`Facility Phone Number`) 
			IN (SELECT sc.`Date`, sc.`Facility Name`, sc.`Facility Phone Number` 
			FROM Scheduled sc WHERE sc.`Employee Medicare Number` = NEW.`Employee Medicare Number`);
	END IF; 
END;$$ 
delimiter ;

DROP TRIGGER IF EXISTS jbc353_4.InfectionUpdate;
DELIMITER $$
CREATE TRIGGER jbc353_4.InfectionUpdate
BEFORE UPDATE ON jbc353_4.Infection 
FOR EACH ROW
BEGIN
	IF NEW.Type = 'COVID-19' 
		AND (SELECT e.`Role` FROM Employee e WHERE e.`Medicare Number` = NEW.`Employee Medicare Number`) IN ('Doctor', 'Nurse')
	THEN
		DELETE FROM Scheduled s	
		WHERE s.`Employee Medicare Number` = NEW.`Employee Medicare Number`
		AND (DATEDIFF(s.`Date`, NEW.Date) <= 14 AND DATEDIFF(s.`Date`, NEW.Date) >= 0);
		
		INSERT INTO MailStack (`Facility Name`, Recipient, Subject, Content)
		SELECT s.`Facility Name`, e.Email, 'Warning', 'One of your colleagues that you have worked with in the past two weeks have been infected with COVID-19'
		FROM Scheduled s
		JOIN Employee e ON s.`Employee Medicare Number` = e.`Medicare Number`
		WHERE s.`Employee Medicare Number` != NEW.`Employee Medicare Number` 
		AND e.`Role` IN ('Doctor', 'Nurse')
		AND DATEDIFF(NEW.Date, s.`Date`) <= 14 AND DATEDIFF(NEW.Date, s.`Date`) >= 0
		AND (s.`Date`, s.`Facility Name`, s.`Facility Phone Number`) 
			IN (SELECT sc.`Date`, sc.`Facility Name`, sc.`Facility Phone Number` 
			FROM Scheduled sc WHERE sc.`Employee Medicare Number` = NEW.`Employee Medicare Number`);
	END IF; 
END;$$ 
delimiter ;