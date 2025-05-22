import { Router, RequestHandler } from 'express';
import UserController from '../controllers/UserController';
import { authMiddleware } from '../middlewares/auth';
import { upload } from '../config/multer';

const router = Router();
const userController = new UserController();

router.post('/register', userController.register as RequestHandler);
router.post('/login', userController.login as RequestHandler);
router.put('/:id', authMiddleware as RequestHandler, upload.single('avatar'), userController.update as RequestHandler);
router.post('/change-password', userController.changePassword as RequestHandler);

export default router; 