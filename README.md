# Projeto-de-banco-de-dados-jogos

Este repositório contém a modelagem e implementação de um banco de dados relacional voltado ao gerenciamento de **jogos**, **desenvolvedoras**, **plataformas**, **gêneros**, **avaliações de usuários** e **DLCs**. 
O objetivo é aplicar conceitos de modelagem de dados e consultas SQL usando o **PostgreSQL** como sistema gerenciador de banco de dados.

---

🛠️ Tecnologias utilizadas

- PostgreSQL;
- pgAdmin 4;
- SQL;

---

## 📊 Estrutura do Projeto

- `modelo_conceitual.png`: Diagrama ER com entidades e relacionamentos;
- `modelo_fisico.sql`: Script para criação das tabelas e relacionamentos no banco de dados;
- `consultas.sql`: Consultas SQL.

---


## 🧱 Modelo de Dados

O banco de dados inclui as seguintes entidades:

- **Desenvolvedora**
- **Jogo**
- **Gênero**
- **Plataforma**
- **Usuário**
- **Avaliação**
- **DLC**

Também há tabelas associativas para representar relacionamentos **N:N**, como:
- `genero_jogo`
- `jogo_plataforma`

---
