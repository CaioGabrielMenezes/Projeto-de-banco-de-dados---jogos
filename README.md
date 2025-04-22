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

## 🧱 Modelo conceitual


![Captura de tela 2025-04-22 112753](https://github.com/user-attachments/assets/d47f74de-0616-4290-82ce-5de64647ae72)


---

## Modelo lógico

![image](https://github.com/user-attachments/assets/ba0691f2-e8da-4c4a-b584-4220f12d3581)


