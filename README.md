# Temperature and Precipitation on Total Crop Yield In Different Countries

<img src="https://nutritionfacts.org/app/uploads/2018/08/1Priority-Presentation.006.jpeg" width="650" />


The purpose of this repository is to demonstrate the process of building a query in SQL to answer the following questions:

- What are the countries for the top 5 yields for each crop?
- What is the minimum, maximum, and mean average_temp and average_precip for the top 5 yields of each crop?

Data from this repository was cleaned in a R Quarto document and then entered into a SQL database using duckdb. A query was then created to answer the questions mentioned above. Likewise, another Quarto document was used to replicate the query and plot its output using ggplot2. 

### Dataset Descriptions
Crop Calendar: This data is from the Center for Sustainability and the Global Environment. The dataset was originally composed of crop planting and harvest dates but was merged with monthly climatologies from the CRU. The link with access to it can be found in the references section. 

Crop Yield: This data is from the Food and Agriculture Organization of the United Nations (FAOSTAT). The original data contains crop and livestock statistics for over 200 products. From the FAO website, only crops were selected for this analysis. The link with access to it can be found in the references section. 

### Data Structure

```
eds213-section/
│
├── README.md                     
├── data_cleaning.qmd   
├── sections.sql
├── query_and_viz.qmd
├── dependencies.txt
|
├── data/
│   ├── FAOSTAT_data_en_4-1-2025.csv
│   ├── crop_yields.csv
│   ├── crop_prod_clean.csv
│   ├── crop_cal_clean.csv

```


### Contributors
[Tom Gibbens-Matsuyama](tommats00.github.io)

### References
1. Food and Agriculture Organization of the United Nations FAOSTAT. (n.d.). Crops and livestock products [[Crops and livestock products](https://www.fao.org/faostat/en/#data/QCL)](https://www.fao.org/faostat/en/#data/QCL. Access date: April 3, 2025.
2. Center for Sustainability and the Global Environment (SAGE). (2024, May 15). Crop Calendar Dataset | Center for Sustainability and the Global Environment. Center for Sustainability and the Global Environment. [https://sage.nelson.wisc.edu/data-and-models/datasets/crop-calendar-dataset/](https://sage.nelson.wisc.edu/data-and-models/datasets/crop-calendar-dataset/). Access date: April 3, 2025.


### Acknowledgements
All materials were created by [Julien Brun](https://github.com/brunj7) & [Greg Janee](https://github.com/gjanee) for EDS 213: Databases and Data Management from the Master in Environmental Data Science ([MEDS](https://bren.ucsb.edu/masters-programs/master-environmental-data-science)) at the Bren School of Environmental Science & Management, University California at Santa Barbara.
