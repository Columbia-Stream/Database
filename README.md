This repository contains SQL scripts for setting up a database schema. The database, named Project_SQL, manages user accounts and video uploads.

**Database Structure**
The database consists of two main tables: Users Table and Video_DB Table.

**Usage Notes**
1. Ensure that the Users table is populated with valid UNI values before inserting records into the Video_DB table, as the foreign key constraint requires a valid professor_uni.
2. The email must be in the format UNI@columbia.edu.
3. The role column in the Users table is restricted to 'Student' or 'Faculty' to maintain data integrity.
4. The uploaded_at column in Video_DB automatically records the timestamp of video uploads.

