This repository contains SQL scripts for setting up Authentication Database and Upload Videos Database. 

**Databases Structure**

The Authentication Database is composed of one core table: Users.
The Upload Videos Database is composed of four core tables: Courses, CourseOfferings, CourseInstructors, Videos.

**Usage Notes**
1. The email must be in the format UNI@columbia.edu.
2. The role column in the Users table is restricted to 'Student' or 'Faculty' to maintain data integrity.
3. The Upload Videos Database is stored under the name microservice-upload-db.
4. The Authentication Database is stored under the name mysql-vm Users db.

