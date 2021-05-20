# Manipulação do .json para gerar o arquivo .csv
import pandas as pd

arquivo_json = pd.read_json('/Users/gabrielaturquetti/Documents/projeto3-vamoai/database/Personagens/personagens.json')

lista = []
for i in range(0,len(arquivo_json['characters'])):
    lista.append(arquivo_json['characters'][i])

df = pd.DataFrame(lista)

df.to_csv('/Users/gabrielaturquetti/Documents/projeto3-vamoai/database/Personagens/personagens.csv')