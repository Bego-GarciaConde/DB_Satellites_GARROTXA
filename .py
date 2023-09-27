import mysql.connector
import pandas as pd
import numpy as np
from sqlalchemy import create_engine
import os
import seaborn as sns
import matplotlib.pyplot as plt


#RAW connection
db = mysql.connector.connect(
        host= "localhost",
        user = "bego",
        passwd = "prueba123",
        database = "Rockstar_satellites_GARROTXA"
    
)
mycursor = db.cursor()

selectquery =  """SELECT id
                FROM satellites_characteristics"""
mycursor.execute(selectquery)

# Fetch the results
records = mycursor.fetchall()

# Convert the results to a DataFrame
column_names = [desc[0] for desc in mycursor.description]
df = pd.DataFrame(records, columns=column_names)

#Get complete list of IDs in the main table: satellites_characteristics (All sats with M>1e7Msun)

selectquery =  """SELECT id
                FROM satellites_characteristics"""
mycursor.execute(selectquery)

records = mycursor.fetchall()

column_names = [desc[0] for desc in mycursor.description]
df = pd.DataFrame(records, columns=column_names)


#Create the table for each satellite from the CSV
for table_name in np.array(df["id"]):
    mycursor.execute(
    f"""CREATE TABLE DM{table_name}(
            Snapshot INT PRIMARY KEY,
            Lookback DECIMAL (5, 2),
            X DECIMAL (5, 2),
            Y DECIMAL (5, 2),
            Z DECIMAL (5, 2),
            R DECIMAL (5, 2),
            Mass DECIMAL (12, 2),
            Mstars DECIMAL (12, 2)); """)
    db.commit()
    mycursor.execute(            
           f""" LOAD DATA INFILE '/var/lib/mysql-files/satellites_tables/{table_name}.csv'
                    INTO TABLE DM{table_name}
                    FIELDS TERMINATED BY ','
                    OPTIONALLY ENCLOSED BY '"'
                    LINES TERMINATED BY '\n'
                    IGNORE 1 ROWS
                    (@dummy, @Snapshot, Lookback, @X, @Y, @Z, @R, @Mass, @Mstars)
                    SET Snapshot = NULLIF(@Snapshot, ''),
                    X = NULLIF(@X,''),
                    Y = NULLIF(@Y,''),
                    Z = NULLIF(@Z,''),
                    R = NULLIF(@R,''),
                    Mass = NULLIF(@XMass,''),
                    Mstars = NULLIF(@Mstars,'')""")
    db.commit()
        
        