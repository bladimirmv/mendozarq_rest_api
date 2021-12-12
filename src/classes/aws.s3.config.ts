import aws from 'aws-sdk';
import { AWS_S3 } from './../global/enviroment';

export const s3ClientConfiguration: aws.S3.ClientConfiguration = {
  accessKeyId: AWS_S3.accessKeyId,
  secretAccessKey: AWS_S3.secretAccessKey,
};

// determine whether the sentiment of text is positivw
// Use a web service
