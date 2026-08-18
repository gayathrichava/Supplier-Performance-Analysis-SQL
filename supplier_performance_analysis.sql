-- =====================================================
-- SUPPLIER PERFORMANCE ANALYSIS
-- PostgreSQL
-- =====================================================


-- =====================================================
-- 1. DATASET OVERVIEW
-- =====================================================

SELECT
    COUNT(*) AS total_records,
    COUNT(DISTINCT supplier) AS unique_suppliers,
    COUNT(DISTINCT dept) AS unique_departments,
    COUNT(DISTINCT business_area) AS unique_business_areas,
    COUNT(DISTINCT quarter) AS quarters
FROM supplier_kpi_raw;
-- =====================================================
-- 2. QUARTERLY PERFORMANCE
-- =====================================================
SELECT
    quarter,
    COUNT(*) AS total_kpis,
    COUNT(*) FILTER (WHERE rating = 'Good') AS good_kpis,
    COUNT(*) FILTER (WHERE rating <> 'Good') AS problem_kpis,
    ROUND(
        100.0 * COUNT(*) FILTER (WHERE rating = 'Good') / COUNT(*),
        1
    ) AS good_rate_pct
FROM supplier_kpi_raw
GROUP BY quarter
ORDER BY quarter;

-- =====================================================
-- 3. RATING DISTRIBUTION
-- =====================================================
SELECT
    rating,
    COUNT(*) AS total_kpis,
    ROUND(
        100.0 * COUNT(*) / SUM(COUNT(*)) OVER (),
        1
    ) AS rating_pct
FROM supplier_kpi_raw
GROUP BY rating
ORDER BY total_kpis DESC;

-- =====================================================
-- 4. SUPPLIER PERFORMANCE
-- =====================================================

SELECT
    INITCAP(LOWER(TRIM(supplier))) AS supplier_clean,
    COUNT(*) AS total_kpis,
    COUNT(*) FILTER (WHERE rating = 'Good') AS good_kpis,
    COUNT(*) FILTER (WHERE rating <> 'Good') AS problem_kpis,
    ROUND(
        100.0 * COUNT(*) FILTER (WHERE rating = 'Good') / COUNT(*),
        1
    ) AS good_rate_pct
FROM supplier_kpi_raw
GROUP BY INITCAP(LOWER(TRIM(supplier)))
HAVING COUNT(*) >= 10
ORDER BY total_kpis DESC
LIMIT 20;
-- =====================================================
-- 5. PROBLEM SUPPLIERS
-- =====================================================
SELECT
    INITCAP(LOWER(TRIM(supplier))) AS supplier_clean,
    COUNT(*) AS total_kpis,
    COUNT(*) FILTER (
        WHERE rating <> 'Good'
    ) AS problem_kpis,
    ROUND(
        100.0 * COUNT(*) FILTER (
            WHERE rating <> 'Good'
        ) / COUNT(*),
        1
    ) AS problem_rate_pct
FROM supplier_kpi_raw
GROUP BY INITCAP(LOWER(TRIM(supplier)))
HAVING COUNT(*) >= 10
ORDER BY problem_rate_pct DESC, problem_kpis DESC
LIMIT 20;

-- =====================================================
-- 6. BUSINESS AREA PERFORMANCE
-- =====================================================
SELECT
    business_area,
    COUNT(*) AS total_kpis,
    COUNT(*) FILTER (
        WHERE rating = 'Good'
    ) AS good_kpis,
    COUNT(*) FILTER (
        WHERE rating <> 'Good'
    ) AS problem_kpis,
    ROUND(
        100.0 * COUNT(*) FILTER (
            WHERE rating <> 'Good'
        ) / COUNT(*),
        1
    ) AS problem_rate_pct
FROM supplier_kpi_raw
GROUP BY business_area
HAVING COUNT(*) >= 10
ORDER BY problem_rate_pct DESC, problem_kpis DESC;

-- =====================================================
-- 7. DEPARTMENT PERFORMANCE
-- =====================================================
SELECT
    dept,
    COUNT(*) AS total_kpis,
    COUNT(*) FILTER (
        WHERE rating = 'Good'
    ) AS good_kpis,
    COUNT(*) FILTER (
        WHERE rating <> 'Good'
    ) AS problem_kpis,
    ROUND(
        100.0 * COUNT(*) FILTER (
            WHERE rating <> 'Good'
        ) / COUNT(*),
        1
    ) AS problem_rate_pct
FROM supplier_kpi_raw
GROUP BY dept
HAVING COUNT(*) >= 10
ORDER BY problem_rate_pct DESC, problem_kpis DESC;

-- =====================================================
-- 8. KPI PERFORMANCE
-- =====================================================
SELECT
    kpi_name_description,
    COUNT(*) AS total_kpis,
    COUNT(*) FILTER (
        WHERE rating = 'Good'
    ) AS good_kpis,
    COUNT(*) FILTER (
        WHERE rating <> 'Good'
    ) AS problem_kpis,
    ROUND(
        100.0 * COUNT(*) FILTER (
            WHERE rating <> 'Good'
        ) / COUNT(*),
        1
    ) AS problem_rate_pct
FROM supplier_kpi_raw
GROUP BY kpi_name_description
HAVING COUNT(*) >= 10
ORDER BY problem_rate_pct DESC, problem_kpis DESC
LIMIT 20;

-- =====================================================
-- 9. SUPPLIER TRENDS
-- =====================================================
SELECT
    quarter,
    supplier,
    COUNT(*) AS total_kpis,
    COUNT(*) FILTER (
        WHERE rating = 'Good'
    ) AS good_kpis,
    ROUND(
        100.0 * COUNT(*) FILTER (
            WHERE rating = 'Good'
        ) / COUNT(*),
        1
    ) AS good_rate_pct
FROM supplier_kpi_raw
GROUP BY quarter, supplier
HAVING COUNT(*) >= 5
ORDER BY supplier, quarter;

-- =====================================================
-- 10. DATA QUALITY CHECKS
-- =====================================================
SELECT
    LOWER(TRIM(supplier)) AS supplier_clean,
    COUNT(DISTINCT supplier) AS name_variations,
    COUNT(*) AS total_records
FROM supplier_kpi_raw
GROUP BY LOWER(TRIM(supplier))
HAVING COUNT(DISTINCT supplier) > 1
ORDER BY name_variations DESC, total_records DESC;

-- =====================================================
-- 11. CLEANED SUPPLIER ANALYSIS
-- =====================================================
SELECT
    INITCAP(LOWER(TRIM(supplier))) AS supplier_clean,
    COUNT(*) AS total_kpis,
    COUNT(*) FILTER (
        WHERE rating = 'Good'
    ) AS good_kpis,
    COUNT(*) FILTER (
        WHERE rating <> 'Good'
    ) AS problem_kpis,
    ROUND(
        100.0 * COUNT(*) FILTER (
            WHERE rating = 'Good'
        ) / COUNT(*),
        1
    ) AS good_rate_pct
FROM supplier_kpi_raw
GROUP BY INITCAP(LOWER(TRIM(supplier)))
HAVING COUNT(*) >= 10
ORDER BY total_kpis DESC
LIMIT 20;
