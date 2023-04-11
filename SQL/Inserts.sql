-- Delete all Current Table entries

DELETE FROM Employed;
DELETE FROM Facility;
DELETE FROM Employee;
DELETE FROM PostalCode;
DELETE FROM Vaccination;
DELETE FROM Infection;
DELETE FROM Scheduled;

-- -----------------------
-- Insert Employees

INSERT INTO Employee
(`Medicare Number`, `Last Name`, `First Name`, `Birth Date`, Address, `Postal Code`, `Phone Number`, Citizenship, Email, `Role`)
VALUES('BYER723802947583', 'Yero', 'Brent', '1974-03-11', '927 Blueberry Avenue', 'H6Z 1J6', '514-868-5555', 'Canadian Citizen', 'byer@clsc.ca', 'Manager');

INSERT INTO Employee
(`Medicare Number`, `Last Name`, `First Name`, `Birth Date`, Address, `Postal Code`, `Phone Number`, Citizenship, Email, `Role`)
VALUES('DFLE865495682758', 'Fletcher', 'David', '1988-01-11', '456 Dale Avenue', 'H1Z 1J9', '514-487-4444', 'Permanent Resident', 'dfle@clsc.ca', 'Manager');

INSERT INTO Employee
(`Medicare Number`, `Last Name`, `First Name`, `Birth Date`, Address, `Postal Code`, `Phone Number`, Citizenship, Email, `Role`)
VALUES('EMIL865495682758', 'Miller', 'Emily', '1989-02-12', '567 Euclid Avenue', 'H3C 3C3', '514-487-5555', 'Canadian Citizen', 'emil@clsc.ca', 'Manager');

INSERT INTO Employee
(`Medicare Number`, `Last Name`, `First Name`, `Birth Date`, Address, `Postal Code`, `Phone Number`, Citizenship, Email, `Role`)
VALUES('FARC865495682758', 'Archer', 'Frank', '1990-03-13', '678 Farmhouse Avenue', 'H4D 4D4', '514-487-6666', 'Permanent Resident', 'farc@clsc.ca', 'Manager');

INSERT INTO Employee
(`Medicare Number`, `Last Name`, `First Name`, `Birth Date`, Address, `Postal Code`, `Phone Number`, Citizenship, Email, `Role`)
VALUES('JHUN865495682758', 'Hunter', 'John', '1991-04-14', '789 Johnson Avenue', 'H5E 5E5', '514-487-7777', 'Canadian Citizen', 'jhun@clsc.ca', 'Manager');

INSERT INTO Employee
(`Medicare Number`, `Last Name`, `First Name`, `Birth Date`, Address, `Postal Code`, `Phone Number`, Citizenship, Email, `Role`)
VALUES('ASMI865495682758', 'Smith', 'Alice', '1981-04-12', '123 Apple Avenue', 'H1A 1A1', '514-621-1111', 'Permanent Resident', 'asmi@clsc.ca', 'Doctor');

INSERT INTO Employee
(`Medicare Number`, `Last Name`, `First Name`, `Birth Date`, Address, `Postal Code`, `Phone Number`, Citizenship, Email, `Role`)
VALUES('BSHE865495682758', 'Shepherd', 'Bob', '1982-05-13', '234 Bee Avenue', 'H2B 2B2', '514-621-2222', 'Canadian Citizen', 'bshe@clsc.ca', 'Doctor');

INSERT INTO Employee
(`Medicare Number`, `Last Name`, `First Name`, `Birth Date`, Address, `Postal Code`, `Phone Number`, Citizenship, Email, `Role`)
VALUES('CWHE865495682758', 'Wheeler', 'Charley', '1983-06-14', '345 Cris Avenue', 'H3Z 3J8', '514-621-3333', 'Permanent Resident', 'cwhe@clsc.ca', 'Doctor');

INSERT INTO Employee
(`Medicare Number`, `Last Name`, `First Name`, `Birth Date`, Address, `Postal Code`, `Phone Number`, Citizenship, Email, `Role`)
VALUES('ROLE865495682758', 'Oley', 'Ricard', '1992-05-15', '131 Isabella Avenue', 'H1Z 2J0', '514-487-3838', 'Canadian Citizen', 'role@clsc.ca', 'Doctor');

INSERT INTO Employee
(`Medicare Number`, `Last Name`, `First Name`, `Birth Date`, Address, `Postal Code`, `Phone Number`, Citizenship, Email, `Role`)
VALUES('KWEA865495682758', 'Weaver', 'Karen', '1993-06-16', '890 King Avenue', 'H6F 6F6', '514-487-8888', 'Permanent Resident', 'kwea@clsc.ca', 'Doctor');

