--- PROCEDURE: ADD NEW PROPERTY
--- NOTE: YOU CAN GET COLUMN TYPE USING TABLE.COLUMNE%TYPE
CREATE OR REPLACE PROCEDURE GetPropertyRecords (
    P_OWNERID IN PROPERTY.OWNERID%TYPE
) AS
BEGIN
    dbms_output.put_line('Owner ID: '|| P_OWNERID);
    FOR CURSOR IN (SELECT * FROM PROPERTY WHERE PROPERTY.OWNERID = P_OWNERID)
    LOOP
        DBMS_OUTPUT.PUT_LINE('---------------------');
        DBMS_OUTPUT.PUT_LINE('Property ID         : ' || CURSOR.PROPERTYID);
        DBMS_OUTPUT.PUT_LINE('Owner ID            : ' || CURSOR.OWNERID);
        DBMS_OUTPUT.PUT_LINE('Rent per Month      : ' || CURSOR.RENTPERMONTH);
        DBMS_OUTPUT.PUT_LINE('Available From      : ' || CURSOR.AVAILABLEFROM);
        DBMS_OUTPUT.PUT_LINE('Available Till      : ' || CURSOR.AVAILABLETILL);
        DBMS_OUTPUT.PUT_LINE('Total Area          : ' || CURSOR.TOTALAREA);
        DBMS_OUTPUT.PUT_LINE('Plinth Area         : ' || CURSOR.PLINTHAREA);
        DBMS_OUTPUT.PUT_LINE('No. of floors       : ' || CURSOR.NOOFFLOORS);
        DBMS_OUTPUT.PUT_LINE('Year of Construction: ' || CURSOR.YEAROFCONSTRUCTION);
        DBMS_OUTPUT.PUT_LINE('Locality            : ' || CURSOR.LOCALITY);
        DBMS_OUTPUT.PUT_LINE('Address             : ' || CURSOR.ADDRESS);
        DBMS_OUTPUT.PUT_LINE('Annual Hike         : ' || CURSOR.ANNUALHIKE);
        DBMS_OUTPUT.PUT_LINE('Residential         : ' || CURSOR.RESIDENTIAL);
        DBMS_OUTPUT.PUT_LINE('No. of Bedroom      : ' || CURSOR.NOOFBEDROOM);
        DBMS_OUTPUT.PUT_LINE('---------------------');
    END LOOP;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error getting property records for given owner id: '
            || SQLERRM);
END InsertPropertyRecord;