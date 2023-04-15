-- Facility basic queries (#1)
SELECT Name, `Phone Number`, Address, `Postal Code`, Capacity, `Type`, `Web Address`, `Manager Medicare Number` FROM Facility;
INSERT INTO Facility (Name, `Phone Number`, Address, `Postal Code`, Capacity, `Type`, `Web Address`, `Manager Medicare Number`) VALUES('', '', '', '', 0, '', '', '');
UPDATE Facility SET Address='', `Postal Code`='', Capacity=0, `Type`='', `Web Address`='', `Manager Medicare Number`='' WHERE Name='' AND `Phone Number`='';
DELETE FROM Facility WHERE Name='' AND `Phone Number`='';

-- Employee basic queries (#2)
SELECT `Medicare Number`, `Last Name`, `First Name`, `Birth Date`, Address, `Postal Code`, `Phone Number`, Citizenship, Email, `Role` FROM Employee;
INSERT INTO Employee (`Medicare Number`, `Last Name`, `First Name`, `Birth Date`, Address, `Postal Code`, `Phone Number`, Citizenship, Email, `Role`) VALUES('', '', '', '', '', '', '', '', '', '');
UPDATE Employee SET `Last Name`='', `First Name`='', `Birth Date`='', Address='', `Postal Code`='', `Phone Number`='', Citizenship='', Email='', `Role`='' WHERE `Medicare Number`='';
DELETE FROM Employee WHERE `Medicare Number`='';

-- Vaccination basic queries (#3)
SELECT `Type`, `Dose Number`, `Facility Name`, `Facility Phone Number`, `Employee Medicare Number`, `Date` FROM Vaccination;
INSERT INTO Vaccination (`Type`, `Dose Number`, `Facility Name`, `Facility Phone Number`, `Employee Medicare Number`, `Date`) VALUES('', 0, '', '', '', '');
UPDATE Vaccination SET `Date`='' WHERE `Type`='' AND `Dose Number`=0 AND `Facility Name`='' AND `Facility Phone Number`='' AND `Employee Medicare Number`='';
DELETE FROM Vaccination WHERE `Type`='' AND `Dose Number`=0 AND `Facility Name`='' AND `Facility Phone Number`='' AND `Employee Medicare Number`='';

-- Infection basic queries (#4)
SELECT `Type`, `Date`, `Employee Medicare Number` FROM Infection;
INSERT INTO Infection (`Type`, `Date`, `Employee Medicare Number`) VALUES('', '', '');
UPDATE Infection SET  WHERE `Type`='' AND `Date`='' AND `Employee Medicare Number`='';
DELETE FROM Infection WHERE `Type`='' AND `Date`='' AND `Employee Medicare Number`='';

-- Scheduled basic queries (#5)
SELECT `Facility Name`, `Facility Phone Number`, `Employee Medicare Number`, `Start Time`, `End Time`, `Date` FROM Scheduled;
INSERT INTO Scheduled (`Facility Name`, `Facility Phone Number`, `Employee Medicare Number`, `Start Time`, `End Time`, `Date`) VALUES('', '', '', '', '', '');
UPDATE Scheduled SET `End Time`='' WHERE `Facility Name`='' AND `Facility Phone Number`='' AND `Employee Medicare Number`='' AND `Start Time`='' AND `Date`='';
DELETE FROM Scheduled WHERE `Facility Name`='' AND `Facility Phone Number`='' AND `Employee Medicare Number`='' AND `Start Time`='' AND `Date`='';

-- Schedule insert that will not work (#5) (returns an SQL error with message: "Scheduling time conflict. Unable to add this schedule for this time.")
INSERT INTO Scheduled
(`Facility Name`, `Facility Phone Number`, `Employee Medicare Number`, `Start Time`, `End Time`, `Date`)
VALUES('Canada National Hospital', '514-444-3456', 'ROLE865495682758', '10:00', '13:00', '2023-04-08');

-- PostalCode Basic Queries
SELECT `Postal Code`, City, Province FROM PostalCode;
INSERT INTO PostalCode (`Postal Code`, City, Province) VALUES('', '', '');
UPDATE PostalCode SET City='', Province='' WHERE `Postal Code`='';
DELETE FROM PostalCode WHERE `Postal Code`='';
