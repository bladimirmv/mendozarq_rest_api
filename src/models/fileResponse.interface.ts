import { ManagedUpload } from 'aws-sdk/clients/s3';
export interface FileResponse {
	originalName: string;
	newName: string;
	data: ManagedUpload.SendData
}