INSERT INTO Employee
(`Medicare Number`, `Last Name`, `First Name`, `Birth Date`, Address, `Postal Code`, `Phone Number`, Citizenship, Email, `Role`)
VALUES('LANG865495682758', 'Angler', 'Liam', '1994-07-17', '901 Langelier Avenue', 'H7G 7G7', '514-487-9999', 'Canadian Citizen', 'lang@clsc.ca', 'Nurse');

INSERT INTO Employee
(`Medicare Number`, `Last Name`, `First Name`, `Birth Date`, Address, `Postal Code`, `Phone Number`, Citizenship, Email, `Role`)
VALUES('MSTO865495682758', 'Stone', 'Mary', '1995-08-18', '012 Mansion Avenue', 'H8H 8H8', '514-487-0000', 'Permanent Resident', 'msto@clsc.ca', 'Nurse');

INSERT INTO Employee
(`Medicare Number`, `Last Name`, `First Name`, `Birth Date`, Address, `Postal Code`, `Phone Number`, Citizenship, Email, `Role`)
VALUES('NBLA865495682758', 'Black', 'Nelson', '1996-09-19', '123 Niagara Avenue', 'H9J 9J9', '514-487-1111', 'Canadian Citizen', 'nbla@clsc.ca', 'Nurse');

INSERT INTO Employee
(`Medicare Number`, `Last Name`, `First Name`, `Birth Date`, Address, `Postal Code`, `Phone Number`, Citizenship, Email, `Role`)
VALUES('OHAG865495682758', 'Hageman', 'Oprah', '1997-10-10', '234 Oppenheimer Avenue', 'H0K 0K0', '514-487-2222', 'Permanent Resident', 'ohag@clsc.ca', 'Nurse');

INSERT INTO Employee
(`Medicare Number`, `Last Name`, `First Name`, `Birth Date`, Address, `Postal Code`, `Phone Number`, Citizenship, Email, `Role`)
VALUES('PAND865495682758', 'Anderson', 'Peter', '1998-11-11', '345 Palace Avenue', 'H1L 1L1', '514-487-3333', 'Canadian Citizen', 'pand@clsc.ca', 'Nurse');

-- -----------------------
-- Insert Facilities

INSERT INTO Facility
(Name, `Phone Number`, Address, `Postal Code`, Capacity, `Type`, `Web Address`, `Manager Medicare Number`)
VALUES('CLSC Concordia', '514-555-6161', '1500 De Maissonneuve', 'H3B 9P3', 2500, 'CLSC', 'http://clsc-concordia.ca', 'BYER723802947583');

INSERT INTO Facility
(Name, `Phone Number`, Address, `Postal Code`, Capacity, `Type`, `Web Address`, `Manager Medicare Number`)
VALUES('PJC Snowden', '514-444-8123', '503 Queen Mary Boulevard', 'H3A 9Z3', 400, 'Pharmacy', 'http://pjc-snowden.ca', 'DFLE865495682758');

INSERT INTO Facility
(Name, `Phone Number`, Address, `Postal Code`, Capacity, `Type`, `Web Address`, `Manager Medicare Number`)
VALUES('Central Hospital', '514-444-1234', '111 Palm Avenue', 'H3A 3A3', 600, 'Hospital', 'http://centralhospital.ca', 'EMIL865495682758');

INSERT INTO Facility
(Name, `Phone Number`, Address, `Postal Code`, Capacity, `Type`, `Web Address`, `Manager Medicare Number`)
VALUES('Clinic Riverside', '514-444-2345', '222 Crescent Avenue', 'H3A 4B4', 800, 'Clinic', 'http://clinic-riverside.ca', 'FARC865495682758');

INSERT INTO Facility
(Name, `Phone Number`, Address, `Postal Code`, Capacity, `Type`, `Web Address`, `Manager Medicare Number`)
VALUES('Canada National Hospital', '514-444-3456', '333 Dale Street', 'H3A 5C5', 1000, 'Special Installment', 'http://CNH.ca', 'JHUN865495682758');



-- -----------------------
-- Insert Employed

INSERT INTO Employed
(`Facility Name`, `Facility Phone Number`, `Medicare Number`, `Start Date`, `End Date`)
VALUES('CLSC Concordia', '514-555-6161', 'BYER723802947583', '2020-01-01', '2021-02-02');

INSERT INTO Employed
(`Facility Name`, `Facility Phone Number`, `Medicare Number`, `Start Date`, `End Date`)
VALUES('CLSC Concordia', '514-555-6161', 'ASMI865495682758', '2020-02-02', '2021-03-03');

