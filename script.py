from faker import Faker
from random import randint

NUMBER_OF_SAMPLES = 10

print("""--- ADDING FAKE DATA
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';\n\n""")


fake = Faker()
Faker.seed(69)
# Property
for i in range(1, NUMBER_OF_SAMPLES):
    l = []
    l.append(i)  # property id
    l.append(fake.ssn())  # owner id
    l.append(randint(1, 30)*1000)  # rent per month
    l.append(fake.date_between(start_date='-5y',
             end_date='today').__str__())  # available from
    l.append(fake.date_between(start_date='today',
             end_date='+5y').__str__())  # available till
    l.append(fake.random_int(min=1, max=30)*100)  # total area
    l.append(fake.random_int(min=1, max=30)*100)  # plinth area
    l.append(fake.random_int(min=1, max=10))  # no of floors
    # year of construciton
    l.append(fake.date_between(start_date='-10y', end_date='-5y').year)
    address = fake.address().split('\n')
    l.append(address[0])  # locality
    l.append(address[1])  # address
    l.append(fake.random_int(min=1, max=10))  # annual hike
    l.append(1 if fake.pybool() else 0)  # residential
    l.append(fake.random_int(min=1, max=4))  # no of bedroomsprint(l)
    print(
        f"INSERT INTO PROPERTY (PROPERTYID, OWNERID, RENTPERMONTH, AVAILABLEFROM, AVAILABLETILL, TOTALAREA, PLINTHAREA, NOOFFLOORS, YEAROFCONSTRUCTION, LOCALITY, ADDRESS, ANNUALHIKE, RESIDENTIAL, NOOFBEDROOMS) VALUES {tuple(l)};")
print()

fake = Faker()
Faker.seed(69)
# Users
for i in range(1, NUMBER_OF_SAMPLES):
    l = []
    l.append(fake.numerify(text="##########"))  # aadhar
    l.append(fake.user_name())  # login id
    l.append(fake.password())  # login password
    l.append(fake.name())  # name
    l.append(fake.random_int(min=18, max=65))  # age
    l.append(fake.building_number())  # doorno
    l.append(fake.zipcode())  # pincode
    l.append(fake.random_int(min=100000, max=900000))  # street
    l.append(fake.street_address())  # address
    l.append(1 if fake.pybool() else 0)  # is manager
    l.append(1 if fake.pybool() else 0)  # isdba
    print(
        f"INSERT INTO USERS (AADHARID, LOGINID, LOGINPASSWORD, NAME, AGE, DOORNO, PINCODE, STREET, ISMANAGER, ISDBA) VALUES {tuple(l)};")
print()

fake = Faker()
Faker.seed(69)
# User phone numbers
for i in range(1, NUMBER_OF_SAMPLES):
    l = []
    l.append(fake.numerify(text="##########"))  # aadhar
    l.append(fake.numerify(text="+91 ####-######"))  # phone number
    print(
        f"INSERT INTO USERSPHONENUMBERS (AADHARID, PHONENUMBER) VALUES {tuple(l)};")
print()

fake = Faker()
Faker.seed(69)
# Tenantship
for i in range(1, NUMBER_OF_SAMPLES):
    l = []
    l.append(i)  # RENTEDPROPERTYID
    l.append(fake.date_between(start_date='-5y',
             end_date='today').__str__())  # STARTDATE
    l.append(fake.date_between(start_date='today',
             end_date='+5y').__str__())  # ENDDATE
    l.append(fake.numerify(text="##########"))  # tenant id
    l.append(fake.random_int(min=1, max=30)*1000)  # rent per month
    l.append(fake.random_int(min=1, max=9))  # yearly like hike
    l.append(fake.random_int(min=1, max=9))  # yearly like hike
    print(
        f"INSERT INTO TENANTSHIP (RENTEDPROPERTYID, STARTDATE, ENDDATE, TENANTID, RENTPERMONTH, YEARLYHIKE, AGENCYCOMMISSION) VALUES {tuple(l)};")
print()

print("""\n--- ADDING KEYS
ALTER TABLE TENANTSHIP ADD CONSTRAINT TENANTSHIPPROPERTYFK FOREIGN KEY (RENTEDPROPERTYID) REFERENCES PROPERTY(PROPERTYID);

ALTER TABLE TENANTSHIP ADD CONSTRAINT TENANTSHIPPROPERTYUSERFK FOREIGN KEY (TENANTID) REFERENCES USERS(AADHARID);

ALTER TABLE PROPERTY ADD CONSTRAINT PROPERTYUSERSFK FOREIGN KEY (OWNERID) REFERENCES USERS(AADHARID);

ALTER TABLE USERSPHONENUMBERS ADD CONSTRAINT USERSPHONENUMBERSUSERSFK FOREIGN KEY (AADHARID) REFERENCES USERS(AADHARID);

ALTER TABLE USERSPHONENUMBERS ADD CONSTRAINT USERSPHONENUMBERSPK PRIMARY KEY (AADHARID, PHONENUMBER);""")