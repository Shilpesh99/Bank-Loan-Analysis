--Creating Database
Create Database Bank_Loan_DB;

--To view Data in table
Select * from loan_data;

--Total no. of application
Select count(id) as Total_Loan_Application from loan_data;

--Month to Date total no. of application i.e. december 2021
Select count(id) as MTD_Total_Loan_Application from loan_data
Where month(issue_date) = 12 AND year(issue_date) = 2021;

--Previous Month to Date total no. of application i.e. november 2021
Select count(id) as PMTD_Total_Loan_Application from loan_data
Where month(issue_date) = 11 AND year(issue_date) = 2021;

--Total Funded Amount
Select Sum(loan_amount) as Total_Funded_Amount from loan_data;

--Month to Date Total funded Amount
Select Sum(loan_amount) as MTD_Total_Funded_Amount from loan_data
Where month(issue_date) = 12 AND year(issue_date) = 2021;

--Previous Month to Date Total funded Amount
Select Sum(loan_amount) as PMTD_Total_Funded_Amount from loan_data
Where month(issue_date) = 11 AND year(issue_date) = 2021;

--Total Amount Received
Select sum(total_payment) as Total_Amount_Received from loan_data;

--Month to Date Total Amount Received
Select sum(total_payment) as MTD_Total_Amount_Received from loan_data
Where month(issue_date) = 12 AND year(issue_date) = 2021;

--Previous Month to Date Total Amount Received
Select sum(total_payment) as PMTD_Total_Amount_Received from loan_data
Where month(issue_date) = 11 AND year(issue_date) = 2021;

--Average Interest Rate
Select Avg(int_rate) * 100 as Avg_Interest_Rate from loan_data;

Select Round(Avg(int_rate), 4)* 100 as Avg_Interest_Rate from loan_data;

--Month To Date Average Interest Rate
Select Round(Avg(int_rate), 4)* 100 as MTD_Avg_Interest_Rate from loan_data
Where month(issue_date) = 12 AND year(issue_date) = 2021;

--Previous Month To Date Average Interest Rate
Select Round(Avg(int_rate), 4)* 100 as PMTD_Avg_Interest_Rate from loan_data
Where month(issue_date) = 11 AND year(issue_date) = 2021;

--Average Debt To Income
Select Round(AVG(dti), 4)* 100 as Avg_DTI from loan_data;

--Month to Date Average Debt To Income
Select Round(AVG(dti), 4)* 100 as MTD_Avg_DTI from loan_data
Where month(issue_date) = 12 AND year(issue_date) = 2021;

--Previous Month to Date Average Debt To Income
Select Round(AVG(dti), 4)* 100 as PMTD_Avg_DTI from loan_data
Where month(issue_date) = 11 AND year(issue_date) = 2021;

Select loan_status from loan_data;

--Good Loan Percentage
Select (count(Case When loan_status = 'Fully Paid' OR loan_status = 'Current' Then id End) * 100) /
count(id) as Good_Loan_Percentage from loan_data;

--Bad Loan Percentage
Select (count(Case When loan_status = 'Charged off' Then id End) * 100) /
count(id) as Bad_Loan_Percentage from loan_data;

--Total No. of Good Loans
Select count(id) as Total_Good_loan_App from loan_data
Where loan_status = 'Fully Paid' OR loan_status = 'Current';

--Total No. of Bad Loans
Select count(id) as Total_Bad_loan_App from loan_data
Where loan_status = 'Charged off' ;

--Good Loan Funded Amount
Select sum(loan_amount) as Good_loan_Funded_Amt from loan_data
Where loan_status = 'Fully Paid' OR loan_status = 'Current';

--Bad Loan Funded Amount
Select sum(loan_amount) as Bad_loan_Funded_Amt from loan_data
Where loan_status = 'Charged off';

--Good Loan Total Received Amount
Select sum(total_payment) as Good_loan_Received_Amt from loan_data
Where loan_status = 'Fully Paid' OR loan_status = 'Current';

--Bad Loan Total Received Amount
Select sum(total_payment) as Bad_loan_Received_Amt from loan_data
Where loan_status = 'Charged off';

--Loan Status
Select loan_status,
count(id) as Total_Loan_App,
sum(total_payment) as Total_Amount_Received,
sum(loan_amount) as Total_Funded_Amount,
AVG(int_rate) * 100 as Interest_Rate,
AVG(dti) * 100 as DTI
from loan_data group by loan_status;

--Month to Date Loan Status
Select loan_status,
sum(total_payment) as MTD_Total_Amt_Received,
sum(loan_amount) as MTD_Total_Funded_Amt
from loan_data 
where month(issue_date) = 12 AND Year(issue_date) = 2021
group by loan_status;

--Month Wise Loan Status
Select
month(issue_date) as Month_Num,
DATENAME(month, issue_date) as Month_Name,
count(id) as Total_Loan_App,
sum(loan_amount) as Total_Funded_Amount,
sum(total_payment) as Total_Received_Amount
from loan_data
group by month(issue_date), DATENAME(month, issue_date)
order by month(issue_date);

Select distinct address_state from loan_data;

Select count(distinct address_state) as State_Count from loan_data;

--State Wise Loan Status
Select
address_state,
count(id) as Total_Loan_App,
sum(loan_amount) as Total_Funded_Amount,
sum(total_payment) as Total_Received_Amount
from loan_data
group by address_state
order by count(id) desc;

--Loan Term Wise Loan Status
Select
term,
count(id) as Total_Loan_App,
sum(loan_amount) as Total_Funded_Amount,
sum(total_payment) as Total_Received_Amount
from loan_data
group by term
order by term;

--Employee Work Experience Wise Loan Status
Select
emp_length,
count(id) as Total_Loan_App,
sum(loan_amount) as Total_Funded_Amount,
sum(total_payment) as Total_Received_Amount
from loan_data
group by emp_length
order by count(id) desc;

--Purpose Wise Loan Status
Select
purpose,
count(id) as Total_Loan_App,
sum(loan_amount) as Total_Funded_Amount,
sum(total_payment) as Total_Received_Amount
from loan_data
group by purpose
order by count(id) desc;

--Home Ownership Wise Loan Status
Select
home_ownership,
count(id) as Total_Loan_App,
sum(loan_amount) as Total_Funded_Amount,
sum(total_payment) as Total_Received_Amount
from loan_data
group by home_ownership
order by count(id) desc;