INSERT INTO Employed
(`Facility Name`, `Facility Phone Number`, `Medicare Number`, `Start Date`, `End Date`)
VALUES('CLSC Concordia', '514-555-6161', 'LANG865495682758', '2020-03-03', '2021-04-04');

INSERT INTO Employed
(`Facility Name`, `Facility Phone Number`, `Medicare Number`, `Start Date`, `End Date`)
VALUES('PJC Snowden', '514-444-8123', 'DFLE865495682758', '2020-04-04', '2021-05-05');

INSERT INTO Employed
(`Facility Name`, `Facility Phone Number`, `Medicare Number`, `Start Date`, `End Date`)
VALUES('PJC Snowden', '514-444-8123', 'BSHE865495682758', '2020-05-05', '2021-06-06');

INSERT INTO Employed
(`Facility Name`, `Facility Phone Number`, `Medicare Number`, `Start Date`, `End Date`)
VALUES('PJC Snowden', '514-444-8123', 'MSTO865495682758', '2020-06-06', '2021-07-07');

INSERT INTO Employed
(`Facility Name`, `Facility Phone Number`, `Medicare Number`, `Start Date`, `End Date`)
VALUES('Central Hospital', '514-444-1234', 'EMIL865495682758', '2021-02-02', '2022-03-03');

INSERT INTO Employed
(`Facility Name`, `Facility Phone Number`, `Medicare Number`, `Start Date`, `End Date`)
VALUES('Central Hospital', '514-444-1234', 'CWHE865495682758', '2021-03-03', '2022-04-04');

INSERT INTO Employed
(`Facility Name`, `Facility Phone Number`, `Medicare Number`, `Start Date`, `End Date`)
VALUES('Central Hospital', '514-444-1234', 'NBLA865495682758', '2021-04-04', '2022-05-05');

INSERT INTO Employed
(`Facility Name`, `Facility Phone Number`, `Medicare Number`, `Start Date`, `End Date`)
VALUES('Clinic Riverside', '514-444-2345', 'FARC865495682758', '2022-03-03', '2023-04-04');

INSERT INTO Employed
(`Facility Name`, `Facility Phone Number`, `Medicare Number`, `Start Date`, `End Date`)
VALUES('Clinic Riverside', '514-444-2345', 'ROLE865495682758', '2022-04-04', NULL);

INSERT INTO Employed
(`Facility Name`, `Facility Phone Number`, `Medicare Number`, `Start Date`, `End Date`)
VALUES('Clinic Riverside', '514-444-2345', 'OHAG865495682758', '2022-05-05', NULL);

INSERT INTO Employed
(`Facility Name`, `Facility Phone Number`, `Medicare Number`, `Start Date`, `End Date`)
VALUES('Canada National Hospital', '514-444-3456', 'JHUN865495682758', '2023-04-04', NULL);

INSERT INTO Employed
(`Facility Name`, `Facility Phone Number`, `Medicare Number`, `Start Date`, `End Date`)
VALUES('Canada National Hospital', '514-444-3456', 'KWEA865495682758', '2023-04-05', NULL);

INSERT INTO Employed
(`Facility Name`, `Facility Phone Number`, `Medicare Number`, `Start Date`, `End Date`)
VALUES('Canada National Hospital', '514-444-3456', 'PAND865495682758', '2023-04-06', NULL);

INSERT INTO Employed
(`Facility Name`, `Facility Phone Number`, `Medicare Number`, `Start Date`, `End Date`)
VALUES('Canada National Hospital', '514-444-3456', 'OHAG865495682758', '2023-04-07', NULL);

INSERT INTO Employed
(`Facility Name`, `Facility Phone Number`, `Medicare Number`, `Start Date`, `End Date`)
VALUES('Canada National Hospital', '514-444-3456', 'ROLE865495682758', '2023-04-08', NULL);

INSERT INTO Employed
(`Facility Name`, `Facility Phone Number`, `Medicare Number`, `Start Date`, `End Date`)
VALUES('Canada National Hospital', '514-444-3456', 'NBLA865495682758', '2023-04-09', NULL);


-- -----------------------
-- Insert PostalCodes

INSERT INTO PostalCode
(`Postal Code`, City, Province)
VALUES('H6Z 1J6', 'Montreal', 'Quebec');

INSERT INTO PostalCode
(`Postal Code`, City, Province)
VALUES('H1Z 1J9', 'Montreal', 'Quebec');

INSERT INTO PostalCode
(`Postal Code`, City, Province)
VALUES('H3C 3C3', 'Montreal', 'Quebec');

