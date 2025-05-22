create database hr_analytics;
use hr_analytics;
select * from emp_data;

#------------AVERAGE OF PERFORMANCE RATING------------
select avg(`HR_2.PerformanceRating`)Avg_PerformanceRating from emp_data;

#------------AVERAGE OF MONTHLY INCOME----------------
select avg(`HR_2.MonthlyIncome`)Avg_MonthlyIncome from emp_data;

#------------AVERAGE OF ATTRITION RATE-------------
select concat(round(avg(`Attrition Rate`)*100,2),"%")Avg_AttritionRate from emp_data;

#------------TOTAL EMPLOYEES PRESENT----------------
select COUNT(*) AS Total_Employees_Present
from emp_data
where attrition = 'No';

#------------AVG ATTRITION RATE OF ALL DEPARTMENTS------------
select department,
concat(round(avg(`attrition rate`)*100,2),"%")Avg_AttritionRate from emp_data
group by 1
order by 2;

#------------AVG HOUR RATE OF MALE RESEARCH SCIENTIST-------------
select jobrole,gender,avg(hourlyrate)Avg_HourlyRate from emp_data
where jobrole="Research Scientist" and gender="Male"
group by 1,2;

#------------AVG WORKING YRS OF DEPARTMENTS------------
select department,round(avg(`HR_2.TotalWorkingYears`),2)Avg_WorkingYrs 
from emp_data
group by 1;

#------------JOB ROLE VS WORK LIFE BALANCE-------------
select jobrole,sum(`HR_2.WorkLifeBalance`)Worklife_Balance from emp_data
group by 1;

#------------ATTRITION RATE VS YEAR SINCE LAST PROMOTION-------------
select PromotionRange,count(`Employee ID`)Emp_Count,
concat(round(count(`Attrition Rate`)/SUM(COUNT(`Attrition Rate`)) OVER ()*100,2),"%")Attr_Rate 
from emp_data
group by 1
order by 1;

#------------ATTRITION RATE VS MONTHLY INCOME-------------
select Attrition,avg(`HR_2.MonthlyIncome`)Avg_MonthlyIncome from emp_data
group by 1
order by 2 desc;


