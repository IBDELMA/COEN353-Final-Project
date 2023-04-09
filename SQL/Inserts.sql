-- Delete all Current Table entries

DELETE FROM Employed;
DELETE FROM Facility;
DELETE FROM Employee;
DELETE FROM PostalCode;

-- -----------------------
-- Insert Employees

INSERT INTO Employee
(`Medicare Number`, `Last Name`, `First Name`, `Birth Date`, Address, `Postal Code`, `Phone Number`, Citizenship, Email, `Role`)
VALUES('BYER723802947583', 'Yero', 'Brent', '03/12/1974', '927 Blueberry Avenue', 'H6Z 1J6', '514-868-5555', 'Canadian Citizen', 'byer@clsc.ca', 'Manager');

INSERT INTO Employee
(`Medicare Number`, `Last Name`, `First Name`, `Birth Date`, Address, `Postal Code`, `Phone Number`, Citizenship, Email, `Role`)
VALUES('TREL865495682758', 'Trebol', 'Lee', '03/10/1984', '81 Bluery Avenue', 'H3Z 3J8', '514-831-4444', 'Canadian Citizen', 'trel@clsc.ca', 'Nurse');

INSERT INTO Employee
(`Medicare Number`, `Last Name`, `First Name`, `Birth Date`, Address, `Postal Code`, `Phone Number`, Citizenship, Email, `Role`)
VALUES('ROLE865495682758', 'Oley', 'Ricard', '01/11/1988', '131 Isabella Avenue', 'H1Z 1J9', '514-487-3838', 'Canadian Citizen', 'role@clsc.ca', 'Manager');

-- -----------------------
-- Insert Facilities

INSERT INTO Facility
(Name, `Phone Number`, Address, `Postal Code`, Capacity, `Type`, `Web Address`, `Manager Medicare Number`)
VALUES('CLSC Concordia', '514-555-6161', '1500 De Maissonneuve', 'H3B 9P3', 2500, 'CLSC', 'http://clsc-concordia.ca', 'BYER723802947583');

INSERT INTO Facility
(Name, `Phone Number`, Address, `Postal Code`, Capacity, `Type`, `Web Address`, `Manager Medicare Number`)
VALUES('PJC Snowden', '514-444-8123', '503 Queen Mary Boulevard', 'H3A 9Z3', 400, 'Pharmacy', 'http://pjc-snowden.ca', 'ROLE865495682758');

-- -----------------------
-- Insert Employed

INSERT INTO Employed
(`Facility Name`, `Facility Phone Number`, `Medicare Number`, `Start Date`, `End Date`)
VALUES('CLSC Concordia', '514-555-6161', 'BYER723802947583', '01/01/2020', NULL);

INSERT INTO Employed
(`Facility Name`, `Facility Phone Number`, `Medicare Number`, `Start Date`, `End Date`)
VALUES('PJC Snowden', '514-444-8123', 'BYER723802947583', '01/01/2018', '08/10/2019');

INSERT INTO Employed
(`Facility Name`, `Facility Phone Number`, `Medicare Number`, `Start Date`, `End Date`)
VALUES('CLSC Concordia', '514-555-6161', 'TREL865495682758', '05/09/2022', NULL);

INSERT INTO Employed
(`Facility Name`, `Facility Phone Number`, `Medicare Number`, `Start Date`, `End Date`)
VALUES('PJC Snowden', '514-444-8123', 'TREL865495682758', '05/02/2021', NULL);

INSERT INTO Employed
(`Facility Name`, `Facility Phone Number`, `Medicare Number`, `Start Date`, `End Date`)
VALUES('PJC Snowden', '514-444-8123', 'ROLE865495682758', '06/01/2022', NULL);

-- -----------------------
-- Insert PostalCodes

INSERT INTO PostalCode
(`Postal Code`, City, Province)
VALUES('H6Z 1J6', 'Montreal', 'Quebec');

INSERT INTO PostalCode
(`Postal Code`, City, Province)
VALUES('H3Z 3J8', 'Montreal', 'Quebec');

INSERT INTO PostalCode
(`Postal Code`, City, Province)
VALUES('H3B 9P3', 'Montreal', 'Quebec');

INSERT INTO PostalCode
(`Postal Code`, City, Province)
VALUES('H3A 9Z3', 'Montreal', 'Quebec');

INSERT INTO PostalCode
(`Postal Code`, City, Province)
VALUES('H1Z 1J9', 'Montreal', 'Quebec');

