SELECT
    COUNT(job_id) AS total_jobs_posting,
    
    CASE
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'local'
        else 'onsite'
    END AS location_category
FROM
    job_postings_fact
WHERE 
    job_title_short = 'Data Analyst'
GROUP BY 
    location_category
ORDER BY 
    location_category ASC