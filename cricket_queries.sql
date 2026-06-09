-- ============================================
-- International Cricket Performance Analytics
-- SQL Queries
-- Author: Lokesh Srinivas
-- ============================================

-- Query 1: Top 10 ODI Run Scorers
SELECT player, runs, matches, centuries
FROM batting_stats
WHERE format = 'ODI'
AND runs IS NOT NULL
AND runs != 'NaN'
ORDER BY runs DESC
LIMIT 10;

-- Query 2: Best Batting Averages in Tests (min 50 matches)
SELECT player, average, matches, runs
FROM batting_stats
WHERE format = 'Test'
AND matches >= 50
AND average IS NOT NULL
AND average != 'NaN'
ORDER BY average DESC
LIMIT 10;

-- Query 3: Most Centuries Across All Formats
SELECT player, format, centuries, matches
FROM batting_stats
WHERE centuries IS NOT NULL
AND centuries != 'NaN'
ORDER BY centuries DESC
LIMIT 10;

-- Query 4: Most Consistent ODI Batsmen (min 50 matches)
SELECT player, runs, average, matches, centuries
FROM batting_stats
WHERE format = 'ODI'
AND matches >= 50
AND runs IS NOT NULL
AND runs != 'NaN'
AND average IS NOT NULL
AND average != 'NaN'
ORDER BY average DESC, runs DESC
LIMIT 10;

-- Query 5: Average Batting Average by Format
SELECT format,
       ROUND(AVG(average)::numeric, 2) AS avg_batting_average,
       COUNT(player) AS total_players,
       ROUND(SUM(runs)::numeric, 0) AS total_runs
FROM batting_stats
WHERE average IS NOT NULL
AND average != 'NaN'
GROUP BY format
ORDER BY avg_batting_average DESC;

-- Query 6: Most Runs Per Match in T20s (min 20 matches)
SELECT player,
       ROUND((runs / matches)::numeric, 2) AS runs_per_match,
       runs,
       matches
FROM batting_stats
WHERE format = 'T20'
AND matches >= 20
AND runs IS NOT NULL
AND runs != 'NaN'
ORDER BY runs_per_match DESC
LIMIT 10;

-- Query 7: Best Strike Rates in T20s (min 20 matches)
SELECT player,
       strike_rate,
       runs,
       matches
FROM batting_stats
WHERE format = 'T20'
AND matches >= 20
AND strike_rate IS NOT NULL
AND strike_rate != 'NaN'
ORDER BY strike_rate DESC
LIMIT 10;

-- Query 8: Most Fifties in ODIs
SELECT player,
       fifties,
       runs,
       matches
FROM batting_stats
WHERE format = 'ODI'
AND fifties IS NOT NULL
AND fifties != 'NaN'
ORDER BY fifties DESC
LIMIT 10;

-- Query 9: Longest International Careers
SELECT player,
       span,
       format,
       matches
FROM batting_stats
WHERE span IS NOT NULL
AND matches >= 50
ORDER BY matches DESC
LIMIT 10;

-- Query 10: Players in Top 20 of Both ODI and Test
SELECT player, runs, matches
FROM batting_stats
WHERE format = 'ODI'
AND runs IS NOT NULL
AND runs != 'NaN'
AND player IN (
    SELECT player
    FROM batting_stats
    WHERE format = 'Test'
    AND runs IS NOT NULL
    AND runs != 'NaN'
    ORDER BY runs DESC
    LIMIT 20
)
ORDER BY runs DESC
LIMIT 20;