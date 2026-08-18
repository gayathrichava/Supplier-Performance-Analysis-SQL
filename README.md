# Supplier Performance Analysis — SQL

## 📌 Project Overview

This project analyses supplier performance data using **PostgreSQL** across four quarterly datasets covering FY25–26.

The analysis focuses on supplier KPI ratings, business areas, departments, quarterly performance, supplier trends, and data quality.

The project was designed to answer a practical business question:

> **Which suppliers are performing well, where are performance problems concentrated, and what data-quality issues need to be considered before making decisions?**

---

## 📊 Dataset

The project contains four quarterly datasets:

- Q1 — Apr–May–Jun 2025
- Q2 — Jul–Aug–Sep 2025
- Q3 — Oct–Nov–Dec 2025
- Q4 — Jan–Feb–Mar 2026

The combined dataset contains:

- **18,639 KPI records**
- **1,340 suppliers**
- **17 departments**
- **228 business areas**
- **4 quarters**

---

## 🔍 Analysis Performed

The SQL analysis covers:

### 1. Dataset Overview
Examined the overall size and structure of the dataset.

### 2. Quarterly Performance
Compared KPI performance across quarters and suppliers.

### 3. Rating Distribution
Analysed the proportion of KPIs receiving each rating.

### 4. Supplier Performance
Identified suppliers with consistently strong KPI performance.

### 5. Problem Suppliers
Identified suppliers with high volumes and rates of non-Good KPI ratings.

### 6. Business Area Performance
Compared performance across business areas.

### 7. Department Performance
Analysed KPI performance across departments.

### 8. KPI Performance
Examined individual KPI performance and rating patterns.

### 9. Supplier Trends
Looked at supplier performance across multiple quarters.

### 10. Data Quality Checks
Investigated inconsistencies and potential issues in the source data.

### 11. Cleaned Supplier Analysis
Standardised supplier names before comparing supplier-level performance.

---

## 🧹 Data Quality: Supplier Name Variations

One of the important findings was a data-quality issue involving **supplier names**.

The same supplier could appear under different formats, for example:

- `Accenture`
- `ACCENTURE`
- `Accenture (UK) Limited`
- `ACCENTURE (UK) LIMITED`

If these values were analysed exactly as recorded, the same organisation could be treated as multiple suppliers.

### How it was handled

SQL string functions were used to standardise supplier names by:

- removing unnecessary spaces with `TRIM()`
- standardising letter case with `LOWER()`
- creating a cleaned supplier identifier for analysis

This allowed supplier records to be grouped more consistently and made supplier-level comparisons more reliable.

---

## 🛠️ SQL Techniques Used

- `SELECT`
- `GROUP BY`
- `HAVING`
- `ORDER BY`
- `COUNT()`
- `COUNT(DISTINCT)`
- `COUNT() FILTER`
- `ROUND()`
- Window functions
- `LOWER()`
- `TRIM()`
- Conditional aggregation
- Supplier-level aggregation
- Data-quality validation

---

## 📁 Project Structure

```text
Supplier-Performance-Analysis-SQL/
│
├── Raw Data/
│   └── Original quarterly source datasets
│
├── Clean Data/
│   └── Cleaned quarterly CSV datasets
│
├── supplier_performance_analysis.sql
│   └── Complete PostgreSQL analysis
│
└── README.md
