-- Query #6
SELECT f.Name, f.Address, pc.City, pc.Province, f.`Postal Code`, f.`Phone Number`, f.`Web Address`, f.`Type`, f.Capacity, CONCAT(e.`First Name`, ' ', e.`Last Name`) AS `General Manager Name`, COUNT(*) AS `Number of Current Employees`  
	FROM Facility f
	JOIN Employee e ON e.`Medicare Number` = f.`Manager Medicare Number`
	JOIN PostalCode pc ON pc.`Postal Code` = f.`Postal Code`
	JOIN Employed ed ON ed.`Facility Name` = f.Name AND ed.`Facility Phone Number` = f.`Phone Number`
	WHERE ed.`End Date` IS NULL
	GROUP BY f.Name, f.`Phone Number` 
	ORDER BY pc.Province, pc.City, f.`Type`, `Number of Current Employees` ASC;

-- Query #7
SELECT e.`First Name`, e.`Last Name`, ed.`Start Date`, e.`Birth Date`, e.`Medicare Number`, e.`Phone Number`, e.Address, pc.City, pc.Province, e.`Postal Code`, e.Citizenship, e.Email  
	FROM Facility f
	JOIN Employed ed ON ed.`Facility Name` = f.Name AND ed.`Facility Phone Number` = f.`Phone Number`
	JOIN Employee e ON e.`Medicare Number` = ed.`Medicare Number`
	JOIN PostalCode pc ON pc.`Postal Code` = e.`Postal Code`  
	WHERE f.Name = 'CLSC Concordia' AND f.`Phone Number` = '514-555-6161' AND ed.`End Date` IS NULL 
	ORDER BY e.`Role`, e.`First Name`, e.`Last Name` ASC;

-- Query #8
SELECT s.`Facility Name`, s.`Date`, s.`Start Time`, s.`End Time`
	FROM Employee e
	JOIN Scheduled s ON s.`Employee Medicare Number` = e.`Medicare Number`
	WHERE s.`Start Time` >= `15/09/2020` AND s.`End Time` <= `15/10/2020` 
	ORDER BY s.`Facility Name`, DATEPART(dayofyear, s.'Date'), s.`Start Time` ASC;

-- Query #9
SELECT e.`First Name`,  e.`Last Name`, i.`Date`, e.`Facility`
	FROM Employee e
	JOIN Employed ed ON ed.`Medicare Number` = e.`Medicare Number`
	JOIN Infection i ON i.`Employee Medicare Number` = e.`Medicare Number`
	WHERE e.`Role` =  `Doctor` AND i.`Date` IS NOT NULL
	ORDER BY e.`Facility`

-- Query #10
SELECT e.`Email`
	FROM Facility f
	JOIN Employed ed ON ed.`Facility Name` = f.Name AND ed.`Facility Phone Number` = f.`Phone Number`
	JOIN Employee e ON e.`Medicare Number` = ed.`Medicare Number`
	ORDER BY e.`Start Date` ASC

-- Query #11
SELECT e.`First Name`, e.`Last Name`, e.`Role`
	FROM Employee e
	JOIN Scheduled s ON s.`Employee Medicare Number` = e.`Medicare Number`
	WHERE s.`Start Time` <= DATEADD(week, -2, GETDATE()) AND (e.`Role` = `Doctor` OR e.`Role` = 'Nurse')
	ORDER BY e.`First Name` ASC

-- Query #16
SELECT e.`First Name`, e.`Last Name`, ed.`Start Date`, e.`Role`, e.`Birth Date`, e.`Email`, SUM(TIMESTAMPDIFF(Hour, s.`Start Time`, s.`End Time`)) as Hours
	FROM Employee e
 	JOIN Employed ed ON ed.`Medicare Number` = e.`Medicare Number`
	JOIN Scheduled s ON s.`Employee Medicare Number` = e.`Medicare Number`
	JOIN Infection i ON i.`Employee Medicare Number`  = e.`Medicare Number`
	WHERE (e.`Role` = 'Doctor' OR e.`Role` = 'Nurse') AND (
	SELECT COUNT(*) FROM Infection i WHERE `Type` = 'COVID-19' AND i.`Employee Medicare Number` = e.`Medicare Number` GROUP BY e.`Medicare Number`) >= 3
 	GROUP BY e.`Medicare Number`
	ORDER BY e.`Role`, e.`First Name`, e.`Last Name` ASC