# Analysis of Tuberculosis Cases in Modern History

## Table of Contents
- [Project Overview](#project-overview)
- [Data Sources](#data-sources)
- [Tools](#tools)
- [Data Cleaning and Preparation](#data-cleaning-and-preparation)
- [Exploratory Data Analysis](#exploratory-data-analysis)
- [Data Analysis Results and Findings](#data-analysis-results-and-findings)
- [Limitations](#limitations)

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
   

### Exploratory Data Analysis
EDA was performed to answer a few key questions such as:
- Which regions showed highest cases of tuberculosis?
- What years showed the highest number of cases of tuberculosis?
- What are the trends for high case regions and the time periods at which they occured?


### Data Analysis Results and Findings
The analysis results are summarized as follows:
From the year 2000, there was a peak in tuberculosis cases globally in 2003. Since 2003, there has been a steady decline up until 2020. From 2020 onwards, we see a plateau into a slight increase. Globally, the highest amount of tuberculosis cases can be seen in the southern region of Africa with the top three countries being Eswatini, South Africa, and Lesotho.

<img width="1138" alt="Global_TB_MAP" src="https://github.com/user-attachments/assets/719229f6-ae44-4f6d-a618-9619e394756c">


In the United States, the highest concentration of tuberculosis cases is found in California, which aligns with the fact that California is the most populated state in the country. The second highest was Texas, which is also the second most populated state in the country. 

Amongst California residents, the highest amount of cases were found in the age group of 45-64 years of age. The most cases were seen within the white population, followed by the hispanic population. Both of these groups were significantly higher than any other race in the state.  

<img width="742" alt="USA_TB_Chart" src="https://github.com/user-attachments/assets/9b86383f-4481-4286-af48-968c3ef96d1f">


### Limitations
The research from which data was pulled mostly ended in 2022. There is not a lot of comprehensive data yet from 2023/2024. 
In the global data, I had to remove some values due to assuming there would be duplicate values. For example, the original data included a value for "high-income countries". United States had its own line as well, but is considered a high-income country. I removed these vague entries and focused on individual countries for this particular report. 
The United States data only had values for 2016 and 2017, therefore I refrained from using trend based data for this section due to limited time period. It may not be reflective of current rates. 

### References

