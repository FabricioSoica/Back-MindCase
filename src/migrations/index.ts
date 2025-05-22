import { Sequelize } from 'sequelize';
import sequelize from '../config/database';
import * as createMigrationsTable from './20240220_create_migrations_table';
import * as createTables from './20240220_create_tables';

async function runMigrations() {
  try {
    await createMigrationsTable.up(sequelize.getQueryInterface());

    const [results] = await sequelize.query('SELECT name FROM Migrations');
    const executedMigrations = results.map((r: any) => r.name);

    if (!executedMigrations.includes('20240220_create_tables')) {
      console.log('Executando migration: create_tables');
      await createTables.up(sequelize.getQueryInterface());
      await sequelize.query(
        'INSERT INTO Migrations (name, executedAt) VALUES (?, NOW())',
        { replacements: ['20240220_create_tables'] }
      );
      console.log('Migration create_tables executada com sucesso!');
    } else {
      console.log('Migration create_tables já foi executada anteriormente.');
    }

    console.log('Todas as migrations foram verificadas!');
    process.exit(0);
  } catch (error) {
    console.error('Erro ao executar migrations:', error);
    process.exit(1);
  }
}

runMigrations(); 