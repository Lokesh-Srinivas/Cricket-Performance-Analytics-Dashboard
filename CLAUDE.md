# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Running the Analysis

This is a Jupyter Notebook-based project. To work with it:

```bash
jupyter notebook cricket_analysis.ipynb
# or
jupyter lab
```

Execute notebook cells sequentially — data loading must precede cleaning, which must precede analysis.

## Project Structure

- `cricket_analysis.ipynb` — main analysis notebook
- `Batting/` — batting CSVs: `ODI data.csv`, `t20.csv`, `test.csv`
- `Bowling/` — bowling CSVs: `Bowling_ODI.csv`, `Bowling_t20.csv`, `Bowling_test.csv`
- `Fielding/` — fielding CSVs: `Fielding_ODI.csv`, `Fielding_t20.csv`, `Fielding_test.csv`

## Architecture

**Data flow:** CSV load → `clean_batting()` (column normalization) → type conversion (string → numeric) → analysis/ranking

**Three cricket formats** (ODI, T20, Test) are processed in parallel with the same pipeline. Each format has ~2,000–3,000 player records.

**Key columns:**
- Batting: Player, Span, Mat, Inns, NO, Runs, HS, Ave, BF, SR, 100, 50, 0
- Bowling: Player, Span, Mat, Inns, Balls, Runs, Wkts, BBI, Ave, Econ, SR, 4w, 5w

Numeric columns are stored as strings in the CSVs and require `pd.to_numeric(..., errors='coerce')` before any statistical operations.
