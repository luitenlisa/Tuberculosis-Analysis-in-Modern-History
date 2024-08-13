# Analysis of Tuberculosis Cases in Modern History

### Project Overview 

This data analysis project aims to provide insights into the amount of and rates of Tuberculosis cases from 2000-2024. Analysis begins with global data and is then filtered down to only United States, and finally just California, where tuberculosis cases are reported in media to be significantly increasing in 2023 and 2024. Seeking to identify trends between geographic location and other demographic factors. 


### Data Sources
Global dataset: First data set used pertained to global tuberculosis cases and was named 'incidenceoftuberculosis.csv'. 

USA data set: Data set used to compare geographic locations within the United States of America. File was named 'USA_tuberculosis.csv'. Data retrieved from data.gov under "NNDS - Table III. Tuberculosis".

California data set: This set contained information about cases in California and included demographics of patients including age group, sex, ethnicity, citizen status, etc. File was named 'tb-case-rates-in-ca.csv'. Data retrieved from data.gov "tuberculosis case numbers and rates, california and local health jurisdictions" report. 

### Tools 
- Microsoft Excel -- Cleaning 
- MySQLWorkBench v8.0.34 -- Cleaning and Analysis [View Code](https://github.com/luitenlisa/Tuberculosis-Analysis-in-Modern-History/blob/main/tuberculosis_analysis.sql)
- Tableau Public -- Creating reports


### Data Cleaning and Preparation
In the initial data preparation state, I performed the following steps for each of the data sources I compiled:
1. Data loading and inspection
2. Identifiying relevant data
3. Data cleaning and formatting
   

### Exploratory Data Analysis (EDA)
EDA was performed to answer a few key questions such as:
- Which regions showed highest cases of tuberculosis?
- What years showed the highest number of cases of tuberculosis?
- What are the trends for high case regions and the time periods at which they occured?

### Data Analysis Results/Findings
The analysis results are summarized as follows:
From the year 2000, there was a peak in tuberculosis cases globally in 2003. Since 2003, there has been a steady decline up until 2020. From 2020 onwards, we see a plateau into a slight increase. Globally, the highest amount of tuberculosis cases can be seen in the southern region of Africa with the top three countries being Eswatini, South Africa, and Lesotho.

In the United States, the highest concentration of tuberculosis cases is found in California, which aligns with the fact that California is the most populated state in the country. The second highest was Texas, which is also the second most populated state in the country. 

Amongst California residents, the highest amount of cases were found in the age group of 45-64 years of age. The most cases were seen within the white population, followed by the hispanic population. Both of these groups were significantly higher than any other race in the state.  

