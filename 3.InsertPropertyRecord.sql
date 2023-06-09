--- PROCEDURE: ADD NEW PROPERTY
--- NOTE: YOU CAN GET COLUMN TYPE USING TABLE.COLUMNE%TYPE
REM   Script: Insert Property
REM   Insert Property

CREATE OR REPLACE PROCEDURE InsertPropertyRecord (
    P_PROPERTYID IN PROPERTY.PROPERTYID%TYPE,
    P_OWNERID IN PROPERTY.OWNERID%TYPE,
    P_RENTPERMONTH IN PROPERTY.RENTPERMONTH%TYPE,
    P_AVAILABLEFROM IN PROPERTY.AVAILABLEFROM%TYPE,
    P_AVAILABLETILL IN PROPERTY.AVAILABLETILL%TYPE,
    P_TOTALAREA IN PROPERTY.TOTALAREA%TYPE,
    P_PLINTHAREA IN PROPERTY.PLINTHAREA%TYPE,
    P_NOOFFLOORS IN PROPERTY.NOOFFLOORS%TYPE,
    P_YEAROFCONSTRUCTION IN PROPERTY.YEAROFCONSTRUCTION%TYPE,
    P_LOCALITY IN PROPERTY.LOCALITY%TYPE,
    P_ADDRESS IN PROPERTY.ADDRESS%TYPE,
    P_ANNUALHIKE IN PROPERTY.ANNUALHIKE%TYPE,
    P_RESIDENTIAL IN PROPERTY.RESIDENTIAL%TYPE,
    P_NOOFBEDROOMS IN PROPERTY.NOOFBEDROOMS%TYPE
) AS
BEGIN
    EXECUTE IMMEDIATE 'ALTER SESSION SET NLS_DATE_FORMAT = ''YYYY-MM-DD''';
    INSERT INTO PROPERTY (
        PROPERTYID,
        OWNERID,
        RENTPERMONTH,
        AVAILABLEFROM,
        AVAILABLETILL,
        TOTALAREA,
        PLINTHAREA,
        NOOFFLOORS,
        YEAROFCONSTRUCTION,
        LOCALITY,
        ADDRESS,
        ANNUALHIKE,
        RESIDENTIAL,
        NOOFBEDROOMS
    ) VALUES (
        P_PROPERTYID,
        P_OWNERID,
        P_RENTPERMONTH,
        P_AVAILABLEFROM,
        P_AVAILABLETILL,
        P_TOTALAREA,
        P_PLINTHAREA,
        P_NOOFFLOORS,
        P_YEAROFCONSTRUCTION,
        P_LOCALITY,
        P_ADDRESS,
        P_ANNUALHIKE,
        P_RESIDENTIAL,
        P_NOOFBEDROOMS
    );
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error inserting data into Property table: '
            || SQLERRM);
END InsertPropertyRecord;
/

