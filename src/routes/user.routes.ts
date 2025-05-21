import { Router, RequestHandler } from 'express';
import UserController from '../controllers/UserController';
import { authMiddleware } from '../middlewares/auth';

const router = Router();
const userController = new UserController();

router.post('/register', userController.register as RequestHandler);
router.post('/login', userController.login as RequestHandler);
router.put('/:id', authMiddleware as RequestHandler, userController.update as RequestHandler);

export default router; 