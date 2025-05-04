# MySQL - Food Delivery

Este projeto é um modelo de banco de dados relacional desenvolvido com MySQL para um sistema de delivery, onde o foco é uma açaíteria. Ele foi criado com fins educacionais para praticar modelagem, criação de tabelas, relacionamentos e inserção de dados.

---

## 📂 Estrutura do Projeto

```
├── backups/
├── data/     
├── migrations/
├── schemas/
├── scripts/
└── README.md
```

### 📁 backups/

Contém os arquivos de backup (dumps) gerados a partir do banco de dados. Esses arquivos são úteis para restaurar o banco em outro momento ou em outro ambiente. Eles podem ser criados usando a ferramenta mysqldump ou outros métodos de backup.

### 📁 data/

Esta pasta contém scripts com dados fictícios (mock) para popular o banco de dados. O arquivo principal aqui é o `mock_data.sql`, que insere dados de teste nas tabelas do banco, como clientes, produtos, pedidos e outros.

### 📁 migrations/

A pasta de migrações contém scripts SQL que são utilizados para a criação das tabelas do banco de dados. Esses scripts são organizados por tabela e são usados para criar a estrutura do banco em diferentes ambientes ou versões.

### 📁 schemas/

Contém o script `schema.sql`, que é o arquivo completo que define a estrutura do banco de dados. Ele inclui a criação de todas as tabelas e os relacionamentos entre elas. Esse script pode ser executado para configurar completamente o banco de dados.

### 📁 scripts/

Nesta pasta ficam os scripts utilitários, como consultas SQL específicas para realizar tarefas ou análises no banco de dados. Também pode conter scripts de automação, como o `dump_db.sh`, para gerar backups do banco de dados automaticamente.

### 📄 README.md

O arquivo de documentação principal do projeto. Ele contém informações sobre o projeto, como a estrutura do banco de dados, como usar os scripts e como configurar o banco de dados para rodar o sistema.

---

## 🏗️ Tecnologias

* **MySQL 8.0.41**
* **SQL padrão ANSI**
* **Scripts organizados por migração**
* **Bash (para automação de backups)**

---

## 🔧 Como Usar

### 1. Criar o banco e as tabelas

Execute o script `schema.sql` no seu MySQL:

```sql
SOURCE schemas/schema.sql;
```

### 2. Inserir dados fictícios (mock)

Após criar as tabelas, popular com dados de teste:

```sql
SOURCE data/mock_data.sql;
```

### 3. Executar consultas

Abra e utilize os comandos presentes em `scripts/queries.sql` para consultar o banco.

### 4. Gerar backup (dump)

Certifique-se de criar um arquivo `.env` na raiz do projeto com as configurações do banco de dados e de que `mysqldump` está instalado. O conteúdo do arquivo `.env` deve ser:

```env
DB_NAME=db_food_delivery
DB_USER=YOUR_USER
DB_PASS=YOUR_PASSWORD
OUTPUT_DIR=./backups
```

Após configurar o `.env`, execute o seguinte comando para gerar o backup:

```bash
./scripts/dump_db.sh
```

---

## 🧱 Tabelas

O sistema possui as seguintes tabelas:

* `tb_customer` — Clientes
* `tb_address` — Endereços
* `tb_category` — Categorias de produtos
* `tb_product` — Produtos vendidos
* `tb_topping` — Adicionais (ex: granola, leite condensado)
* `tb_order` — Pedidos
* `tb_order_item` — Itens dos pedidos
* `tb_order_item_topping` — Relaciona itens com adicionais
* `tb_payment` — Pagamentos

---

## 👨‍💻 Autor

Este projeto foi desenvolvido por **Lucas Santos Silva**, Desenvolvedor Full Stack, graduado pela **Escola Técnica do Estado de São Paulo (ETEC)** nos cursos de **Informática (Suporte)** e **Informática para Internet**.

[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge\&logo=linkedin\&logoColor=white)](https://www.linkedin.com/in/bylucasss/)

---

## 📝 Licença

Este projeto está licenciado sob a **[Licença MIT](./LICENSE)**.