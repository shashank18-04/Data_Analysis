--What are the skills required for these top paying roles
WITH top_paying_jobs AS (
    SELECT 
        job_id,
        job_title,
        job_location,
        salary_year_avg,
        name AS company_name
    FROM
        job_postings_fact
    LEFT JOIN company_dim on job_postings_fact.company_id = company_dim.company_id
    WHERE
        (job_title_short = 'Data Analyst') AND 
        (job_location LIKE '%India') AND 
        (salary_year_avg IS NOT NULL)
    ORDER BY 
        salary_year_avg DESC
    LIMIT 20
)
SELECT 
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
 