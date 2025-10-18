This repository contains SQL script for setting up a database schema. The database, named Columbia Stream Schema, manages courses, course offerings, users, instructors, and associated video content.

**Database Structure**

The database schema is composed of five core tables: Courses, CourseOfferings, CourseInstructors, Users, and Videos.

**Usage Notes**
1. The email must be in the format UNI@columbia.edu.
2. Deleting a course will automatically delete related course offerings, instructors, and videos (due to cascade deletes).
3. Deleting a faculty member will set their uploaded videos’ prof_uni to NULL but not remove the videos.
4. The role column in the Users table is restricted to 'Student' or 'Faculty' to maintain data integrity.

