/* ----------------------------------------------------------
1. CREATE TABLE STRUCTURE
----------------------------------------------------------- */
CREATE TABLE Books (
    ISBN        VARCHAR(10),
    Title       VARCHAR(30),
    PubDate     DATE,
    PubID       NUMERIC(2),
    Cost        NUMERIC(5,2),
    Retail      NUMERIC(5,2),
    Discount    NUMERIC(4,2),
    Category    VARCHAR(12)
);

/* ----------------------------------------------------------
2. INSERT DATA (Including NULLs for Data-Quality Checks)
----------------------------------------------------------- */
INSERT INTO Books VALUES 
('1059831198','BODYBUILD IN 10 MINUTES A DAY','2005-01-21',4,18.75,30.95, NULL, 'FITNESS'),
('0401140733','REVENGE OF MICKEY','2005-12-14',1,14.20,22.00, NULL, 'FAMILY LIFE'),
('4981341710','BUILDING A CAR WITH TOOTHPICKS','2006-03-18',2,37.80,59.95, 3.00, 'CHILDREN'),
('8843172113','DATABASE IMPLEMENTATION','2003-06-04',3,31.40,55.95, NULL, 'COMPUTER'),
('3437212490','COOKING WITH MUSHROOMS','2004-02-28',4,12.50,19.95, NULL, 'COOKING'),
('3957136468','HOLY GRAIL OF ORACLE','2005-12-31',3,47.25,75.95, 3.80, 'COMPUTER'),
('1915762492','HANDCRANKED COMPUTERS','2005-01-21',3,21.80,25.00, NULL, 'COMPUTER'),
('9959789321','E-BUSINESS THE EASY WAY','2006-03-01',2,37.90,54.50, NULL, 'COMPUTER'),
('2491748320','PAINLESS CHILD-REARING','2004-07-17',5,48.00,89.95, 4.50, 'FAMILY LIFE'),
('0299282519','THE WOK WAY TO COOK','2004-09-11',4,19.00,28.75, NULL, 'COOKING'),
('8117949391','BIG BEAR AND LITTLE DOVE','2005-11-08',5,5.32,8.95, NULL, 'CHILDREN'),
('0132149871','HOW TO GET FASTER PIZZA','2006-11-11',4,17.85,29.95, 1.50, 'SELF HELP'),
('9247381001','HOW TO MANAGE THE MANAGER','2003-05-09',1,15.40,31.95, NULL, 'BUSINESS'),
('2147428890','SHORTEST POEMS','2005-05-01',5,21.85,39.95, NULL, 'LITERATURE');

/* ----------------------------------------------------------
3. DETECT MISSING VALUES
----------------------------------------------------------- */

/* 3.1 Identify rows with ANY NULL field */
SELECT *
FROM Books
WHERE ISBN IS NULL OR Title IS NULL OR PubDate IS NULL OR PubID IS NULL
   OR Cost IS NULL OR Retail IS NULL OR Discount IS NULL OR Category IS NULL;

/* 3.2 Identify missing values in Discount column */
SELECT *
FROM Books
WHERE Discount IS NULL;

/* 3.3 Count missing values per column */
SELECT 
    SUM(CASE WHEN ISBN     IS NULL THEN 1 ELSE 0 END) AS Missing_ISBN,
    SUM(CASE WHEN Title    IS NULL THEN 1 ELSE 0 END) AS Missing_Title,
    SUM(CASE WHEN PubDate  IS NULL THEN 1 ELSE 0 END) AS Missing_PubDate,
    SUM(CASE WHEN PubID    IS NULL THEN 1 ELSE 0 END) AS Missing_PubID,
    SUM(CASE WHEN Cost     IS NULL THEN 1 ELSE 0 END) AS Missing_Cost,
    SUM(CASE WHEN Retail   IS NULL THEN 1 ELSE 0 END) AS Missing_Retail,
    SUM(CASE WHEN Discount IS NULL THEN 1 ELSE 0 END) AS Missing_Discount,
    SUM(CASE WHEN Category IS NULL THEN 1 ELSE 0 END) AS Missing_Category
FROM Books;

/* ----------------------------------------------------------
4. BASIC DATA RETRIEVAL & FILTERING
----------------------------------------------------------- */

/* 4.1 Retrieve all books */
SELECT * FROM Books;

/* 4.2 Compute derived value (Cost × 1.20) */
SELECT 
    ISBN,
    Title,
    Cost,
    Cost * 1.20 AS MarkupPrice
FROM Books;

/* 4.3 Filter by cost threshold */
SELECT *
FROM Books
WHERE Cost >= 20;

/* 4.4 Combine conditions with AND */
SELECT *
FROM Books
WHERE Cost >= 20 AND Discount >= 2;

/* 4.5 Combine conditions with OR */
SELECT *
FROM Books
WHERE Cost >= 40 OR Discount >= 3;

/* 4.6 Exclude specific values */
SELECT *
FROM Books
WHERE Cost <> 19.00;

/* ----------------------------------------------------------
5. AGGREGATION & GROUPING
----------------------------------------------------------- */

/* 5.1 Minimum cost */
SELECT MIN(Cost) AS MinCost
FROM Books;

/* 5.2 Multiple aggregations */
SELECT 
    MIN(Cost) AS MinCost,
    MAX(Discount) AS MaxDiscount
FROM Books;

/* 5.3 Group by Category (Min cost per category) */
SELECT 
    Category,
    MIN(Cost) AS MinCost
FROM Books
GROUP BY Category;

/* 5.4 Filtered grouping (Discount > threshold) */
SELECT 
    Category,
    MIN(Cost) AS MinCost
FROM Books
WHERE Discount > 2
GROUP BY Category;

/* 5.5 Group by Category AND Title */
SELECT 
    Category,
    Title,
    MIN(Cost) AS MinCost,
    MAX(Retail) AS MaxRetail
FROM Books
GROUP BY Category, Title;

/* ----------------------------------------------------------
6. ADDITIONAL PRACTICAL FILTERS
----------------------------------------------------------- */

/* 6.1 Price range check for Retail */
SELECT 
    MIN(Retail) AS MinRetail,
    MAX(Retail) AS MaxRetail
FROM Books;

/* 6.2 Retail > 2× Cost */
SELECT *
FROM Books
WHERE Retail > (Cost * 2);
