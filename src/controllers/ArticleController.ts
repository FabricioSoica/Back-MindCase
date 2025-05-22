import { Request, Response } from 'express';
import Article from '../models/Article';
import User from '../models/User';

export default class ArticleController {
  async create(req: Request, res: Response) {
    try {
      const { title, content } = req.body;
      const userId = req.user?.id;

      if (!userId) {
        return res.status(401).json({ message: 'Usuário não autenticado' });
      }

      const article = await Article.create({
        title,
        content,
        userId,
        featuredImage: req.file?.filename, // Agora salvamos apenas o nome do arquivo
      });

      return res.status(201).json(article);
    } catch (error) {
      return res.status(500).json({ message: 'Erro ao criar artigo', error });
    }
  }

  async list(req: Request, res: Response) {
    try {
      const page = parseInt(req.query.page as string) || 1;
      const limit = parseInt(req.query.limit as string) || 10;
      const offset = (page - 1) * limit;

      const { count, rows } = await Article.findAndCountAll({
        include: [{
          model: User,
          attributes: ['id', 'name', 'email'],
        }],
        limit,
        offset,
        order: [['createdAt', 'DESC']],
      });

      return res.json({
        articles: rows,
        total: count,
        pages: Math.ceil(count / limit),
        currentPage: page,
      });
    } catch (error) {
      return res.status(500).json({ message: 'Erro ao listar artigos', error });
    }
  }

  async findById(req: Request, res: Response) {
    try {
      const { id } = req.params;
      const article = await Article.findByPk(id, {
        include: [{
          model: User,
          attributes: ['id', 'name', 'email'],
        }],
      });

      if (!article) {
        return res.status(404).json({ message: 'Artigo não encontrado' });
      }

      return res.json(article);
    } catch (error) {
      return res.status(500).json({ message: 'Erro ao buscar artigo', error });
    }
  }

  async update(req: Request, res: Response) {
    try {
      const { id } = req.params;
      const { title, content } = req.body;
      const userId = req.user?.id;

      const article = await Article.findByPk(id);
      if (!article) {
        return res.status(404).json({ message: 'Artigo não encontrado' });
      }

      if (article.userId !== userId) {
        return res.status(403).json({ message: 'Não autorizado' });
      }

      await article.update({
        title,
        content,
        featuredImage: req.file?.filename || article.featuredImage,
      });

      return res.json(article);
    } catch (error) {
      return res.status(500).json({ message: 'Erro ao atualizar artigo', error });
    }
  }

  async delete(req: Request, res: Response) {
    try {
      const { id } = req.params;
      const userId = req.user?.id;

      const article = await Article.findByPk(id);
      if (!article) {
        return res.status(404).json({ message: 'Artigo não encontrado' });
      }

      if (article.userId !== userId) {
        return res.status(403).json({ message: 'Não autorizado' });
      }

      await article.destroy();
      return res.status(204).send();
    } catch (error) {
      return res.status(500).json({ message: 'Erro ao deletar artigo', error });
    }
  }

  getArticlesByAuthor = async (req: Request, res: Response): Promise<void> => {
    try {
      const { authorId } = req.params;

      const articles = await Article.findAll({
        where: { userId: authorId },
        include: [{
          model: User,
          attributes: ['id', 'name', 'email'],
        }],
        order: [['createdAt', 'DESC']],
      });

      res.json(articles);
    } catch (error) {
      res.status(500).json({ message: 'Erro ao buscar artigos do autor', error });
    }
  }
} 