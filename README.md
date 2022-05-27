# Data Science Capstone Project
Our final project for Data &amp; Society, exploring racial and ethnic representation within postsecondary education.

### Our Research Question

"What do colleges who are closing the racial overrepresentation and underrepresentation gaps at a quicker rate (2009-2017) have in common as opposed to others with constant or increasing gaps"

### Our Data

This dataset combines public data from the Integrated Postsecondary Education Data System and the US Census Bureau’s American Community Service in an index of racial and ethnic representativeness of US postsecondary education institutions. The data set is originally sourced from Integrated Postsecondary Education Data System and US Census American Community Survey and was developed at the Urban Institute—made available under the ODC-BY 1.0 Attribution License. There are two data sets that are based on 4 years and 2 years college representativeness. 4-year college representativeness contains 34 variables and the 2-year college representativeness contains 30 variables. 

The key variables are the "dif_" variables, which show the representativeness for each racial category (white, black, hispanic, asian, pacific islander, native american, mixed) with a numerical value determined by subtracting a school's percent enrollment of a certain racial group by the percent of this group in a school's respective market. The market was determined by the dividing the schools into urbanicity categories (urban, suburban, rural) and determining how far students travel to reach the school. Market distances differed between both 2 and 4 year college groups and urbanicity groups between these. Age also determined the markets. Four year colleges looks at 18-24 year olds in a 121 mile radius for urban schools, 131 mile radius for suburban schools, and 181 mile radius for rural schools. Two year colleges look at 18-54 year olds in a 15 mile radius for urban schools, 31 mile radius for suburban schools, and a 34 mile radius for rural schools.

Variables in the data set include categorical variables for each school's id, year, FIPS code, name, two or four year category, public or private status, for profit status, and selectivity categorization per the Carnegie classifications of non-selective, selective, and more selective. Quantitative variables in the set include total enrollment at each school, percent enrollment at each college of each racial group ("mcol_" variables), market percent for each racial group ("mkt_" variables), and the previously mentioned "dif_" variables for each group that 

### Our Methodology

- Determine the schools that are most rapidly closing representation gaps through using our own mathematical metric from one of six options, or through a combination of all six
  - Line of best fit using sum of difference magnitudes and compare slopes
  - Line of best fit using mean of squared differences and compare slopes
  - Establish an ideal line for ideal comparison using sum of difference magnitudes and a quadratic line type and perform regression analysis
  - Establish an ideal line for ideal comparison using sum of difference magnitudes and an exponential line type and perform regression analysis
  - Establish an ideal line for ideal comparison using mean of squared differences and a quadratic line type and perform regression analysis
  - Establish an ideal line for ideal comparison using mean of squared differences and an exponential line type and perform regression analysis
- Once the top schools are determined, pair data set with more variables from the Education Data Explorer API including data on instituion types and categories, cost and aid for tuition and room and board, family and student income, relgious afiliation, and other variables relating to the school
- Begin performing correlation analyses across schools to see which common variables may be contributing to their push towards better representativeness
- Predictive modeling could be then used to see rates at which schools will continue to close gaps
