# Back-MindCase

API REST para gerenciamento de artigos e usuários, desenvolvida com Node.js, TypeScript, Express e Sequelize.

## 🚀 Tecnologias

- Node.js
- TypeScript
- Express
- Sequelize (ORM)
- MySQL
- JWT (Autenticação)
- Multer (Upload de arquivos)
- Bcrypt (Criptografia de senhas)

## 📋 Pré-requisitos

- Node.js (versão 14 ou superior)
- MySQL
- npm ou yarn

## 🔧 Instalação

1. Clone o repositório:
```bash
git clone https://github.com/fabriciosoica/Back-MindCase.git
cd Back-MindCase
```

2. Instale as dependências:
```bash
npm install
# ou
yarn install
```

3. Configure as variáveis de ambiente:
Crie um arquivo `.env` na raiz do projeto com as seguintes variáveis:
```env
DB_HOST=localhost
DB_USER=seu_usuario
DB_PASS=sua_senha
DB_NAME=nome_do_banco
JWT_SECRET=seu_secret_jwt (o que eu usei na demonstração 753159951357)
PORT=3000
```

4. Execute as migrações:
```bash
npm run migrate
# ou
yarn migrate
```

5. Inicie o servidor:
```bash
npm run dev
# ou
yarn dev
```
OBS: Senha de todos usuários: Fabricio1@

## ✨ Autor

[FabricioSoica](https://github.com/fabriciosoica)
