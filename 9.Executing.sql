---InsertPropertyRecord
EXEC InsertPropertyRecord(15, '987654321012', 15000, TO_DATE('2023-05-01', 'YYYY-MM-DD'), TO_DATE('2023-10-31', 'YYYY-MM-DD'), 1000, 800, 2, 2010, 'Koramangala', '123, 4th Main Road', 5, 1, 2);

---GetPropertyRecords Per Owner
EXEC GetPropertyRecords(987654321012);

---GetTenantDetails: Returns tenants of a Property
EXEC GetTenantDetails(3);
EXEC GetTenantDetails(1000);

---CreateNewUser
EXEC CreateNewUser(975310246057, 123456789012, 'johnsmith', 'password', 'John Smith', 35, 123, 560001, 'MG Road', 1, 0);
EXEC CreateNewUser(246810121416, 123456789019, 'johnsmith', 'password', 'John Smith', 35, 123, 560001, 'MG Road', 1, 0);

---SearchPropertyForRent
EXEC SearchPropertyForRent('Jayanagar'); 
EXEC SearchPropertyForRent('Koramangala'); 
EXEC SearchPropertyForRent('Hyderabad'); 

---GetRentHistory based on Property ID
EXEC GetRentHistory(3);
