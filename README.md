## Skill Assessment: dbt Data Engineer - Muzammil Javed

### Step 1: Upload the excel files in github.
The excel file *carmen_sightings_20220629061307.xlsx* has 8 sheets each for a region, which are stored into separate CSVs and 
the column names are changed as per the given data dictionary. This is done using the following python code:

``` python
import pandas as pd

file_path = 'carmen_sightings_20220629061307.xlsx'
excel_file = pd.ExcelFile(file_path)
sheet_names = excel_file.sheet_names

cols = ["date_witness", "date_agent", "witness", "agent", "latitude", "longitude", "city", 
        "country", "city_agent", "has_weapon", "has_hat", "has_jacket", "behavior"]

for sheet_name in sheet_names:
    temp_sheet = pd.read_excel(file_path, sheet_name = sheet_name)
    temp_sheet.columns = cols
    temp_sheet.to_csv(f'{sheet_name}.csv', index = False)
```

### Step 2: Load the files in the db
- The CSV files are upload in the [seeds](https://github.com/muz-javed/cascade-dbt-assessment/tree/5d09e2ff1574e8dcda9c4cb2010f7c276b854240/seeds) folder using the upload files functionality in github.
- The files are then pulled to the directory in dbt cloud and the **dbt seeds** command is used to load the raw CSV files into the db.

### Step 3: Create Unified Schema & ER Diagram
- Model [combined_data_1NF](https://github.com/muz-javed/cascade-dbt-assessment/blob/2a185da26206fc895b508dc497b9bea4e5662210/models/raw_data/combined_data_1NF.sql) is created which is a union of all the CSV files.
- Following is the entity-relationship diagram (ERD) for the dataset currently in 1NF.
![ERD Diagram](https://github.com/muz-javed/cascade-dbt-assessment/blob/ab6ed32b8ba302f1c83399e1663ab681264c2f54/ERD.PNG)
- The above mentioned are stored as tables in the db.

### Step 4: Analytics

#### [*Task A*](https://github.com/muz-javed/cascade-dbt-assessment/blob/0af6471d0622abb6c7a881dbacebbccc5cbbad14/models/analytics/task_4a.sql)
The task was that for each month we need to find the region to which maximum number of agents report to. 
The solution to the task is:
![task_4a](https://github.com/muz-javed/cascade-dbt-assessment/blob/ecea7e1ff0538a7248651797b5fefb850cb266ad/Task%204A.PNG)

#### [*Task B*](https://github.com/muz-javed/cascade-dbt-assessment/blob/0af6471d0622abb6c7a881dbacebbccc5cbbad14/models/analytics/task_4b.sql)
The task was to find the probability Ms. Sandiego being armed and wearing a jacket but not wearing a hat.
The solution to the task is:
![task_4b](https://github.com/muz-javed/cascade-dbt-assessment/blob/62ea1c0569009112935df0e8a146e3a2a9385699/Task%204B.PNG)

It has been observed that there is a fairly low probability of Ms. Sandiego being armed and wearing a jacket but not wearing a hat. It averages around **3.92%**.

#### [*Task C*](https://github.com/muz-javed/cascade-dbt-assessment/blob/0af6471d0622abb6c7a881dbacebbccc5cbbad14/models/analytics/task_4c.sql)
The task was to find the 3 most occuring behaviors of Ms. Sandiego. 
The solution to the task is:
![task_4c](https://github.com/muz-javed/cascade-dbt-assessment/blob/62ea1c0569009112935df0e8a146e3a2a9385699/Task%204C.PNG)

#### [*Task D*](https://github.com/muz-javed/cascade-dbt-assessment/blob/0af6471d0622abb6c7a881dbacebbccc5cbbad14/models/analytics/task_4d.sql)
The task was to find the probability Ms Sandiego exhibiting any of the 3 behaviors, for each month, found in Task C.
The solution to the task is:
![task_4d](https://github.com/muz-javed/cascade-dbt-assessment/blob/62ea1c0569009112935df0e8a146e3a2a9385699/Task%204D.PNG)

