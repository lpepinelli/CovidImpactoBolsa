# ![image](https://user-images.githubusercontent.com/43144939/180423790-ccd0f415-ee86-4681-b4f4-8b4a029e2292.png)
<p align="center">
  <img align="center" src="https://user-images.githubusercontent.com/43144939/180423881-cff927e3-28ae-401f-b11c-6460370fe821.png" width="400"/>
</p>

## Proposta
Impacto da pandemia na valorização das ações. Quais setores da bolsa mais valorizaram ou desvalorizaram após o início da pandemia do Covid-19 ?

Periodo: 02/01/2019 até 18/05/2021

## Processo
Os dados foram encontrados no próprio site da B3 (Bolsa de valores nacional).
Arquivos baixados:
- COTAHIST_A2019.txt
- COTAHIST_A2020.txt
- COTAHIST_A2021.txt

Link: http://www.b3.com.br/pt_br/market-data-e-indices/servicos-de-dados/market-data/historico/mercado-a-vista/series-historicas/

Setorial B3 13-05-2021 (português).xlsx

Link: http://www.b3.com.br/pt_br/produtos-e-servicos/negociacao/renda-variavel/acoes/consultas/classificacao-setorial/

### Arquivo de cotações
COTAHIST_A20XX.txt

É um arquivo texto que contém a cotação histórica  por dia de todas as ações (02/01/2019 até 18/05/2021).

<img src="https://user-images.githubusercontent.com/43144939/180425507-dc1024f6-0a1d-417d-88b6-6899f1e853eb.png" width="850"/>

O arquivo segue um layout, também fornecido pela B3.

<img src="https://user-images.githubusercontent.com/43144939/180425604-01ca3077-2e79-488b-97fc-9f48b9f18a21.png" width="600"/>

Seguindo um tutorial do próprio site da B3 é possível (usando o layout) abrir este arquivo no Excel.
<p align="center">
<img src="https://user-images.githubusercontent.com/43144939/180426896-7a9b6a39-bd0e-417f-b042-bd081ed5565c.png" width="500" />
</p>
<img src="https://user-images.githubusercontent.com/43144939/180426943-0f00e2b5-2ced-41a4-a7e9-0fe1752a648a.png" /> 

O arquivo contém cotações de diversas fontes, indicado pela coluna “CODBDI”. Para facilitar a análise, foram desconsiderados os códigos diferentes do lote padrão (02). E algumas colunas referentes aos códigos removidos foram removidas também.

<img src="https://user-images.githubusercontent.com/43144939/180427743-18cbbe72-4c88-445a-a7b7-372d72ac13e8.png" width="500" />

### Arquivo de setores
Setorial B3 13-05-2021 (português).xlsx

É uma planilha contendo Setor, subsetor e Segmento de todas as ações nacionais.

<img src="https://user-images.githubusercontent.com/43144939/180428182-971c2fe6-3963-4a22-8312-893035dd462e.png" width="750" />

Com os arquivos no excel, foi possível salva-los como .csv para importa-los numa base de dados. Foi criado um banco no SQL Server com a seguinte estrutura:

![image](https://user-images.githubusercontent.com/43144939/180428624-f9575b3d-f252-4cab-8b3e-5acfe2f5d816.png)

## Dashobards
![image](https://user-images.githubusercontent.com/43144939/180428810-933efc4f-1414-49d3-a4c3-07cc8d494e8c.png)

![image](https://user-images.githubusercontent.com/43144939/180428843-8763d0ed-9d61-428f-9577-d47ec4119ec1.png)

![image](https://user-images.githubusercontent.com/43144939/180428858-e4ee04e4-d6c9-4c5f-b37c-3ca153a10181.png)
