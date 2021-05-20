import json
import pandas as pd

df = pd.read_json('/Users/gabrielaturquetti/Documents/projeto3-vamoai/database/Personagens/personagens.json')
print(df.head())
#df.to_csv(r'/Users/gabrielaturquetti/Documents/projeto3-vamoai/database/Personagens/personagens.csv')
