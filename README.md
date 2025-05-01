# Postgres Database Project: Brazilian Mortality  

**Course**: MC536 Databases  
**Repository**: Postgres-Database-Project-BrazilianMortality  

---

## 📖 Overview  
This repository contains the implementation of a PostgreSQL database for analyzing Brazilian mortality, health, and economic indicators at the municipal and state levels. Data is loaded via Python/psycopg2, with a fully normalized schema and scripts for preprocessing, loading, and querying.

---

## 📑 Table of Contents  
1. [Overview](#overview)  
2. [Team Members](#team-members)  
3. [Database Schemas](#database-schemas)  
4. [Project Goals](#project-goals)  
5. [Datasets](#datasets)  
   5.1. [Raw Data](#raw-data)  
   5.2. [Preprocessed Data](#preprocessed-data)  
6. [Technology Stack](#technology-stack)  
7. [Project Structure](#project-structure)  
8. [Setup and Usage](#setup-and-usage)  
   8.1. [Prerequisites](#prerequisites)  
   8.2. [Database Setup](#database-setup)  
   8.3. [Running](#running)  
9. [Analysis & Queries](#analysis--queries)  
10. [Results](#results)  
11. [References](#references)  

---

## 👥 Team Members  
- [**Giovani Mambrim Leme (215041)**](https://github.com/Giovanipt2)  
- [**Pietro Fernandes Magaldi (236842)**](https://github.com/pietromagaldi)  
- [**Adriano Ribeiro F. Campos (173253)**](https://github.com/AdrianoCampos05)

---

## 🗄 Database Schemas  
The core of this project is the relational database designed to integrate the different datasets. Below are visualizations of the conceptual and relational models:

### Conceptual Model  
<p align="center">  
  _<Insert conceptual model diagram here>_  
</p>

### Logical (Relational) Model  
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

## 💻 Technology Stack  
- **Database**: PostgreSQL (tested with version 14+)  
- **Language**: Python 3.x  
- **Libraries**:  
  - psycopg2-binary: PostgreSQL adapter for Python  
  - pandas: Data manipulation and analysis (used in preprocessing and query result display)  
  - jupyterlab/notebook: For running the .ipynb files  
- **Tools**: pgAdmin 4 (for database management and ERD generation)

---

## 🗂 Project Structure  
