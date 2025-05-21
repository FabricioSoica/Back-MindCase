import express from 'express';
import cors from 'cors';
import dotenv from 'dotenv';
import path from 'path';
import sequelize from './config/database';
import userRoutes from './routes/user.routes';
import articleRoutes from './routes/article.routes';

dotenv.config();

const app = express();

app.use(cors());
app.use(express.json());

// Servir arquivos estáticos da pasta uploads
app.use('/uploads', express.static(path.resolve(__dirname, '..', 'uploads')));

// Rotas
app.use('/api/users', userRoutes);
app.use('/api/articles', articleRoutes);

// Sincronizar banco de dados e iniciar servidor
sequelize.sync().then(() => {
  const port = process.env.PORT || 3000;
  app.listen(port, () => {
    console.log(`Servidor rodando na porta ${port}`);
  });
}).catch(error => {
  console.error('Erro ao sincronizar o banco de dados:', error);
}); 