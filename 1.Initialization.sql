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

--- ADDING FAKE DATA
INSERT INTO Property(propertyID,ownerID,rentPerMonth,availableFrom,availableTill,totalArea,plinthArea,noOfFloors,yearOfConstruction,locality,address,annualHike,residential,noOfBedrooms) VALUES (1,100010001001,50000,2023-04-01,2024-03-31,1200,1000,2,2015,"Sarjapur Road","123 Main Street",5,1,3);
INSERT INTO Property(propertyID,ownerID,rentPerMonth,availableFrom,availableTill,totalArea,plinthArea,noOfFloors,yearOfConstruction,locality,address,annualHike,residential,noOfBedrooms) VALUES (2,100010002002,70000,2023-05-01,2024-04-30,1500,1200,1,2010,"Whitefield","456 Broad Street",7,1,4);
INSERT INTO Property(propertyID,ownerID,rentPerMonth,availableFrom,availableTill,totalArea,plinthArea,noOfFloors,yearOfConstruction,locality,address,annualHike,residential,noOfBedrooms) VALUES (3,100010003003,100000,2023-06-01,2024-05-31,2000,1800,3,2018,"Indiranagar","789 Fifth Avenue",10,1,5);
INSERT INTO Property(propertyID,ownerID,rentPerMonth,availableFrom,availableTill,totalArea,plinthArea,noOfFloors,yearOfConstruction,locality,address,annualHike,residential,noOfBedrooms) VALUES (4,100010004004,25000,2023-04-15,2024-04-14,800,700,2,2005,"JP Nagar","456 Sixth Street",2,1,2);
INSERT INTO Property(propertyID,ownerID,rentPerMonth,availableFrom,availableTill,totalArea,plinthArea,noOfFloors,yearOfConstruction,locality,address,annualHike,residential,noOfBedrooms) VALUES (5,100010005005,45000,2023-07-01,2024-06-30,1100,900,1,2012,"Marathahalli","789 Seventh Avenue",5,1,3);

INSERT INTO Users VALUES (100010001001,password1,John Doe,35,1234,560001,"Main Street",0,0);
INSERT INTO Users VALUES (100010002002,password2,Jane Smith,28,5678,560002,"Broad Street",0,0);
INSERT INTO Users VALUES (100010003003,password3,Bob Johnson,45,9101,560003,"Fifth Avenue",0,0);
INSERT INTO Users VALUES (100010004004,password4,Alice Williams,23,1112,560004,"Sixth Street",0,0);
INSERT INTO Users VALUES (100010005005,password5,David Brown,31,1314,560005,"Seventh Avenue",0,0);

INSERT INTO UsersPhoneNumbers VALUES (100010001001,9876543210);
INSERT INTO UsersPhoneNumbers VALUES (100010001001,8765432109);
INSERT INTO UsersPhoneNumbers VALUES (100010002002,7654321098);
INSERT INTO UsersPhoneNumbers VALUES (100010003003,6543210987);
INSERT INTO UsersPhoneNumbers VALUES (100010003003,5432109876);
INSERT INTO UsersPhoneNumbers VALUES (100010003003,4321098765);
INSERT INTO UsersPhoneNumbers VALUES (100010004004,3210987654);
INSERT INTO UsersPhoneNumbers VALUES (100010005005,2109876543);

INSERT INTO Tenantship VALUES (1,2023-04-15,2024-04-14,100010002002,50000,3,1000)
INSERT INTO Tenantship VALUES (2,2023-05-01,2024-04-30,100010005005,70000,5,1500)
INSERT INTO Tenantship VALUES (3,2023-06-01,2024-05-31,100010004004,100000,10,2000)
INSERT INTO Tenantship VALUES (4,2023-04-30,2024-04-29,100010001001,25000,2,500)
INSERT INTO Tenantship VALUES (5,2023-07-01,2024-06-30,100010003003,45000,4,1000)


