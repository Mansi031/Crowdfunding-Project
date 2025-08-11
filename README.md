# Crowdfunding-Project
📊 Crowdfunding Projects – SQL Data Analysis
📌 Overview
This project analyzes a comprehensive crowdfunding dataset using SQL to uncover patterns, success factors, and trends influencing project outcomes. It focuses on evaluating project performance based on funding goals, categories, geographical distribution, timelines, and engagement metrics such as the number of backers.

The dataset includes details like project creation and launch dates, funding goals, pledged amounts, categories, locations, and outcomes (e.g., successful, failed). SQL queries are used to transform raw UNIX timestamps into human-readable dates, calculate funding conversions, and generate aggregated insights.

🛠 Key SQL Analysis Components
Date Conversions – Transforming created_at, launched_at, deadline, and state_changed_at UNIX timestamps into standard date formats for analysis.

Funding Goals – Extracting and calculating funding goals in USD for comparison and visualization.

Outcome Analysis – Counting total projects grouped by their state (e.g., successful, failed, canceled).

Geographic Trends – Joining with location data to determine project counts by country.

Category Insights – Identifying the number of projects per category to spot high-volume sectors.

Time Series Trends – Grouping projects by year, month, and quarter to track growth over time.

Success Metrics –

Total Amount Raised by successful projects.

Total Number of Backers supporting successful projects.

Average Campaign Duration for successful projects.

Top Projects – Listing the top 10 most successful projects by backers and by amount pledged.

🚀 Insights & Use Cases
For Creators – Understand which categories and funding ranges are most likely to succeed.

For Investors – Identify regions and sectors with high engagement and proven success.

For Platforms – Benchmark campaign performance and optimize recommendations.

📂 Tools & Technologies
SQL – Data querying, joins, aggregations, date functions.

MySQL – Execution and data exploration environment.
