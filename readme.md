# REST API MENDOZARQ

Typescript & MySQL REST API (Nodejs & Express)

## Installation

Use the package manager npm to install rest api.

```bash
npm install
```

sync s3

```bash
aws configure list
aws configure
aws s3 sync s3://mendozarq-liraki-s3/liraki/ .
```

<!-- "dev": "nodemon src/index.ts --exec ts-node" -->
<!-- git tag -a v1.0.0 -m "comment"  then git push --tags-->

"dev": "tsc-watch --onSuccess \"node dist/index.js\" "
