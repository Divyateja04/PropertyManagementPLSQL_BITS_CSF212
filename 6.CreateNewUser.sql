REM   Script: Create User
REM   Create User

CREATE OR REPLACE PROCEDURE CREATENEWUSER(
    CURRENT_USERID IN USERS.LOGINID%TYPE,
    P_AADHAR_ID IN USERS.AADHARID%TYPE,
    P_LOGIN_ID IN USERS.LOGINID%TYPE,
    P_LOGIN_PASSWORD IN USERS.LOGINPASSWORD%TYPE,
    P_NAME IN USERS.NAME%TYPE,
    P_AGE IN USERS.AGE%TYPE,
    P_DOOR_NO IN USERS.DOORNO%TYPE,
    P_PIN_CODE IN USERS.PINCODE%TYPE,
    P_STREET IN USERS.STREET%TYPE,
    P_IS_MANAGER IN USERS.ISMANAGER%TYPE DEFAULT 0,
    P_IS_DBA IN USERS.ISDBA%TYPE DEFAULT 0
) AS
    CHECKDBASTATUS NUMBER;
BEGIN
    EXECUTE IMMEDIATE 'ALTER SESSION SET NLS_DATE_FORMAT = ''YYYY-MM-DD''';
    SELECT
        USERS.ISDBA INTO CHECKDBASTATUS
    FROM
        USERS
    WHERE
        USERS.LOGINID = CURRENT_USERID;
    
    IF CHECKDBASTATUS = 1 THEN
        -- insert user data into Users table
        INSERT INTO USERS(
            AADHARID,
            LOGINID,
            LOGINPASSWORD,
            NAME,
            AGE,
            DOORNO,
            PINCODE,
            STREET,
            ISMANAGER,
            ISDBA
        ) VALUES(
            P_AADHAR_ID,
            P_LOGIN_ID,
            P_LOGIN_PASSWORD,
            P_NAME,
            P_AGE,
            P_DOOR_NO,
            P_PIN_CODE,
            P_STREET,
            P_IS_MANAGER,
            P_IS_DBA
        );
    ELSE 
        DBMS_OUTPUT.PUT_LINE('You are not permitted to insert a user since you are not a DBA');
    END IF;
    END;
/

CREATE OR REPLACE PROCEDURE ADDPHONENUMBER(
    AADHARID IN USERSPHONENUMBERS.AADHARID%TYPE,
    PHONENUMBER IN USERSPHONENUMBERS.PHONENUMBER%TYPE
) AS
BEGIN
    INSERT INTO USERSPHONENUMBERS VALUES (
        AADHARID,
        PHONENUMBER
    );
END;
/