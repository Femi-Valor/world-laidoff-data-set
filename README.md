# world-layoff-data-set

## Project Objective
The data-set is is to be analyzed in order to know the total number of people working in a company that were laid-off, also to  determine the trend by year and month.

## Data Used
It was a CSV file from kaggle
- <a href="https://github.com/Femi-Valor/world-laidoff-data-set/blob/main/DOC/layoffs.csv">dataset

## Tools Used
- SQL

## Questions
- Top company with the highest layoff
- Year with the highest layoff
- month with the highest layoff

## Dataset
![Screenshot 2025-07-05 120638](https://github.com/user-attachments/assets/f387c40d-3f5c-419b-b359-36567fb2f9b5)

## Process
- Firstly i created a new schema (database) on my sql workbench
![Screenshot 2025-07-05 105137](https://github.com/user-attachments/assets/7cb34a95-2ef4-49e6-ac5a-5419d92aa08a)

- then right clicked on the database to import the dataset from my file
![Screenshot 2025-07-05 105401](https://github.com/user-attachments/assets/23d25c57-19cd-480e-b1dc-bd82f5ad68ca)
![Screenshot 2025-07-05 105759](https://github.com/user-attachments/assets/566e8f28-d6af-4980-b388-1b819e1b6310)

- and the next thing i did after that was to duplicate the datasetecause in a business sector it is always good to work on the duplicate and keep the original file
![Screenshot 2025-07-05 110028](https://github.com/user-attachments/assets/664c5259-6d55-456b-8318-2e3ebd20d0a4)                                    

### data cleaning
1. Remove Duplicate
![Screenshot 2025-07-05 132749](https://github.com/user-attachments/assets/4c810c58-7849-4a44-b919-2cd737a3d735)
- So i wrote a query to the filter out rows with duplicate and also partition under every data column just to be certain,also added window function(for numbering), under a cte table mysql does not allow modification of data, so the djplicates couldn't be deleted, 
- so also to make the work easier, i created another table duplicate by copying and pasting the create table statement and adding a new column to it row_num, and also renaming the table by adding 2 in front of the initial duplicate table.
![Screenshot 2025-07-05 110822](https://github.com/user-attachments/assets/dd30a793-2420-452a-99d5-2ed2740ae5ca)
![Screenshot 2025-07-05 133808](https://github.com/user-attachments/assets/b7d5d803-fbd8-49bb-811b-e2a3ca4febb7)
- Then wrote some queries to to insert the row_num  column to the duplicate table(layoff_duplicate2), inorder to delete th duplicate rows, with this query the duplicates are deleted.
![Screenshot 2025-07-05 111940](https://github.com/user-attachments/assets/9934c139-c3fa-49eb-8ec1-053e0052bc7a)
- then deleteted the row_num column
![drop column](https://github.com/user-attachments/assets/972319ae-b781-4be8-b320-d573324cf27a)


2.standardize data
- filter through the data and notice spaces and incorreect spelling or abbeviation of some values,stuffs like this wll cause inaccurate statistical analysis
![Screenshot 2025-07-05 112756](https://github.com/user-attachments/assets/6277bd1b-a39b-4840-b998-53cc1f5642cc)
- the above picture, the query used is to remove spaces and modify the column, did this for all text data type column
![Screenshot 2025-07-05 113204](https://github.com/user-attachments/assets/270bcd8b-b043-4962-b716-28cec64d7e91)
![Screenshot 2025-07-05 113619](https://github.com/user-attachments/assets/ed7793cd-5e65-4b83-8637-8f85c95e6f10)![Screenshot 2025-07-05 113403](https://github.com/user-attachments/assets/e4a02b1a-6f93-4ddf-98d0-fb9e8a94443f)
- the above query was used to rename values that were abbreviated or not correctly spelt
- and also i change the data type of the to a date format from a text format
![Screenshot 2025-07-05 114301](https://github.com/user-attachments/assets/472fbdcd-4b16-4825-a87e-ab3ee67ec42b)

3. Nulls Or Blank Removal
- filter through the data
- selected the column with blank space,changed it to null and i noticed the null can be filled because there are cells with thesame values under thesame column but different row
- so i did an inner join statement  
  ![Screenshot 2025-07-05 114802](https://github.com/user-attachments/assets/812d9e14-2c2d-485a-a3e3-7c15632f847a)
- for the integer data type, in thesame  row i deleted  the null values
- other null data under int data type couldn't be formulated

## Exploratory Data Analysis (EDA)
- analysis showing sum of total laidoff yearly
![Screenshot 2025-07-05 115958](https://github.com/user-attachments/assets/a9f0cd13-246a-4d30-b3a5-1e6e07d6790c)

- analysis showing sum of total laidoff monthly and yearly
![Screenshot 2025-07-05 120249](https://github.com/user-attachments/assets/b2d2ba94-4e36-4dce-a6ed-dc866b4d62fb)

- analysis showing sum of total laidoff monthly and yearly and rolling data(column  3 as rolling data)
![Screenshot 2025-07-05 120312](https://github.com/user-attachments/assets/40971bf0-1530-45f9-af1c-b36f880f6d4e)

- total number  of people laidoff in a company yearly
![Screenshot 2025-07-05 120439](https://github.com/user-attachments/assets/664641d6-a8eb-4cd1-b31b-548f9dee3ca3)

- ranking top five total number  of people laidoff in a company yearly
![Screenshot 2025-07-05 120602](https://github.com/user-attachments/assets/d26ca42a-44c5-4258-b20d-ee86befcf9fe)

## Conclusion
Accoriding to thee analysis, the highest people laidoff imn 2020 are from the transportation industry,while for the remaining years(2021, 2022, 2023) the highest people laid off are from the consumer industry.
we can say the covid 19 pandemic affected the trasportation sector in 2020, that caused people not to travel so workers were laidoff when there was no service to render to the public.

   - <a href="https://github.com/Femi-Valor/world-laidoff-data-set/blob/main/DOC/LAIDOFF%20SQL%20PROJECT.sql">click here to download  sql query used







 


  









  



