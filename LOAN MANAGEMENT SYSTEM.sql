CREATE DATABASE LOAN_MANAGEMENT_SYSTEM;
USE LOAN_MANAGEMENT_SYSTEM;

#CREATE TABLE LOANS--
CREATE TABLE LOANS(
Borrower_id INT(5) PRIMARY KEY,
ApplicationDate TEXT(20) NOT NULL,
Age INT CHECK(age <=70),
AnnualIncome INT(7) NOT NULL,
CreditScore INT(4) NOT NULL,
EmploymentStatus TEXT(4) NOT NULL,
EducationLevel TEXT(10) NOT NULL,
Experience INT(2)NOT NULL,
LoanAmount INT (10),
LoanDuration INT(3) NOT NULL,
MaritalStatus TEXT(10) NOT NULL,
NumberOfDependents INT(3) NOT NULL,
HomeOwnerShipStatus TEXT(20)NOT NULL,
MonthlyDebtPayments INT(4) NOT NULL,
NumberOfOpenCreditLines INT(2),
LoanPurpose TEXT(7) NOT NULL,
PaymentHistory INT(3),
LengthOfCreditHistory INT(5),
SavingsAccountBalance INT(10) NOT NULL,
CheckingAccountBalance INT(10),
TotalAssets INT (10) NOT NULL,
LoanApproved INT DEFAULT 0,
RiskScore INT (3));

#CREATE TABLE BORROWER--
CREATE TABLE BORROWER(
Borrower_name CHAR(20),
Status TEXT(10)NOT NULL,
loan_term INT(2),
Year INT(4),
Loan_amount INT(20)NOT NULL,
Borrower_id INT(5),
FOREIGN KEY(Borrower_id)REFERENCES LOANS(Borrower_id)
);

#CREATE TABLE ACCOUNT DETAILS--
CREATE TABLE ACCOUNT_DETAILS(
Transaction_id VARCHAR(7) PRIMARY KEY,
Transaction_type TEXT(10)NOT NULL,
FName TEXT(20),
LName TEXT(20),
Account_Balance INT(6),
Account_No INT(15) UNIQUE,
IFSC_code VARCHAR(11)UNIQUE,
CVV INT(3)UNIQUE
);

INSERT INTO account_details VALUES('TID-11','Deposit','Vikas','Patil',25000,658976534,'ICIC0000424',235);
INSERT INTO account_details VALUES('TID-12','Withdraw','Rajesh','Jadhav',50000,658998534,'ICIC0000426',432);
INSERT INTO account_details VALUES('TID-13','Deposit','Satish','Patil',25000,658978834,'ICIC0000428',354);
INSERT INTO account_details VALUES('TID-14','Withdraw','Vinod','Potdar',25000,658976532,'ICIC0000430',556);
INSERT INTO account_details VALUES('TID-15','Withdraw','Vinayak','Chavan',25000,658976994,'ICIC0000440',395);
INSERT INTO account_details VALUES('TID-16','Deposit','Jack','Willian',35000,908976979,'ICIC0000490',554);
INSERT INTO account_details VALUES('TID-17','Deposit','Ritesh','Deshmukh',55000,958976965,'ICIC0000640',213);
INSERT INTO account_details VALUES('TID-18','Deposit','Ramesh','Pawar',80000,668976912,'ICIC0000569',956);
INSERT INTO account_details VALUES('TID-19','Withdraw','Suraj','Chavan',67000,778976989,'ICIC0000987',887);
INSERT INTO account_details VALUES('TID-20','Withdraw','Abhijit','Sawant',20000,788976955,'ICIC0000342',998);
INSERT INTO account_details VALUES('TID-21','Deposit','Veer','Kole',90000,678976454,'ICIC0000980',365);
INSERT INTO account_details VALUES('TID-22','Withdraw','Arnav','Chavre',75000,655576994,'ICIC0000866',333);
INSERT INTO account_details VALUES('TID-23','Deposit','Shubham','Yeldare',87000,888976994,'ICIC000655',355);
INSERT INTO account_details VALUES('TID-24','Deposit','Sarth','Shetthi',23000,645976994,'ICIC0000475',665);
INSERT INTO account_details VALUES('TID-25','Withdraw','Sonam','Sawant',25000,657676994,'ICIC0000480',897);
INSERT INTO account_details VALUES('TID-26','Withdraw','Monali','Shingare',54000,958976994,'ICIC0000554',321);
INSERT INTO account_details VALUES('TID-27','Deposit','Pallavi','Gove',28000,658967994,'ICIC0000598',856);
INSERT INTO account_details VALUES('TID-28','Deposit','Janhavi','Khilare',65000,65897695,'ICIC0000423',810);
INSERT INTO account_details VALUES('TID-29','Deposit','Amol','Lachyan',29000,658976933,'ICIC0000380',123);
INSERT INTO account_details VALUES('TID-30','Deposit','Sagar','Shinde',85000,658924994,'ICIC0000876',345);
INSERT INTO account_details VALUES('TID-31','Withdraw','Rudra','Dethe',66000,958976997,'ICIC0000450',567);
INSERT INTO account_details VALUES('TID-32','Withdraw','Kiran','Joshi',775000,854476994,'ICIC0000560',990);
INSERT INTO account_details VALUES('TID-33','Deposit','Lucky','Gore',25000,808976980,'ICIC0000550',777);
INSERT INTO account_details VALUES('TID-34','Deposit','Sidharth','Patil',35000,858976990,'ICIC0000644',134);
INSERT INTO account_details VALUES('TID-35','Deposit','Mack','Patil',85000,888976988,'ICIC0000888',712);

