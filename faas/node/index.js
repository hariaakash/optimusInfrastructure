const express = require('express');
const app = express();
const bodyParser = require('body-parser');
const axios = require('axios');

const handler = require('./function/handler');

app.use(bodyParser.json());
app.use(bodyParser.raw());
app.use(bodyParser.text({ type: 'text/*' }));
app.disable('x-powered-by');

const projectEasyId = process.env.PROJECT_EASY_ID || '';

const callFunction = ({ name, method = 'POST', headers = {}, query = {}, data = {} }) =>
	axios({
		method,
		url: `http://${projectEasyId}_functions_${name}:3000`,
		headers,
		data,
		params: query
	});

const middleware = (req, res) => handler(req, res, callFunction);

app.post('/*', middleware);
app.get('/*', middleware);

app.listen(3000, () => {
	console.log(`FaaS Node.js running for ${projectEasyId}.`);
});
