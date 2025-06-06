import { Model, DataTypes } from 'sequelize';
import sequelize from '../config/database';
import User from './User';

class Article extends Model {
  public id!: number;
  public title!: string;
  public content!: string;
  public featuredImage!: string;
  public userId!: number;
  public readonly createdAt!: Date;
  public readonly updatedAt!: Date;
}

Article.init(
  {
    id: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
    },
    title: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    content: {
      type: DataTypes.TEXT,
      allowNull: false,
    },
    featuredImage: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    userId: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: 'Users',
        key: 'id',
      },
    },
  },
  {
    sequelize,
    modelName: 'Article',
  }
);

// Define a relação com User
Article.belongsTo(User, { foreignKey: 'userId' });
User.hasMany(Article, { foreignKey: 'userId' });

export default Article; 