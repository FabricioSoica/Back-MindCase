import { Request, Response } from 'express';
import User from '../models/User';
import jwt from 'jsonwebtoken';

export default class UserController {
  register = async (req: Request, res: Response): Promise<void> => {
    try {
      const { name, email, password } = req.body;

      const userExists = await User.findOne({ where: { email } });
      if (userExists) {
        res.status(400).json({ message: 'Usuário já existe' });
        return;
      }

      const user = await User.create({ name, email, password });
      const token = jwt.sign({ id: user.id }, process.env.JWT_SECRET || 'default_secret', {
        expiresIn: '1d',
      });

      res.status(201).json({
        user: {
          id: user.id,
          name: user.name,
          email: user.email,
        },
        token,
      });
    } catch (error) {
      res.status(500).json({ message: 'Erro ao criar usuário', error });
    }
  }

  login = async (req: Request, res: Response): Promise<void> => {
    try {
      const { email, password } = req.body;

      const user = await User.findOne({ where: { email } });
      if (!user) {
        res.status(401).json({ message: 'Credenciais inválidas' });
        return;
      }

      const isValidPassword = await user.comparePassword(password);
      if (!isValidPassword) {
        res.status(401).json({ message: 'Credenciais inválidas' });
        return;
      }

      const token = jwt.sign({ id: user.id }, process.env.JWT_SECRET || 'default_secret', {
        expiresIn: '1d',
      });

      res.json({
        user: {
          id: user.id,
          name: user.name,
          email: user.email,
        },
        token,
      });
    } catch (error) {
      res.status(500).json({ message: 'Erro ao fazer login', error });
    }
  }

  update = async (req: Request, res: Response): Promise<void> => {
    try {
      const { id } = req.params;
      const { name, email } = req.body;

      const user = await User.findByPk(id);
      if (!user) {
        res.status(404).json({ message: 'Usuário não encontrado' });
        return;
      }

      await user.update({ name, email });

      res.json({
        id: user.id,
        name: user.name,
        email: user.email,
      });
    } catch (error) {
      res.status(500).json({ message: 'Erro ao atualizar usuário', error });
    }
  }
} 