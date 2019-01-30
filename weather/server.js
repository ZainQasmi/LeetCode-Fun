const fs = require('fs')
const http = require ('http')

const readFile = file =>
	new Promise((resolve, reject) =>
		fs.readFile(file, (err,data) =>
			err ? reject(err) : resolve(data)))

const server = http.createServer(async (request, response) => {
	console.log(`Request received for ${request.url}`)
	try {
		const data = await readFile(request.url.substr(1))
		// console.log ('sending request url')
		response.end(data)
	} catch(err) {
		response.end()
	}
})

server.listen(8001)