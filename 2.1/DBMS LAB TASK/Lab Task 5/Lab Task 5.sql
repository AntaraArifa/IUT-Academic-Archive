1.

SELECT DISTINCT
C.CUSTOMER_NAME,C.CUSTOMER_CITY
FROM CUSTOMER C
JOIN BORROWER B ON
C.CUSTOMER_NAME=B.CUSTOMER_NAME
WHERE C.CUSTOMER_NAME NOT IN(
SELECT DISTINCT CUSTOMER_NAME
FROM DEPOSITOR
); 

2.

SELECT CUSTOMER_NAME
FROM CUSTOMER
WHERE CUSTOMER_NAME IN(
SELECT CUSTOMER_NAME FROM BORROWER)AND
CUSTOMER_NAME IN(SELECT CUSTOMER_NAME FROM
DEPOSITOR); 

3.

SELECT TO_CHAR(acc_opening_date, 'YYYY-MM') AS opening_month, COUNT(*) AS account_count
FROM account
GROUP BY TO_CHAR(acc_opening_date, 'YYYY-MM')
ORDER BY opening_month;

4.

SELECT MONTHS_BETWEEN(
    (
        SELECT MAX(acc_opening_date) 
        FROM account
        WHERE account_number IN
        (
            SELECT account_number
            FROM depositor 
            WHERE customer_name = 'Smith'
        )
    ), 
    (
        SELECT MAX(loan_date) 
        FROM loan 
        WHERE loan_number IN
        (
            SELECT loan_number 
            FROM borrower 
            WHERE customer_name = 'Smith'
        )
    )
) AS month 
FROM dual;


5.

SELECT B.BRANCH_NAME, AVG(L.AMOUNT) AS
AVERAGE_LOAN_AMOUNT
FROM BRANCH B
JOIN LOAN L ON B.BRANCH_NAME = L.BRANCH_NAME
WHERE B.BRANCH_CITY NOT LIKE '%HORSE%'
GROUP BY B.BRANCH_NAME;

6.

SELECT D.CUSTOMER_NAME, D.ACCOUNT_NUMBER,
A.BALANCE
FROM DEPOSITOR D
JOIN ACCOUNT A ON D.ACCOUNT_NUMBER =
A.ACCOUNT_NUMBER
WHERE A.BALANCE = (SELECT MAX(BALANCE) FROM
ACCOUNT);

7.

SELECT B.BRANCH_CITY, AVG(L.AMOUNT) AS
AVERAGE_CITY_LOAN
FROM BRANCH B
JOIN LOAN L ON B.BRANCH_NAME = L.BRANCH_NAME
GROUP BY B.BRANCH_CITY
HAVING AVG(L.AMOUNT) >= 1500; 

8.

SELECT customer_name || ' Eligible' 
AS customer_name from depositor
where account_number in
(
    select account_number from account
    where balance >=
    (
        select sum(amount) from loan
        where loan.branch_name = account.branch_name
        and loan.loan_number in
        (
            select loan_number from borrower
            where borrower.customer_name = depositor.customer_name
        )
    )
);

9.

SELECT branch_name,
       CASE 
         WHEN total_balance > (avg_balance + 500) THEN 'Elite'
         WHEN total_balance BETWEEN (avg_balance + 500) AND (avg_balance - 500) THEN 'Moderate'
         ELSE 'Poor'
       END AS branch_status
FROM (
  SELECT b.branch_name,
         SUM(a.balance) as total_balance,
         AVG(a.balance) as avg_balance
  FROM branch b
  JOIN account a ON b.branch_name = a.branch_name
  GROUP BY b.branch_name
) subquery
WHERE branch_name LIKE '%Elite%';

10.

SELECT DISTINCT B.BRANCH_NAME, B.BRANCH_CITY,
B.ASSETS
FROM BRANCH B
JOIN ACCOUNT A ON B.BRANCH_NAME =
A.BRANCH_NAME
JOIN LOAN L ON B.BRANCH_NAME = L.BRANCH_NAME
WHERE B.BRANCH_CITY IN (
 SELECT DISTINCT C.CUSTOMER_CITY
 FROM CUSTOMER C
 LEFT JOIN DEPOSITOR D ON C.CUSTOMER_NAME =
D.CUSTOMER_NAME
 LEFT JOIN BORROWER BR ON C.CUSTOMER_NAME =
BR.CUSTOMER_NAME
 WHERE D.CUSTOMER_NAME IS NULL AND
BR.CUSTOMER_NAME IS NULL
) 

11.

CREATE TABLE customer_new AS
SELECT *
FROM customer
WHERE 1 = 0;

12.

INSERT INTO customer_new
SELECT * FROM customer
where customer_name in
(
    select customer_name from depositor
)
or
customer_name in
(
    select customer_name from borrower
);


13.

ALTER TABLE customer_new
ADD Status VARCHAR2(15);

14.


15.

SELECT Status, COUNT(*) AS status_count
FROM customer_new
GROUP BY Status;
