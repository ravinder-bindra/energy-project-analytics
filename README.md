# Energy Project Analytics

End-to-end data analytics pipeline on global energy data, covering data extraction with SQL, transformation in Python, statistical analysis, and visualization in Plotly and ggplot.

## Project goals

- Practice the full data pipeline an entry-level data scientist would run on a real project
- Combine SQL, Python, and R in one project — same data, different tools, different strengths
- Surface meaningful trends in the global energy transition (renewables share, fossil fuel dependence, regional patterns)

## Dataset

Public energy data from [Our World in Data](https://github.com/owid/energy-data) — country-level energy production, consumption, and source mix from 1965 to 2022.

## Tech stack

| Layer | Tool | Why |
|---|---|---|
| Data extraction | SQL (SQLite) | Querying and aggregating raw data efficiently |
| Data transformation | Python (Pandas) | Cleaning, joining, reshaping |
| Statistical analysis | Python (scikit-learn, statsmodels) | Regression and predictive modeling |
| R analysis | R (dplyr, ggplot2) | Tidy data manipulation and statistical graphics |
| Dashboard | Plotly (Python) | Interactive web-based visualization |
| Interactive app | R Shiny | Reactive analytics UI |
| Version control | Git + GitHub | Reproducibility and code history |

## Repository structure

\\\
energy-project-analytics/
├── data/             # Raw CSVs (energy.db is gitignored, regenerate via setup steps)
├── sql/              # SQL queries against the SQLite database
├── notebooks/        # Jupyter notebooks for Python analysis
├── r_scripts/        # R analysis scripts using dplyr and ggplot2
├── dashboard/        # Plotly Dash app
├── shiny_app/        # R Shiny app
└── README.md
\\\

## Setup

1. Clone the repo and \cd\ into it.
2. Download the dataset:

   \\\powershell
   cd data
   Invoke-WebRequest -Uri "https://raw.githubusercontent.com/owid/energy-data/master/owid-energy-data.csv" -OutFile "energy_data.csv"
   \\\

3. Load into SQLite:

   \\\powershell
   pip install sqlite-utils
   sqlite-utils insert energy.db energy energy_data.csv --csv
   \\\

4. Open \energy.db\ in [DB Browser for SQLite](https://sqlitebrowser.org/) and run queries from \sql/\.

## Progress

- [x] SQL exploration queries (\sql/01_exploration.sql\)
- [ ] Python data cleaning + statistical modeling
- [ ] R analysis with ggplot2
- [ ] Plotly dashboard
- [ ] R Shiny app

## Author

**Ravinder Deep Singh Bindra** — B.Tech Data Science, Punjab Engineering College
