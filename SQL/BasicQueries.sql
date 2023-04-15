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
