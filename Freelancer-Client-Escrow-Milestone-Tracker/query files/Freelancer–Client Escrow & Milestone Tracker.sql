-- CREATE DATABASE Freelancer_Client;

USE Freelancer_Client;


--  Table Creations

CREATE TABLE clients (
    client_id INT PRIMARY KEY,
    client_name VARCHAR(100) NOT NULL,
    country VARCHAR(50),
    industry VARCHAR(50),
    join_date DATE,
    subscription_plan VARCHAR(20)
);

select * from clients;

CREATE TABLE freelancers (
    freelancer_id INT PRIMARY KEY,
    freelancer_name VARCHAR(100) NOT NULL,
    country VARCHAR(50),
    primary_skill VARCHAR(50),
    experience_years INT,
    hourly_rate DECIMAL(10,2),
    rating DECIMAL(3,1),
    join_date DATE
);



CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    client_id INT,
    freelancer_id INT,
    project_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    total_budget DECIMAL(12,2),
    start_date DATE,
    expected_end_date DATE,
    actual_end_date DATE,
    project_status VARCHAR(20)
);


CREATE TABLE milestones (
    milestone_id INT PRIMARY KEY,
    project_id INT,
    milestone_name VARCHAR(100),
    amount DECIMAL(10,2),
    due_date DATE,
    completion_date DATE,
    milestone_status VARCHAR(20)
);



CREATE TABLE escrow_transactions (
    escrow_id INT PRIMARY KEY,
    milestone_id INT UNIQUE,
    deposit_amount DECIMAL(10,2),
    deposit_date DATE,
    release_date DATE,
    release_status VARCHAR(20)
    
);



CREATE TABLE disputes (
    dispute_id INT PRIMARY KEY,
    milestone_id INT,
    dispute_date DATE,
    dispute_reason VARCHAR(100),
    resolution_status VARCHAR(20),
    resolved_date DATE
);





DESC clients;
DESC freelancers;
DESC projects;
DESC milestones;
DESC escrow_transactions;
DESC disputes;

SELECT COUNT(*) FROM clients;
SELECT COUNT(*) FROM freelancers;
SELECT COUNT(*) FROM projects;
SELECT COUNT(*) FROM milestones;
SELECT COUNT(*) FROM escrow_transactions;
SELECT COUNT(*) FROM disputes;


SELECT * FROM clients LIMIT 5;
SELECT * FROM freelancers LIMIT 5;
SELECT * FROM projects LIMIT 5;
SELECT * FROM milestones LIMIT 5;


ALTER TABLE projects
ADD CONSTRAINT fk_projects_client
FOREIGN KEY (client_id)
REFERENCES clients(client_id);


ALTER TABLE freelancers
ADD PRIMARY KEY (freelancer_id);

ALTER TABLE projects
ADD CONSTRAINT fk_projects_freelancer
FOREIGN KEY (freelancer_id)
REFERENCES freelancers(freelancer_id);

ALTER TABLE milestones
ADD CONSTRAINT fk_milestones_project
FOREIGN KEY (project_id)
REFERENCES projects(project_id);
 

ALTER TABLE milestones
ADD CONSTRAINT fk_milestones_project
FOREIGN KEY (project_id)
REFERENCES projects(project_id);


ALTER TABLE escrow_transactions
ADD CONSTRAINT fk_escrow_milestone
FOREIGN KEY (milestone_id)
REFERENCES milestones(milestone_id);


ALTER TABLE escrow_transactions
ADD CONSTRAINT fk_escrow_milestone
FOREIGN KEY (milestone_id)
REFERENCES milestones(milestone_id);


ALTER TABLE disputes
ADD CONSTRAINT fk_disputes_milestone
FOREIGN KEY (milestone_id)
REFERENCES milestones(milestone_id);


-- Phase 1: Database Understanding

/*
Tables in the Project
clients
freelancers
projects
milestones
escrow_transactions
disputes
*/

-- Phase 2: Business Questions (SQL Analysis)

-- Q1. Find all freelancers charging more than $50/hour.

SELECT freelancer_name , hourly_rate  
FROM freelancers
WHERE hourly_rate > 50 ;

-- Q2. Find all Enterprise clients.

SELECT *  
FROM clients
WHERE subscription_plan = "Enterprise";

-- count of those clients  == 67
SELECT COUNT(*)  
FROM clients
WHERE subscription_plan = "Enterprise";

-- Q3. Count total projects. == 997 Projects are there 
SELECT COUNT(*) 
FROM projectS ;

-- Q4. Count projects by status.
SELECT project_status , COUNT(Project_id) AS Total_Projects
FROM projects
GROUP BY project_status
;

-- Q5. Show project details with client and freelancer names.

SELECT  c.client_name,
        f.freelancer_name,
        p.project_id,
        p.project_name,
        p.total_budget,
        p.start_date,
        p.project_status
FROM projects p
JOIN clients c  ON  c.client_id = p.client_id 
JOIN  freelancers f ON  p.freelancer_id = f.freelancer_id;

-- Q6. Find total earnings of each freelancer.
CREATE VIEW  total_earning_by_freelancers AS (
SELECT f.freelancer_name,
	   sum(f.hourly_rate) as "Total_earning"
FROM projects p
JOIN freelancers f ON p.freelancer_id = f.freelancer_id
GROUP BY freelancer_name); 

-- Q7. Top 10 highest earning freelancers.(view)

SELECT * FROM 
total_earning_by_freelancers 
ORDER BY Total_earning DESC
LIMIT 10 ;


-- Q8. Find total budget spent by each client.

SELECT c.client_name ,
	   sum(p.total_budget) AS "Total Budget"
FROM clients c
JOIN projects p ON c.client_id = p.client_id
GROUP BY client_name;

select * from clients;
select * from freelancers;
select * from projects;
select * from milestones ;
-- Q9 Find projects having delayed milestones.

SELECT p.project_name,
	   p.expected_end_date,
       m.milestone_status
FROM projects p 
JOIN milestones m  ON p.project_id = m.project_id 
WHERE milestone_status = "Delayed";


		