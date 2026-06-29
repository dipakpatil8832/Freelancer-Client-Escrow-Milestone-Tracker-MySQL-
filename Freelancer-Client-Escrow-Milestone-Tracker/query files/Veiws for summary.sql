USE freelancer_client;

-- View 1: Freelancer Earnings Summary

CREATE VIEW vw_freelancer_earnings AS
SELECT
    f.freelancer_id,
    f.freelancer_name,
    COUNT(DISTINCT p.project_id) AS total_projects,
    SUM(m.amount) AS total_earnings
FROM freelancers f
JOIN projects p
ON f.freelancer_id = p.freelancer_id
JOIN milestones m
ON p.project_id = m.project_id
GROUP BY f.freelancer_id, f.freelancer_name;

select * from vw_freelancer_earnings
ORDER BY total_earningS DESC;


-- View 2: Project Performance Dashboard

CREATE VIEW vw_project_performance AS
SELECT
    p.project_id,
    p.project_name,
    c.client_name,
    f.freelancer_name,
    p.total_budget,
    p.project_status,
    COUNT(d.dispute_id) AS total_disputes
FROM projects p
JOIN clients c
ON p.client_id = c.client_id
JOIN freelancers f
ON p.freelancer_id = f.freelancer_id
LEFT JOIN milestones m
ON p.project_id = m.project_id
LEFT JOIN disputes d
ON m.milestone_id = d.milestone_id
GROUP BY p.project_id;

SELECT * FROM vw_project_performance;


-- Phase 2: Stored Procedures
-- Procedure 1: Get Projects by Status
  
DELIMITER // 
CREATE PROCEDURE get_project_by_status (IN Status_ VARCHAR(50))
BEGIN
SELECT P.Project_name,
	   p.category,
       p.total_budget,
       p.expected_end_date,
       p.project_status
FROM projects p
WHERE project_status = Status_ ; 
END // ;
DELIMITER ;

CALL get_project_by_status("Ongoing");

select * from clients;
select * from freelancers;
select * from projects;
select * from milestones ;
select * from disputes;
select * from escrow_transactions;
-- Procedure 2: Freelancer Revenue Report

DELIMITER //
CREATE PROCEDURE freelancer_revenue_report (IN ID INT )
BEGIN 
SELECT f.freelancer_name,
	   f.experience_year,
       f.hourly_rate,
       f.rating,
       sum(m.amount)
FROM project p 
JOIN freelancers ON P.freelancer_id =  f.freelancer_id
       
END // ;
DELIMITER ; 