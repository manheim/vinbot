CREATE TABLE VEHICLES(
   ID INTEGER PRIMARY KEY    AUTOINCREMENT,
   YEAR              INT,
   TRIM              CHAR(50),
   MAKE              CHAR(25),
   MODEL             CHAR(25),
   ENGINE_TYPE       CHAR(25),
   TRANSMISSION      CHAR(25),
   BODY_TYPE         CHAR(25),
   VEHICLE_TYPE      CHAR(10),
   DRIVE_TRAIN       CHAR(10),
   INTERIOR_COLORS   BLOB,
   EXTERIOR_COLORS   BLOB,
   SQUISHVIN         CHAR(10)
);