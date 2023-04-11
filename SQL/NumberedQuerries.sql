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
