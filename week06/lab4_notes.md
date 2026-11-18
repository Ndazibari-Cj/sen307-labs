# SEN307 Lab 4 / Week 6 Practical Notes
Name: Ndazibari Charles Joshua  
Matric Number: VUG/SEN/24/12074  

### 1. What error did you get in Part 4?
When I tried to delete the temporary "Library and Information Science" department while a student was still registered under it, MySQL threw **Error Code: 1451** (foreign key constraint failure).

### 2. Why does MySQL refuse?
MySQL blocks this to protect the database's referential integrity. If it allowed the department to be deleted while a student was still tied to it, that student record would become an "orphan". meaning it would point to a department ID that doesn't exist anymore.

### 3. How did you fix it?
I fixed it by reassigning the student first. I ran an `UPDATE` statement to move the student over to the Software Engineering department, and then ran the `DELETE` command on the Library and Information Science department once no students were left in it.

### 4. What other fix could you have used?
Another way to handle it would have been to delete the student record from the `Student` table first before deleting the department. Alternatively, if we had set up the foreign key with `ON DELETE CASCADE` or `ON DELETE SET NULL` when creating the table, MySQL could have handled the cleanup automatically.