INSERT INTO PostalCode
(`Postal Code`, City, Province)
VALUES('H4D 4D4', 'Montreal', 'Quebec');

INSERT INTO PostalCode
(`Postal Code`, City, Province)
VALUES('H5E 5E5', 'Montreal', 'Quebec');

INSERT INTO PostalCode
(`Postal Code`, City, Province)
VALUES('H1A 1A1', 'Montreal', 'Quebec');

INSERT INTO PostalCode
(`Postal Code`, City, Province)
VALUES('H2B 2B2', 'Montreal', 'Quebec');

INSERT INTO PostalCode
(`Postal Code`, City, Province)
VALUES('H3Z 3J8', 'Montreal', 'Quebec');

INSERT INTO PostalCode
(`Postal Code`, City, Province)
VALUES('H1Z 2J0', 'Montreal', 'Quebec');

INSERT INTO PostalCode
(`Postal Code`, City, Province)
VALUES('H6F 6F6', 'Montreal', 'Quebec');

INSERT INTO PostalCode
(`Postal Code`, City, Province)
VALUES('H7G 7G7', 'Montreal', 'Quebec');

INSERT INTO PostalCode
(`Postal Code`, City, Province)
VALUES('H8H 8H8', 'Montreal', 'Quebec');

INSERT INTO PostalCode
(`Postal Code`, City, Province)
VALUES('H9J 9J9', 'Montreal', 'Quebec');

INSERT INTO PostalCode
(`Postal Code`, City, Province)
VALUES('H0K 0K0', 'Montreal', 'Quebec');

INSERT INTO PostalCode
(`Postal Code`, City, Province)
VALUES('H1L 1L1', 'Montreal', 'Quebec');

INSERT INTO PostalCode
(`Postal Code`, City, Province)
VALUES('H3B 9P3', 'Montreal', 'Quebec');

INSERT INTO PostalCode
(`Postal Code`, City, Province)
VALUES('H3A 9Z3', 'Montreal', 'Quebec');

INSERT INTO PostalCode
(`Postal Code`, City, Province)
VALUES('H3A 3A3', 'Montreal', 'Quebec');

INSERT INTO PostalCode
(`Postal Code`, City, Province)
VALUES('H3A 4B4', 'Montreal', 'Quebec');

INSERT INTO PostalCode
(`Postal Code`, City, Province)
VALUES('H3A 5C5', 'Montreal', 'Quebec');


-- -----------------------
-- Insert Vaccination

INSERT INTO Vaccination
('Type', 'Dose Number', 'Facility Phone Number', 'Facility Name', 'Employee Medicare Number', 'Date')
VALUES('Pfizer', 1, '514-555-6161', 'CLSC Concordia', 'ASMI865495682758', '2020-02-02');

INSERT INTO Vaccination
('Type', 'Dose Number', 'Facility Phone Number', 'Facility Name', 'Employee Medicare Number', 'Date')
VALUES('Pfizer', 2, '514-444-8123', 'PJC Snowden', 'BSHE865495682758', '2020-03-03');

INSERT INTO Vaccination
('Type', 'Dose Number', 'Facility Phone Number', 'Facility Name', 'Employee Medicare Number', 'Date')
VALUES('Pfizer', 3, '514-444-1234', 'Central Hospital', 'CWHE865495682758', '2020-04-04');

INSERT INTO Vaccination
('Type', 'Dose Number', 'Facility Phone Number', 'Facility Name', 'Employee Medicare Number', 'Date')
VALUES('Pfizer', 4, '514-444-2345', 'Clinic Riverside', 'ROLE865495682758', '2020-05-05');

INSERT INTO Vaccination
('Type', 'Dose Number', 'Facility Phone Number', 'Facility Name', 'Employee Medicare Number', 'Date')
VALUES('Pfizer', 5, '514-444-3456', 'Canada National Hospital', 'KWEA865495682758', '2020-06-06');


-- -----------------------
-- Insert Infection

INSERT INTO Infection
('Type', 'Date', 'Employee Medicare Number')
VALUES('COVID-19', '2023-04-01', 'ASMI865495682758');

INSERT INTO Infection
('Type', 'Date', 'Employee Medicare Number')
VALUES('Influenza', '2023-04-02', 'BSHE865495682758');

INSERT INTO Infection
('Type', 'Date', 'Employee Medicare Number')
VALUES('COVID-19', '2023-04-03', 'CWHE865495682758');

INSERT INTO Infection
('Type', 'Date', 'Employee Medicare Number')
VALUES('Influenza', '2023-04-04', 'ROLE865495682758');

INSERT INTO Infection
('Type', 'Date', 'Employee Medicare Number')
VALUES('COVID-19', '2023-04-05', 'KWEA865495682758');

