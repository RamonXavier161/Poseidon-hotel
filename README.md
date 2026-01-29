
# 🏨 Sistema de Gestão Hoteleira

## 📄 Descrição do Projeto

Este projeto é um **sistema web completo para gestão de hotel**, desenvolvido para organizar e controlar os principais processos internos da operação hoteleira.

A aplicação permite o gerenciamento de **usuários, funcionários, quartos, tipos de quartos e imagens**, utilizando **ASP Classic** como base principal, integrado com **Node.js** para upload de imagens e **MySQL** para armazenamento de dados.

O sistema foi projetado para ser **funcional, organizado e escalável**, podendo receber novos módulos como reservas, controle de hóspedes e relatórios gerenciais.

---

## ✨ Funcionalidades Principais

✔ Cadastro e login de usuários
✔ Controle de perfis e permissões de acesso
✔ Cadastro de funcionários
✔ Cadastro de quartos
✔ Cadastro de tipos de quartos
✔ Upload de imagens dos quartos
✔ Armazenamento otimizado (somente caminho da imagem no banco)
✔ Validações dinâmicas no front-end (CPF, telefone, CEP, e-mail duplicado)

---

## 🛠️ Tecnologias Utilizadas

| Categoria               | Tecnologia                          | Uso no Projeto                                                               |
| ----------------------- | ----------------------------------- | ---------------------------------------------------------------------------- |
| **Backend Principal**   | ASP Classic                         | Regras de negócio, autenticação, páginas do sistema e integração com o banco |
| **Servidor de Imagens** | Node.js                             | Upload e gerenciamento de imagens dos quartos                                |
| **Banco de Dados**      | MySQL                               | Armazenamento de usuários, quartos, funcionários e caminhos das imagens      |
| **Servidor Web**        | IIS (Internet Information Services) | Hospedagem da aplicação ASP e integração com o Node.js                       |
| **Frontend**            | HTML, CSS, JavaScript               | Interface do sistema e validações no lado do cliente                         |

---

## 📂 Estrutura Geral do Sistema

O projeto é dividido em duas partes principais:

### 🔹 Aplicação ASP (Sistema Principal)

Responsável por:

* Telas do sistema
* Login e controle de sessão
* Cadastro de dados
* Comunicação com o banco MySQL

### 🔹 Servidor Node.js (Imagens)

Responsável por:

* Receber uploads de imagens
* Salvar os arquivos na pasta do servidor
* Retornar o caminho da imagem para o ASP salvar no banco

---

## 🚀 Como Executar o Projeto

### ✅ Pré-requisitos

Antes de rodar o sistema, você precisa ter instalado:

* Windows com **IIS habilitado**
* **ASP Classic** ativado no IIS
* **Node.js** instalado
* **MySQL Server** instalado
* **MySQL ODBC Driver 8.x ANSI** instalado

---

### 🗄️ 1. Configuração do Banco de Dados

1. Crie um banco de dados no MySQL:

```sql
CREATE DATABASE hotel;
```

2. Execute os scripts SQL que estão no projeto
   (O projeto já contém a estrutura das tabelas e inserts iniciais)

---

### 🔌 2. Configurar Conexão com o Banco (ASP)

No arquivo de conexão (ex: `db.asp`), configure:

```asp
conn.Open "Driver={MySQL ODBC 8.4 ANSI Driver};Server=localhost;Database=hotel;User=root;Password=SUA_SENHA;"
```

Substitua:

* `root` pelo seu usuário do MySQL
* `SUA_SENHA` pela sua senha

---

### 🌐 3. Configurar o IIS

1. Abra o **Gerenciador do IIS**
2. Crie um **novo site** ou aplicativo apontando para a pasta do projeto
3. Habilite:

   * ASP
   * Permissão de leitura e execução
4. Dê **permissão de escrita** na pasta onde as imagens serão salvas

---

### 🟢 4. Iniciar o Servidor Node.js

1. Vá até a pasta onde está o `server.js`

```bash
cd caminho/do/projeto/node
```

2. Instale as dependências (se houver `package.json`):

```bash
npm install
```

3. Inicie o servidor:

```bash
node server.js
```

⚠ O Node.js deve permanecer rodando para que o upload de imagens funcione.

---

### 🖼️ 5. Pasta de Upload de Imagens

Verifique no código do Node:

* Qual é a pasta onde as imagens são salvas
* Se ela existe
* Se o IIS tem permissão de acesso a essa pasta

---

## 🔄 Como Funciona o Upload de Imagens

1. O usuário envia a imagem pelo sistema ASP
2. O ASP envia a imagem para o servidor Node.js
3. O Node salva o arquivo na pasta do servidor
4. O caminho da imagem é salvo no MySQL
5. O sistema exibe a imagem usando esse caminho

---

## 📌 Status do Projeto

✅ Estrutura principal finalizada
🔄 Melhorias futuras podem incluir:

* Sistema de reservas
* Controle de hóspedes
* Relatórios gerenciais
* Painel administrativo avançado

---

## 👨‍💻 Autor

**Ramon Xavier**
🔗 [www.linkedin.com/in/ramon-xavier-dev](http://www.linkedin.com/in/ramon-xavier-dev)

