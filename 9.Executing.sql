---InsertPropertyRecord
EXEC InsertPropertyRecord(15, '987654321012', 15000, TO_DATE('2023-05-01', 'YYYY-MM-DD'), TO_DATE('2023-10-31', 'YYYY-MM-DD'), 1000, 800, 2, 2010, 'Koramangala', '123, 4th Main Road', 5, 1, 2);

---GetPropertyRecords
EXEC GetPropertyRecords(987654321012);

---GetTenantDetails
EXEC GetTenantDetails(3);

---CreateNewUser
EXEC CreateNewUser('123456789012', 'johnsmith', 'password', 'John Smith', 35, 123, 560001, 'MG Road', 1, 0);

---SearchPropertyForRent
EXEC SearchPropertyForRent('Jayanagar'); 

---GetRentHistory
EXEC GetRentHistory(3);
