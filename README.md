# 💼 Freelancer-Client Escrow & Milestone Tracker

## 📌 Project Overview

The **Freelancer-Client Escrow & Milestone Tracker** is an advanced SQL-based database project designed to manage the complete lifecycle of freelance projects. The system enables efficient tracking of project milestones, escrow payments, payment releases, and dispute management between freelancers and clients.

This project simulates the backend database architecture of popular freelance marketplaces such as **Upwork**, **Freelancer**, and **Fiverr**.

---

## 🚀 Key Features

1. Client and Freelancer Management

2. Project & Milestone Tracking

3. Escrow Payment Management

4. Payment Release Monitoring

5. Dispute Logging & Resolution

6. Business Performance Analysis

7. Automated Business Logic using Triggers

8. Stored Procedures for Dynamic Reporting

9. Views for Executive-Level Insights

---

## 🏗️ Database Architecture

The project consists of the following interconnected tables:

| Table Name            | Description                                   |
| --------------------- | --------------------------------------------- |
| `clients`             | Stores client information                     |
| `freelancers`         | Stores freelancer details                     |
| `projects`            | Contains project information                  |
| `milestones`          | Tracks project milestones                     |
| `escrow_transactions` | Manages escrow deposits and releases          |
| `disputes`            | Logs disputes raised during project execution |

---

## 🗂️ Entity Relationship Diagram (ERD)

```text
Clients (1) ────────< Projects >──────── (1) Freelancers
                           |
                           |
                           ▼
                     Milestones
                           |
              ┌────────────┴────────────┐
              ▼                         ▼
Escrow_Transactions               Disputes
```

---

## ⚙️ Technologies Used

* **SQL**
* **MySQL**
* **MySQL Workbench**

---

##  Advanced SQL Concepts Implemented

###  Database Design

* Primary Keys
* Foreign Keys
* Normalization

###  Querying Techniques

* Joins
* Aggregate Functions
* Subqueries
* Common Table Expressions (CTEs)
* Window Functions

### 🔴 Advanced Database Objects

* Views
* Stored Procedures
* Functions
* Triggers
* Indexing

---

## 📊 Sample Business Questions Solved

### Project Insights

* How many projects are completed, ongoing, or on hold?
* Which freelancers generate the highest revenue?
* Which clients spend the most on freelance projects?

### Financial Insights

* Total escrow amount managed.
* Total released vs pending payments.
* Average project budget.

### Dispute Analysis

* Which freelancers have the highest dispute rate?
* Most common dispute reasons.
* Dispute resolution status analysis.

---

## 📈 Sample SQL Analysis

### Top 10 Highest Earning Freelancers

```sql
SELECT
    f.freelancer_name,
    SUM(m.amount) AS total_earnings
FROM freelancers f
JOIN projects p
ON f.freelancer_id = p.freelancer_id
JOIN milestones m
ON p.project_id = m.project_id
GROUP BY f.freelancer_name
ORDER BY total_earnings DESC
LIMIT 10;
```

---

## 🔄 Implemented Automation

### Trigger

Automatically updates milestone status based on completion and due dates.

### Stored Procedure

Generates dynamic reports for project and freelancer performance.

### Views

Provides management-ready dashboards for quick business insights.

---

## 📌 Business Impact

This project helps organizations:

* Improve project transparency.
* Secure client payments using escrow mechanisms.
* Reduce project disputes.
* Monitor freelancer performance.
* Enable data-driven decision-making.

---

## 🌟 Future Enhancements

* Integration with Power BI Dashboard.
* Development of REST APIs using Python/Flask.
* Real-time notification system.
* Web-based project management interface.



⭐ If you found this project useful, don't forget to star the repository!
