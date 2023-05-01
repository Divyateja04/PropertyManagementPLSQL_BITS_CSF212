CREATE OR REPLACE PROCEDURE GetTenantDetails(
    P_PROP_ID IN PROPERTY.PROPERTYID%TYPE
) AS 
ROWCOUNT NUMBER;
BEGIN
    EXECUTE IMMEDIATE 'ALTER SESSION SET NLS_DATE_FORMAT = ''YYYY-MM-DD''';
    SELECT count(*) INTO ROWCOUNT FROM USERS WHERE AADHARID IN (SELECT TENANTID FROM TENANTSHIP WHERE RENTEDPROPERTYID=P_PROP_ID);
    IF ROWCOUNT > 0 THEN
        FOR CURSOR IN (SELECT * FROM USERS WHERE AADHARID IN (SELECT TENANTID FROM TENANTSHIP WHERE RENTEDPROPERTYID=P_PROP_ID))
        LOOP
            DBMS_OUTPUT.PUT_LINE('---------------------');
            DBMS_OUTPUT.PUT_LINE('Aadhar:         ' || CURSOR.AADHARID);
            DBMS_OUTPUT.PUT_LINE('Login ID:       ' || CURSOR.LOGINID);
            DBMS_OUTPUT.PUT_LINE('Login password: ' || CURSOR.LOGINPASSWORD);
            DBMS_OUTPUT.PUT_LINE('Name:           ' || CURSOR.NAME);
            DBMS_OUTPUT.PUT_LINE('Age:            ' || CURSOR.AGE);
            DBMS_OUTPUT.PUT_LINE('Door no. :      ' || CURSOR.DOORNO);
            DBMS_OUTPUT.PUT_LINE('Pincode:        ' || CURSOR.PINCODE);
            DBMS_OUTPUT.PUT_LINE('Street:         ' || CURSOR.STREET);

            IF CURSOR.ISMANAGER=0 THEN
                DBMS_OUTPUT.PUT_LINE('Is a manager: False');
            ELSE
                DBMS_OUTPUT.PUT_LINE('Is a manager: True');
            END IF;

            IF CURSOR.ISDBA=0 THEN
                DBMS_OUTPUT.PUT_LINE('Is Database admin: False');
            ELSE
                DBMS_OUTPUT.PUT_LINE('Is Database admin: True');
            END IF;

            DBMS_OUTPUT.PUT_LINE('---------------------');
        END LOOP;
    ELSE
        DBMS_OUTPUT.PUT_LINE('No such Property Found');
    END IF;
END GetTenantDetails;
/