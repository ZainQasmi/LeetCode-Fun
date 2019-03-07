// Imagine you are working on a HR system for a small company. The company has several teams, and each team a handful of employees.

// What you are asked to do is to print out the year-end bonus report for employees. 

// Write a function printBonusReport that returns a JSON-formatted report, as below:

// {
//   report: [
//         {employeeId: 30105, 
//           employeeName: 'John Young',
//           teamId: 901,
//           teamName: 'Operations',
//           bonus: 1829.65},
//         {employeeId: 30106, 
//           employeeName: 'William Black',
//           teamId: 902,
//           teamName: 'HR',
//           bonus: 3311.09},
//          {....},
//          {....},
//     ]
// }

 
// You are given a few API endpoints to get data from as below (Note that these are made-up endpoints, the HackerRank platform will not return any data).

// ------ 1 ------

// API name: Get teams

// method: GET

// url: https://domain/api/teams

// explanation: return a list of teams for the company

// result format: {data: [ {teamId: 855, teamName: 'Finance', memberCount:  32}, {teamId: 901, teamName: Operations, memberCount: 1} ]}
 

// ------ 2 ------

// API name: Get employees in team

// method: GET

// url: https://domain/api/teams/:teamId/employees

// explanation: return a list of employees for the team

// result format: {data: [ {employeeId: 30001, employeeName: 'Jon Snow'}, {employeeId: 30002, employeeName: 'Ho Door'} ]}
 

// ------ 3 ------

// API name: Get employee bonus

// method: GET

// url: https://domain/api/teams/:teamId/employees/:employeeId/bonus

// explanation: return bonus for an employee

// result format: {data: {employeeId: 30001, bonus: 3988.2}}


function printReport() {
  // get teamId's from 'Get teams method'

  let firstPromise = function() {
    let getTeamsPromise = new Promise(function(resolve, reject) {
      let getTeams = JSON.parse($.get('https://domain/api/teams'))

    })
    return getTeamsPromise;
  }


  let secondPromise = function(data) {
    let 
  }

  // async await


  for (let oneTeam in getTeams) {
    // use teamId's in Get employees method to GET employee details
    let teamID = oneTeam.teamID
    let getEmployees = JSON.parse($.get('https://domain/api/teams/:`${teamID}`/employees')) //Not sure about teamID syntax

    for (let oneEmployee in getEmployees) {
      let employeeId = oneEmployee.employeeId
      let getBonus = JSON.parse($.get('https://domain/api/teams/:`${teamId}`/employees/:`{employeeId}`/bonus'))



    }

    

  }


  firstPromise()
  .then(data => secondPromise(data))
  .then(thirdPromise);


  // for each employee get his bonus (using employeeID and his/her teamID)

  
}