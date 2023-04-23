CREATE PROCEDURE SearchPropertyForRent(p_locality IN VARCHAR2) AS
BEGIN
  EXECUTE IMMEDIATE 'ALTER SESSION SET NLS_DATE_FORMAT = ''YYYY-MM-DD''';
  FOR property IN (
    SELECT * FROM property WHERE property.locality=p_locality AND CURRENT_DATE BETWEEN property.availableFrom AND property.availableTill
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
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('No properties available in this city for rent: '
            || SQLERRM);
END;
/