
CRUD
    insert: create data
    select: read data
    update: update a table's data
    delete: delete a table's data

INSERT INTO TABLE
    insert into <table> (column 1, 2, 3, etc...) Values
    (value_column1, value_column2, value_column3, etc...)
    (repeat for however many rows...);

SELECTING DATA
  -- selects the columns to retrieve data from
    ex: select column1, column2,...
        from <table>
    
FILTERING
  --"where" specifies conditions to be met for rows to be included
  --"and" used within a where clause that adds additional conditions that 
  -- must be true in order to execute'
    ex: select col1, col2,...
        from <table>
        where first_condition and additional_conditions

WILDCARDS
  --wildcards are used with the LIKE operator to search for patterns in STRING DATA
    ex: select *
        from actor
        where last_name LIKE 'Will%';
        -- this % wildcard finds all actors whose last name start with the characters 'Will' so
        -- possible results could be 'Will', 'Willa', 'Willows', etc...
    ex: SELECT *
        FROM actor
        WHERE first_name LIKE '_an';
        -- the wildcard '_' represents searching for only ONE character. In this example,
        -- we are searching for 3 total characters. The first character '_' could be anything
        -- and then we are searching for characters 'a' & character 'n'.
        -- so possible results returned could be 'Ian', 'Dan', 'Jan'

JOINS
    'inner join' 
    -- returns matching rows from two tables
    ex: select a.first_name, b.department_name
        from employees a
        inner join departments b
        on a.department_id = b.department_id;
        -- this retrieves employees' first names and their corresponding dept names, but
        -- only for employees who have a matching 'department_id' in both tables
    'left join' 
    -- returns all rows from the left table and matching rows from the right table
    -- if there is no match, show 'null' for the right table's columns
    ex: select a.first_name, b.department_name
        from employees a
        left join departments b
        on a.department_id = b.department_id 
        -- this retrieves all employee's first names and their corresponding dept names, if
        -- an employee doesn not belong to any dept, the dept name will be 'null'
    'right join' 
    -- returns all rows from the right table and matching rows from the left table
    -- if there's no match, show 'null' for the left tables columns
    ex: select a.first_name, b.department_name
        from employees a 
        right join departments b
        on a.department_id = b.department_id;
    'cross join'
    -- combines every row from the first table with every row from the second table
    ex: select a.first_name, b.department_name 
        from employees a 
        cross join departments b;
        -- this retrieves a combination of every employee's first name with every dept name.
        -- if the 'employees' table has 10 rows and the 'departments' table has 5 rows, the
        -- result will have 10 * 5 = 50 rows
    'full outer join'
    -- returns all rows from both tables, and where there is no match, show 'null' for the 
    -- missing values
    ex: select a.first_name, b.department_name
        from employees a 
        full outer join departments b
        on a.department_id = b.department_id;
        -- this retrieves all employees' first names and their corresponding dept names. If
        -- an employee does not belong to any dept, the dept name will be 'null'. if a dept
        -- has no employees, the first name will be 'null'