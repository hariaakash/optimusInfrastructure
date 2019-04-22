module.exports = (req, res, callFunction) => {
	const { a, b } = req.body;
	res.json({ data: a + b });
};
