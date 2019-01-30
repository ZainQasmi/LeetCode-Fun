// TO RUN
// http://localhost:8001/client.html


const appid = 'ad4512e415304a34654968b5035e7879'
const url = 'http://api.openweathermap.org/data/2.5/weather?units=metric'
// const url = 'http://api.openweathermap.org/data/2.5/weather?&APPID=ad4512e415304a34654968b5035e7879&units=metric'
// const url = 'http://samples.openweathermap.org/data/2.5/forecast?q=M%C3%BCnchen,DE&appid=b1b15e88fa797225412429c1c50c122a1'


let temp = 0
let city = ''

async function handleSubmit(event) { // Should try/catch errors
	event.preventDefault()
	const resp = await fetch (`${url}&appid=${appid}&q=${city}`)
	const data = await resp.json()	
	temp = data.main.temp
	redraw()
}

function redraw() {
	ReactDOM.render(
		React.createElement('form', {onSubmit: handleSubmit},
			React.createElement('input',{
				type: 'text',
				onChange: ev => city = ev.target.value
			}),
			React.createElement('input', {
				type: 'submit',
				value: 'Go get temperature'
			}),
			React.createElement(`h2`, null, `temperature is ${temp}`))
		, document.getElementById('root'))
}

redraw()