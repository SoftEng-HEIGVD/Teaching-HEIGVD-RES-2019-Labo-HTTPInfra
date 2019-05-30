var Chance = require('chance');
var chance = new Chance(); 

var express = require('express');
var app = express(); 

app.get('/test', function(req, res){
	res.send("Hello RES - test is working");
});

app.get('/', function(req, res){
	res.send(generateStudents());
});


app.listen(3000, function(){
	console.log('Accepting HTTP requests on port 3000.');
});



function generateStudents(){
	var numberOfStudents = chance.integer({
		min : 0,
		max : 10
	});
	
	console.log(numberOfStudents);
	
	var Students = [];
	
	for(var i = 0; i < numberOfStudents; ++i){
        var gender = chance.gender();
		Students.push({
            
            firstName   : chance.first({ gender: gender }),
            lastName    : chance.last(),
            gender 		: gender,
			birthday	: chance.birthday({year : chance.year({min : 1980,max : 2000})} )
		});
	}
	console.log(Students);
	return Students;
}