--- ADDING KEYS
ALTER TABLE Tenantship ADD CONSTRAINT TenantshipPropertyFK FOREIGN KEY (rentedPropertyID) REFERENCES Property(propertyID);
ALTER TABLE Tenantship ADD CONSTRAINT TenantshipPropertyUserFK FOREIGN KEY (tenantID) REFERENCES Users(aadharID);
ALTER TABLE Property ADD CONSTRAINT PropertyUsersFK FOREIGN KEY (ownerID) REFERENCES Users(aadharID);
ALTER TABLE UsersPhoneNumbers ADD CONSTRAINT UsersPhoneNumbersUsersFK FOREIGN KEY (aadharID) REFERENCES Users(aadharID);
ALTER TABLE UsersPhoneNumbers ADD CONSTRAINT UsersPhoneNumbersPK PRIMARY KEY (aadharID, phoneNumber);

--- Procedure for adding a new user
CREATE OR REPLACE PROCEDURE createNewUser(aadharID IN varchar2, password IN varchar2, name IN varchar2, age IN number, doorNo IN number,  pinCode IN number, street IN varchar2) AS
BEGIN
INSERT INTO Users VALUES (aadharID, password, name, age, doorNo, pinCode, street, 0, 0);
END;
/

CREATE OR REPLACE PROCEDURE addPhoneNumber(aadharID IN varchar2, phoneNumber IN varchar2) AS
BEGIN
INSERT INTO UsersPhoneNumbers VALUES (aadharID, phoneNumber);
END;
/
---Generic Procedures
---Adding data to the users table
CREATE OR REPLACE PROCEDURE Insert_Property (
    p_propertyID IN Property.propertyID%TYPE,
    p_ownerID IN Property.ownerID%TYPE,
    p_rentPerMonth IN Property.rentPerMonth%TYPE,
    p_availableFrom IN Property.availableFrom%TYPE,
    p_availableTill IN Property.availableTill%TYPE,
    p_totalArea IN Property.totalArea%TYPE,
    p_plinthArea IN Property.plinthArea%TYPE,
    p_noOfFloors IN Property.noOfFloors%TYPE,
    p_yearOfConstruction IN Property.yearOfConstruction%TYPE,
    p_locality IN Property.locality%TYPE,
    p_address IN Property.address%TYPE,
    p_annualHike IN Property.annualHike%TYPE,
    p_residential IN Property.residential%TYPE,
    p_noOfBedrooms IN Property.noOfBedrooms%TYPE
) AS
BEGIN
    INSERT INTO Property (
        propertyID,
        ownerID,
        rentPerMonth,
        availableFrom,
        availableTill,
        totalArea,
        plinthArea,
        noOfFloors,
        yearOfConstruction,
        locality,
        address,
        annualHike,
        residential,
        noOfBedrooms
    ) VALUES (
        p_propertyID,
        p_ownerID,
        p_rentPerMonth,
        p_availableFrom,
        p_availableTill,
        p_totalArea,
        p_plinthArea,
        p_noOfFloors,
        p_yearOfConstruction,
        p_locality,
        p_address,
        p_annualHike,
        p_residential,
        p_noOfBedrooms
    );
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error inserting data into Property table: ' || SQLERRM);
END Insert_Property;
/

---CREATING USERS
---DBA
CREATE USER dba_user IDENTIFIED BY dba_user;
GRANT CREATE SESSION, CREATE PROCEDURE TO dba_user;

---Adding user to the database by DBA with necessary privileges.
CREATE OR REPLACE PROCEDURE add_user(
    p_aadhar_id IN Users.aadharID%TYPE,
    p_login_id IN Users.loginID%TYPE,
    p_login_password IN Users.loginPassword%TYPE,
    p_name IN Users.name%TYPE,
    p_age IN Users.age%TYPE,
    p_door_no IN Users.doorNo%TYPE,
    p_pin_code IN Users.pinCode%TYPE,
    p_street IN Users.street%TYPE,
    p_is_manager IN Users.isManager%TYPE DEFAULT 0,
    p_is_dba IN Users.isDBA%TYPE DEFAULT 0
)
AUTHID CURRENT_USER
IS
BEGIN
    -- check if current user has necessary privileges
    IF NOT (USER = 'DBA' AND p_is_dba = 1) THEN
        RAISE_APPLICATION_ERROR(-20001, 'Only a DBA can execute this procedure.');
    END IF;
    
    -- insert user data into Users table
    INSERT INTO Users(aadharID, loginID, loginPassword, name, age, doorNo, pinCode, street, isManager, isDBA)
    VALUES(p_aadhar_id, p_login_id, p_login_password, p_name, p_age, p_door_no, p_pin_code, p_street, p_is_manager, p_is_dba);
END;
/


