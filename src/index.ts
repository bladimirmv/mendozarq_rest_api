import App from './classes/app';

async function main() {
	const app = App.instance;
	await app.listen();
}

main();