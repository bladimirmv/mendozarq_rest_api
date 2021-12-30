import { Router } from 'express';

import { downloadFile, getImage } from './../classes/aws.s3';
import { checkJwt } from './../middlewares/jwt';
import { checkRole } from './../middlewares/roles';
const router: Router = Router();

router
  .route('/:key(*)')

  .get(downloadFile);

router.route('image/:key(*)').get(getImage);
export default router;
