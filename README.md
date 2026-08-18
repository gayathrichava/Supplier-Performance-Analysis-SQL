# Supplier Performance Analysis — SQL

## 📌 Project Overview

This project analyses supplier performance data using PostgreSQL across four quarterly datasets covering FY25–26.

The analysis focuses on supplier KPI ratings, business areas, departments, quarterly performance, supplier trends, and data quality.

The project was designed to answer a practical business question:

> Which suppliers are performing well, where are performance problems concentrated, and what data-quality issues need to be considered before making decisions?

---

## 📊 Dataset

The project contains four quarterly datasets:

- Q1 — Apr–May–Jun 2025
- Q2 — Jul–Aug–Sep 2025
- Q3 — Oct–Nov–Dec 2025
- Q4 — Jan–Feb–Mar 2026

The combined dataset contains:

- **18,639 KPI records**
- **1,340 distinct supplier name values before standardisation**
- **17 departments**
- **228 business areas**
- **4 quarters**

> The supplier count represents distinct supplier values as recorded in the source data. Because supplier-name variations were identified during the data-quality analysis, this should not be interpreted as the number of unique organisations.

---

## 🔍 Analysis Performed

The SQL analysis covers:

### 1. Dataset Overview

Examined the overall size and structure of the dataset.

### 2. Quarterly Performance

Compared KPI performance across quarters and suppliers.

### 3. Rating Distribution

Analysed the distribution of KPI ratings across the dataset.

### 4. Supplier Performance

Identified suppliers with strong KPI performance, using a minimum record threshold to make comparisons more meaningful.

### 5. Problem Suppliers

Identified suppliers with high volumes and rates of non-Good KPI ratings.

### 6. Business Area Performance

Compared KPI performance across business areas.

### 7. Department Performance

Analysed KPI performance across departments.

### 8. KPI Performance

Examined individual KPI performance and rating patterns.

### 9. Supplier Trends

Analysed supplier performance across multiple quarters.

### 10. Data Quality Checks

Investigated inconsistencies in supplier names and identified cases where the same supplier appeared in multiple formats.

### 11. Cleaned Supplier Analysis

Applied supplier-name standardisation before performing supplier-level comparisons.

---

## 🧹 Data Quality: Supplier Name Variations

One of the important findings was a data-quality issue involving supplier names.

The same supplier could appear under different formats, for example:

- `Accenture`
- `ACCENTURE`
- `Accenture (UK) Limited`
- `ACCENTURE (UK) LIMITED`

If supplier names were analysed exactly as recorded, different name formats could cause supplier records to be treated as separate groups.

### How it was handled

SQL string functions were used to standardise supplier names by:

- removing unnecessary spaces with `TRIM()`
- normalising letter case with `LOWER()`
- applying `INITCAP()` to create a consistent display format

A separate data-quality check was also used to identify supplier names that still appeared in multiple forms.

This made supplier-level grouping more consistent and helped identify cases where the source data required further investigation.

---

## 💡 Key Findings

The analysis showed that:

- The dataset contains **18,639 KPI records** across four quarters.
- Supplier performance varies considerably, with some suppliers showing consistently strong KPI results while others have higher proportions of non-Good ratings.
- Performance patterns were examined across suppliers, KPIs, business areas, departments, and quarters.
- Supplier-name inconsistencies were identified as an important data-quality issue that can affect supplier-level analysis.
- Standardising supplier-name formatting produced more consistent groupings for supplier performance analysis.

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
- `INITCAP()`
- Conditional aggregation
- Supplier-level aggregation
- Data-quality validation

---




## ▶️ How to Run

1. Load the four cleaned quarterly CSV files from the `Clean Data` folder into PostgreSQL.
2. Combine the quarterly datasets into a table named `supplier_kpi_raw`.
3. Open `supplier_performance_analysis.sql` in pgAdmin 4.
4. Run the queries section by section.
5. Review the results for supplier, KPI, department, business-area, quarterly, trend, and data-quality analysis.

The SQL script assumes that the `supplier_kpi_raw` table has already been created and populated.

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
