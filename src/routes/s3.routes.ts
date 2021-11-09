import { Router } from 'express';

import { downloadFile, getImage } from './../classes/aws.s3';

const router: Router = Router();

router.route('/:key(*)')
	.get(downloadFile);

router.route('image/:key(*)')
	.get(getImage);

export default router;