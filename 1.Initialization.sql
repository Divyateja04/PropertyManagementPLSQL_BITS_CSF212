--- CREATING THE TABLES
CREATE TABLE Property (
    propertyID INT NOT NULL PRIMARY KEY,
    ownerID VARCHAR(12) NOT NULL,
    rentPerMonth INT,
    availableFrom DATE,
    availableTill DATE,
    totalArea INT NOT NULL,
    plinthArea INT NOT NULL,
    noOfFloors INT,
    yearOfConstruction INT NOT NULL,
    locality VARCHAR(100),
    address VARCHAR(500),
    annualHike INT,
    residential INT DEFAULT 0,
    noOfBedrooms INT    
);

CREATE TABLE Users (
    aadharID VARCHAR(12) PRIMARY KEY NOT NULL,
    loginID VARCHAR(15) NOT NULL,
    loginPassword VARCHAR(15) NOT NULL,
    name VARCHAR(30),
    age INT,
    doorNo INT,
    pinCode INT,
    street VARCHAR(50),
    isManager INT DEFAULT 0,
    isDBA INT DEFAULT 0
);

CREATE TABLE UsersPhoneNumbers (
    aadharID VARCHAR(12) NOT NULL,
    phoneNumber INT,
    CHECK(phoneNumber > 1000000000 AND phoneNumber <= 9999999999)
);

CREATE TABLE Tenantship (
    rentedPropertyID INT NOT NULL,
    startDate DATE NOT NULL,
    endDate Date NOT NULL,
    tenantID VARCHAR(12) NOT NULL,
    rentPerMonth INT,
    yearlyHike INT,
    agencyCommission INT
);

--- ADDING KEYS
ALTER TABLE Tenantship ADD CONSTRAINT TenantshipPropertyFK FOREIGN KEY (rentedPropertyID) REFERENCES Property(propertyID);
ALTER TABLE Tenantship ADD CONSTRAINT TenantshipPropertyUserFK FOREIGN KEY (tenantID) REFERENCES Users(aadharID);
ALTER TABLE Property ADD CONSTRAINT PropertyUsersFK FOREIGN KEY (ownerID) REFERENCES Users(aadharID);
ALTER TABLE UsersPhoneNumbers ADD CONSTRAINT UsersPhoneNumbersUsersFK FOREIGN KEY (aadharID) REFERENCES Users(aadharID);
ALTER TABLE UsersPhoneNumbers ADD CONSTRAINT UsersPhoneNumbersPK PRIMARY KEY (aadharID, phoneNumber);

