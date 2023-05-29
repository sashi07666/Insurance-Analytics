use insurance;

select * from insurance;

-- KPI-1

select credit_history, sum(applicant_income) as Total_Income, loan_status
from insurance
group by credit_history, loan_status;

-- KPI-2

select count(applicant_income) as No_of_Applicant, gender, loan_status
from insurance
where marrital_status = 'married'
group by gender, loan_status
order by No_of_Applicant desc;

-- KPI-3

select maturity_term, sum(premium_amount) as Total_Premium
from insurance
where gender = 'male' and marrital_status = 'married'
group by maturity_term
order by maturity_term;

-- KPI-4

select dependents, sum(premium_amount) as Total_Premium, sum(applicant_income) as Total_Income
from insurance
group by dependents;

-- KPI-5

alter table insurance add column salary_range varchar(50);

select * from insurance;

set autocommit = 0;
set sql_safe_updates = 0;

update insurance set salary_range =
  if(applicant_income <=5000, '0-5K',
     if(applicant_income <=10000, '5-10K',
        if(applicant_income <=15000, '10-15K',
			if(applicant_income <=20000, '15-20K',
				if(applicant_income <=25000, '20-25K',
           'above 25K')))));
           
select salary_range, sum(premium_amount) as Total_Premium, count(applicant_id) as No_of_Applicant
from insurance
group by salary_range
order by Total_Premium desc;

-- KPI-6

select branch, sum(premium_amount) as Total_Premium, employment
from insurance
group by branch, employment;