SELECT * FROM LOANS;
SELECT * FROM BORROWER;
SELECT * FROM ACCOUNT_DETAILS;
DESC LOANS;
DESC BORROWER;
DESC ACCOUNT_DETAILS;
SHOW TABLES;
#1
select year,loan_amount from borrower order by loan_amount;
#2
select Borrower_id,EmploymentStatus,loanamount from loans where employmentstatus='Employed' and loanamount > 25000;
#3
select distinct CreditScore from loans;
#4
select Transaction_id,Transaction_type,Account_No from account_details where Transaction_type='Deposit' order by Account_No ASC;
#5
select * from account_details where FName='Vikas' Or LName='Patil';
#6
select * from borrower LIMIT 5;
#7
select count(*) as total_loan_users from loans;
#8
select max(Account_Balance)as Maximum_Balance,min(Account_Balance)as Minimum_Balance,avg(Account_Balance)as Average_Balance from account_details;
#9
select count(Loan_amount) from borrower where loan_term is null;
#10
select replace(Status,"Active",'Active Account') as Updated_Result from borrower;
#11
select max(LoanAmount) as Second_Maximum from loans
where LoanAmount!=(select max(LoanAmount)from loans);
#12
select EmploymentStatus,count(Borrower_id) as Count_Of_Loan_Users from loans group by EmploymentStatus;
#13
select concat(FName,'-->',LName) As Full_Name from account_details;
#14
SELECT SUM(loans.LoanAmount)AS Total_Loan_Amount
FROM borrower
INNER JOIN loans ON borrower.Borrower_id=loans.Borrower_id;
#15
select loans.MaritalStatus as User_Marital_Status,borrower.Borrower_name as Borrower_name from loans
 right join borrower on loans.Borrower_id=borrower.Borrower_id;
#16
select loans.MaritalStatus as User_Marital_Status,borrower.Borrower_name as Borrower_name from loans
 left join borrower on loans.Borrower_id=borrower.Borrower_id;
#17
SELECT * from borrower as A,borrower As B
WHERE A.Status = B.Status
And A.Borrower_id <>B.Borrower_id;
#18
create view Loan_User_Details AS 
select * from account_details;
#19
select FName,LName from account_details where FName like '%sh';
#20
select distinct Status from borrower
UNION
select HomeOwnerShipStatus from loans;
#21
SELECT distinct ascii(EmploymentStatus) AS User_Status
from loans;
#22
SELECT distinct FName,LName from account_details
where FName not like 'A%'
And FName not like 'E%'
And FName not like 'I%'
And FName not like 'O%'
And FName not like 'U%';






