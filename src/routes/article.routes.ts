import { Router, RequestHandler } from 'express';
import ArticleController from '../controllers/ArticleController';
import { authMiddleware } from '../middlewares/auth';
import { upload } from '../config/multer';

const router = Router();
const articleController = new ArticleController();

// Rotas públicas
router.get('/', articleController.list);
router.get('/:id', articleController.findById);

// Rotas protegidas
router.post('/', authMiddleware, upload.single('featuredImage'), articleController.create);
router.put('/:id', authMiddleware, upload.single('featuredImage'), articleController.update);
router.delete('/:id', authMiddleware, articleController.delete);
router.get('/author/:authorId', authMiddleware as RequestHandler, articleController.getArticlesByAuthor as RequestHandler);

export default router; 