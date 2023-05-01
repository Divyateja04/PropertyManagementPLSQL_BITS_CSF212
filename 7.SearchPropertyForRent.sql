CREATE OR REPLACE PROCEDURE SearchPropertyForRent(p_locality IN VARCHAR2) AS
ROWCOUNT NUMBER;
BEGIN
  EXECUTE IMMEDIATE 'ALTER SESSION SET NLS_DATE_FORMAT = ''YYYY-MM-DD''';
  SELECT count(*) INTO ROWCOUNT FROM PROPERTY WHERE PROPERTY.locality=p_locality AND CURRENT_DATE BETWEEN PROPERTY.availableFrom AND PROPERTY.availableTill;
  IF ROWCOUNT > 0 THEN
    FOR property IN (
      SELECT * FROM PROPERTY WHERE PROPERTY.locality=p_locality AND CURRENT_DATE BETWEEN PROPERTY.availableFrom AND PROPERTY.availableTill
    )
    LOOP
      DBMS_OUTPUT.PUT_LINE('Property ID:        ' || property.propertyID);
      DBMS_OUTPUT.PUT_LINE('owner ID:           ' || property.ownerID);
      DBMS_OUTPUT.PUT_LINE('rentPerMonth:       ' || property.rentPerMonth);
      DBMS_OUTPUT.PUT_LINE('availableFrom:      ' || property.availableFrom);
      DBMS_OUTPUT.PUT_LINE('availableTill:      ' || property.availableTill);
      DBMS_OUTPUT.PUT_LINE('totalArea:          ' || property.totalArea);
      DBMS_OUTPUT.PUT_LINE('plinthArea:         ' || property.plinthArea);
      DBMS_OUTPUT.PUT_LINE('noOfFloors:         ' || property.noOfFloors);
      DBMS_OUTPUT.PUT_LINE('yearOfConstruction: ' || property.yearOfConstruction);
      DBMS_OUTPUT.PUT_LINE('locality:           ' || property.locality);
      DBMS_OUTPUT.PUT_LINE('address:            ' || property.address);
      DBMS_OUTPUT.PUT_LINE('annualHike:         ' || property.annualHike);
      DBMS_OUTPUT.PUT_LINE('noOfBedrooms:       ' || property.noOfBedrooms);
      DBMS_OUTPUT.PUT_LINE('residential:        ' || property.residential);
      DBMS_OUTPUT.NEW_LINE;
    END LOOP;
  ELSE
    DBMS_OUTPUT.PUT_LINE('No Available Property Found');
  END IF;
END;
/