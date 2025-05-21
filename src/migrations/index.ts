import { Sequelize } from 'sequelize';
import sequelize from '../config/database';
import * as createTables from './20240220_create_tables';

async function runMigrations() {
  try {
    // Executar migração
    await createTables.up(sequelize.getQueryInterface());
    console.log('Migrações executadas com sucesso!');
    process.exit(0);
  } catch (error) {
    console.error('Erro ao executar migrações:', error);
    process.exit(1);
  }
}

runMigrations(); 