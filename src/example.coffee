{ inflate, deflate } = require("./shortSon.js")

testData = [
	{ 
		name: "John"
		lastName: "Doe"
		age: 24
		city: "Nowhere"
		planet: "Mars"
	},
	{
		name: "Jane"
		lastName: "Doe"
		age: 23
		city: "Paris"
		planet: "Jupiter"
	},
	{
		name: "Max"
		lastName: "Mustermann"
		age: -4
		city: "Here"
		planet: "That one"
	},
	{
		name: "Running"
		lastName: "outof"
		city: "ideas"
		planet: "that's bad"
	},
	{
		name: "one"
		lastName: "more"
		age: 4124
		city: "should"
		planet: "work just fine"
	}
]

compact = deflate(testData,["name","lastName","age","city","planet"])

originalLength = JSON.stringify(testData).length
compactLength = JSON.stringify(compact).length

console.log "Saved characters: #{ originalLength-compactLength } ( #{ Math.round(compactLength/originalLength*100)/10 }% shorter )"
console.log "Result: #{ JSON.stringify(compact,null,4)}"
console.log "Inflated result: #{  JSON.stringify(inflate(compact),null,4) }"


longTestData = []

for i in [0..2048]
	longTestData.push(
		name: "The #{i} person."
		age: 32
		gender: "male"
		isCool: i % 42 == 0
		isPotatoe: i % 1337 == 0
		hasSocks: true
		otherValue: false
		isWasteOfRam: true
		hopeYoureNotReadingAnymore: true
		thisExampleSux: true
	)


console.log "\n \n Round two: \n \n "

compact = deflate(longTestData,["name","age","gender","isCool","isPotatoe","hasSocks","otherValue","isWasteOfRam","hopeYoureNotReadingAnymore","thisExampleSux"])

originalLength = JSON.stringify(longTestData).length
compactLength = JSON.stringify(compact).length

console.log "Saved characters: #{ originalLength-compactLength }  ( #{ Math.round(compactLength/originalLength*100)/10 }% shorter )"

