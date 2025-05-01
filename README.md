# Postgres Database Project: Brazilian Mortality

**Course**: MC536 Databases

**Repository**: Postgres-Database-Project-BrazilianMortality

---

## 👥 Team Members

- **Giovani Mambrim Leme** (215041) [GitHub](https://github.com/Giovanipt2)  
- **Pietro Fernandes Magaldi** (236842) [GitHub](https://github.com/pietromagaldi)  
- **Adriano Ribeiro F. Campos** (173253) [GitHub](https://github.com/AdrianoCampos05)

---

## 🗄 Database Schemas

### Conceptual Model

<p align="center">
  _<Insert conceptual model diagram here>_
</p>

### Logical Model

<p align="center">
  _<Insert logical model diagram here>_
</p>

---

## 🎯 Project Goals

This project aims to implement a PostgreSQL database populated via Python/psycopg2 with Brazilian data on mortality, health, and GDP of cities and states. The main objectives are:

- Design a normalized database schema that captures deaths, causes, basic health units, municipalities, states, and demographic details.  
- Populate the database with preprocessed datasets using automated loading scripts (Jupyter Notebooks).  
- Perform data validation to ensure referential integrity and consistency.  
- Formulate and execute five non-trivial SQL queries to extract insights.

**Non-trivial queries:**
1. _<Query 1 description placeholder>_  
2. _<Query 2 description placeholder>_  
3. _<Query 3 description placeholder>_  
4. _<Query 4 description placeholder>_  
5. _<Query 5 description placeholder>_

---

## 📂 Datasets

### Raw Data

The following raw datasets were used and are available in the `datasets` folder:

- **Mortalidade_Geral_2010.csv**: General mortality records for Brazil in 2010.  
- **vw_pib_percapita.csv**: GDP per capita for Brazilian municipalities (view).  
- **IBGE_cidades_2010.csv**: Municipality names and IBGE city codes.  
- **Unidades_Basicas_Saude-UBS.csv**: Basic Health Unit registry.  
- **CID-10-CATEGORIAS.csv**: ICD-10 categories descriptions.

### Preprocessed Data

After cleaning and transforming raw inputs, the following files in `preprocessed_datasets` were loaded into the database (each corresponds to one table in the logical model):

- **Death.csv**  
- **DeathCause.csv**  
- **Deceased.csv**  
- **Mother.csv**  
- **BasicHealthUnit.csv**  
- **State.csv**  
- **Municipality.csv**

---

## 📊 Analysis & Queries

Below is a description of each of the five queries executed against the database to answer key research questions:

1. **Query 1**: _<Placeholder for query description>_  
2. **Query 2**: _<Placeholder for query description>_  
3. **Query 3**: _<Placeholder for query description>_  
4. **Query 4**: _<Placeholder for query description>_  
5. **Query 5**: _<Placeholder for query description>_

---

## 🏆 Results

Links to the outputs for each query are available below:

1. [Result for Query 1](#)  
2. [Result for Query 2](#)  
3. [Result for Query 3](#)  
4. [Result for Query 4](#)  
5. [Result for Query 5](#)

---

## 📖 References

- **GDP per Capita (DADOS.GOV.BR)**  
  https://dados.gov.br/dados/conjuntos-dados/cgeo_vw_pib_percapita

- **General Mortality (SIM 1979–2019)**  
  https://dados.gov.br/dados/conjuntos-dados/sim-1979-2019

- **Municipality Codes & Descriptions (DATASUS)**  
  http://www2.datasus.gov.br/cid10/V2008/descrcsv.htm#:~:text=CID%2D10%2DSUBCATEGORIAS.,CID%2DO%2DGRUPOS.

- **IBGE City Codes**  
  https://www.ibge.gov.br/explica/codigos-dos-municipios.php

- **Basic Health Units (UBS2)**  
  https://dados.gov.br/dados/conjuntos-dados/unidades-basicas-de-saude-ubs2

---

*This README follows the template from [Matheus-F-Scatolin/Postgres-Database-Project-FoodSecurity](https://github.com/Matheus-F-Scatolin/Postgres-Database-Project-FoodSecurity).*
