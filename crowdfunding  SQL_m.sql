use crowdfunding;

###################################### EPOCH TIME #####################################################   1
Select
    date(FROM_UNIXTIME(created_at)) AS created_date,
    date(FROM_UNIXTIME(deadline)) AS deadline_date,
    date(FROM_UNIXTIME(launched_at)) AS launched_date,
    date(FROM_UNIXTIME(state_changed_at)) AS state_changed_date
From projects;

########################################## GOAL AMOUNT #################################################  4
Select  ProjectID,goal,ROUND(goal * 1, 2) as goal_usd
From projects;

########################################### Total Number of Projects based on outcome ################################################### 5a
 
 select state, count(*) as Total_Project from projects
 group by state 
 order by Total_Project desc;
 
 ########################################### Total Number of Projects based on Locations ################################################### 5b

select l.country, count(*) as total_project 
from projects p join location_table l on p.location_id = l.id
group by l.country
order by total_project desc; 

########################################### Total Number of Projects based on category ################################################### 5c

select c.name, count(*) as total_project
from projects p join category_table c on p.category_id = c.id
group by c.name
order by total_project desc;

########################################### Total Number of Projects created by year, month and Quarter ################################################### 5d

SELECT
    YEAR(FROM_UNIXTIME(created_at)) AS project_year,
    MONTH(FROM_UNIXTIME(created_at)) AS project_month,
    QUARTER(FROM_UNIXTIME(created_at)) AS project_quarter,
    COUNT(*) AS total_projects
FROM
    projects
GROUP BY
    project_year,
    project_month,
    project_quarter
ORDER BY
    project_year,
    project_month;

###########################################  SUCCESSFUL PROJECT BASED ON AMOUNT RAISED ################################################### 6a

Select SUM(pledged) as Total_Amount_Raised
From projects
WHERE state = 'successful';
    
###########################################  SUCCESSFUL PROJECT BASED ON NUMBER OF BACKERS ################################################### 6b

Select SUM(backers_count) as Total_Number_Backers
From projects
WHERE state = 'successful';

###########################################  SUCCESSFUL PROJECT BASED ON AVERAGE NUMBER OF DAYS ##################################################  6C
           
Select Round(AVG(DATEDIFF(FROM_UNIXTIME(state_changed_at), FROM_UNIXTIME(launched_at)))) as avg_days_successful_projects
From projects
WHERE state = 'successful'
      and launched_at IS NOT NULL
      and  state_changed_at IS NOT NULL;
      
 ########################################  Get Top Successful Projects #####################################################################     
 SELECT 
    name,
    backers_count
FROM 
    projects
WHERE 
    state = 'successful'
ORDER BY 
    backers_count DESC
LIMIT 10;
SELECT 
    name,
    pledged
FROM 
    projects
WHERE 
    state = 'successful'
ORDER BY 
    pledged DESC
LIMIT 10;

     ############################################## Percentage of Overall Successful Projects  ###################################################### 

SELECT
concat(ROUND(SUM(state = 'successful') / COUNT(*) * 100,2),' %') AS  sucessful_project
FROM projects;

############################################## Percentage of Successful Projects by Category ###################################################### 

SELECT category_table.name,
  concat(ROUND(SUM(state = 'successful') / COUNT(*) * 100,2),' %') AS sucessful_project
FROM projects
inner join category_table
using (category_id)
group by category_table.name
order by sucessful_project desc;

############################################## Percentage of Successful Projects by year, month ###################################################### 

SELECT
    YEAR(FROM_UNIXTIME(created_at)) AS project_year,
    MONTH(FROM_UNIXTIME(created_at)) AS project_month,
    QUARTER(FROM_UNIXTIME(created_at)) AS project_quarter,
    concat(ROUND(
        COUNT(CASE WHEN state = 'successful' THEN 1 END) * 100.0 / COUNT(*),
        2
    ),' %') AS success_percentage
FROM
    projects
GROUP BY
    project_year, project_month, project_quarter
ORDER BY
    project_year, project_month;


############################################## Percentage of Successful projects by Goal Range ###################################################### 

SELECT 
  CASE 
    WHEN goal <= 1000 THEN '0-1K'
    WHEN goal <= 5000 THEN '1K-5K'
    WHEN goal <= 10000 THEN '5K-10K'
    ELSE '10K+'
  END AS goal_range,
 concat( round(COUNT(CASE WHEN state = 'successful' THEN 1 END) / COUNT(*) * 100,2) ,' %')AS success_project
FROM projects
Group by goal_range
order by success_project desc;
 
      

