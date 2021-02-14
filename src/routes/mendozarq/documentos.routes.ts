import { Router } from 'express';
import multer from 'multer';

import * as d from './../../controllers/mendozarq/documentos.controller'
import { checkJwt } from './../../middlewares/jwt';
import { checkRole } from './../../middlewares/roles';

const upload = multer().any();


const router: Router = Router();
// ====================> route carpeta /
router.route('/carpeta')
	.get(
		[checkJwt, checkRole(['administrador', 'arquitecto'])],
		d.getAllCarpetaProyecto
	)
	.post(
		[checkJwt, checkRole(['administrador', 'arquitecto'])],
		d.addCarpetaProyecto
	);

// ====================> route carpeta /:uuid
router.route('/carpeta/:uuid')
	.get(
		[checkJwt, checkRole(['administrador', 'arquitecto'])],
		d.getOneCarpetaProyecto
	)
	.put(
		[checkJwt, checkRole(['administrador', 'arquitecto'])],
		d.updateCarpetaProyecto
	)
	.delete(
		[checkJwt, checkRole(['administrador', 'arquitecto'])],
		d.deleteCarpetaProyecto
	);

// ====================> route carpetas /:uuid
router.route('/carpetas/:uuid')
	.get(
		[checkJwt, checkRole(['administrador', 'arquitecto'])],
		d.getAllCarpetaProyectoByUuid
	)


// ==================== route documentos ==>
router.route('/')
	.post(
		[checkJwt, checkRole(['administrador', 'arquitecto'])],
		upload,
		d.addDocumentoProyecto
	);

router.route('/:uuid')
	.put(
		[checkJwt, checkRole(['administrador', 'arquitecto'])],
		d.updateDocumentoProyecto
	)
	.delete(
		[checkJwt, checkRole(['administrador', 'arquitecto'])],
		d.deleteDocumento
	)

// ====================> route docs /:uuid
router.route('/uuidProy/:uuid/path/:path')
	.get(
		[checkJwt, checkRole(['administrador', 'arquitecto'])],
		d.getAllDocumentoProyectoByUuid
	)

// ==================== route documentos Carpeta ==>

router.route('/docCarpeta')
	.post(
		[checkJwt, checkRole(['administrador', 'arquitecto'])],
		upload,
		d.addDocumentoCarpeta
	);

router.route('/uuidCarpeta/:uuid/path/:path')
	.get(
		[checkJwt, checkRole(['administrador', 'arquitecto'])],
		d.getAllDocumentoCarpetaByUuid
	)

export default router;
