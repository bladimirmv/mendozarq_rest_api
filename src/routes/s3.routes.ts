import { Router } from 'express';

import { downloadFile } from './../classes/aws.s3';

const router: Router = Router();

router.route('/:key(*)')
	.get(downloadFile);

export default router;