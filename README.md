## Skill Assessment: dbt Data Engineer by Muzammil Javed

### Step 1: Upload the excel files in github.
The excel file 'carmen_sightings_20220629061307.xlsx' has 8 sheets each for a region, which are stored into separate CSVs and 
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