INSERT INTO Infection
('Type', 'Date', 'Employee Medicare Number')
VALUES('COVID-19', '2023-04-06', 'ASMI865495682758');

INSERT INTO Infection
('Type', 'Date', 'Employee Medicare Number')
VALUES('Influenza', '2023-04-07', 'BSHE865495682758');

INSERT INTO Infection
('Type', 'Date', 'Employee Medicare Number')
VALUES('COVID-19', '2023-04-08', 'CWHE865495682758');

INSERT INTO Infection
('Type', 'Date', 'Employee Medicare Number')
VALUES('Influenza', '2023-04-09', 'ROLE865495682758');

INSERT INTO Infection
('Type', 'Date', 'Employee Medicare Number')
VALUES('COVID-19', '2023-04-10', 'KWEA865495682758');

INSERT INTO Infection
('Type', 'Date', 'Employee Medicare Number')
VALUES('COVID-19', '2023-04-05', 'ASMI865495682758');

INSERT INTO Infection
('Type', 'Date', 'Employee Medicare Number')
VALUES('Influenza', '2023-04-04', 'BSHE865495682758');

INSERT INTO Infection
('Type', 'Date', 'Employee Medicare Number')
VALUES('COVID-19', '2023-04-14', 'CWHE865495682758');

INSERT INTO Infection
('Type', 'Date', 'Employee Medicare Number')
VALUES('Influenza', '2023-04-02', 'ROLE865495682758');

INSERT INTO Infection
('Type', 'Date', 'Employee Medicare Number')
VALUES('COVID-19', '2023-04-01', 'KWEA865495682758');

-- -----------------------
-- Insert Scheduled

INSERT INTO Scheduled
(`Facility Name`, `Facility Phone Number`, `Employee Medicare Number`, `Start Time`, `End Time`, `Date`)
VALUES('Canada National Hospital', '514-444-3456', 'JHUN865495682758', '9:00', '14:00', '2023-04-04');

INSERT INTO Scheduled
(`Facility Name`, `Facility Phone Number`, `Employee Medicare Number`, `Start Time`, `End Time`, `Date`)
VALUES('Canada National Hospital', '514-444-3456', 'JHUN865495682758', '9:00', '14:00', '2023-04-05');

INSERT INTO Scheduled
(`Facility Name`, `Facility Phone Number`, `Employee Medicare Number`, `Start Time`, `End Time`, `Date`)
VALUES('Canada National Hospital', '514-444-3456', 'JHUN865495682758', '9:00', '14:00', '2023-04-06');

INSERT INTO Scheduled
(`Facility Name`, `Facility Phone Number`, `Employee Medicare Number`, `Start Time`, `End Time`, `Date`)
VALUES('Canada National Hospital', '514-444-3456', 'JHUN865495682758', '9:00', '14:00', '2023-04-07');

INSERT INTO Scheduled
(`Facility Name`, `Facility Phone Number`, `Employee Medicare Number`, `Start Time`, `End Time`, `Date`)
VALUES('Canada National Hospital', '514-444-3456', 'JHUN865495682758', '9:00', '14:00', '2023-04-08');

INSERT INTO Scheduled
(`Facility Name`, `Facility Phone Number`, `Employee Medicare Number`, `Start Time`, `End Time`, `Date`)
VALUES('Canada National Hospital', '514-444-3456', 'KWEA865495682758', '9:00', '14:00', '2023-04-05');

INSERT INTO Scheduled
(`Facility Name`, `Facility Phone Number`, `Employee Medicare Number`, `Start Time`, `End Time`, `Date`)
VALUES('Canada National Hospital', '514-444-3456', 'PAND865495682758', '9:00', '15:00', '2023-04-06');

INSERT INTO Scheduled
(`Facility Name`, `Facility Phone Number`, `Employee Medicare Number`, `Start Time`, `End Time`, `Date`)
VALUES('Canada National Hospital', '514-444-3456', 'OHAG865495682758', '9:00', '14:00', '2023-04-07');

INSERT INTO Scheduled
(`Facility Name`, `Facility Phone Number`, `Employee Medicare Number`, `Start Time`, `End Time`, `Date`)
VALUES('Canada National Hospital', '514-444-3456', 'ROLE865495682758', '9:00', '14:00', '2023-04-08');

INSERT INTO Scheduled
(`Facility Name`, `Facility Phone Number`, `Employee Medicare Number`, `Start Time`, `End Time`, `Date`)
VALUES('Canada National Hospital', '514-444-3456', 'NBLA865495682758', '9:00', '14:00', '2023-04-09');