const WIDTH = 80;
const mattMsg = "Hey Matt, go fuck yourself."

const commands = {
  "help": {
    aliases: []
  }"-h"        : help(),
  "-H"        : help(),
  "h"         : help(),
  "H"         : help(),
  "help"      : help(),
  "Help"      : help(),
  "projects": : projects(),
  "Projects"  : projects(),
  "chopin"    : printCharOneByOne(mattMsg);
}
function mountCommandLine(document) {
  var kamille = document.getElementById("kamilleotron");
  var kContainer = document.getElementById("kContainer");
  const available = ["help", "projects"]

  // function linkify(cmd) {
  //   var fieldset = document.createElement('fieldset');
  //   var hiddenInput = document.createElement('input');
  //   var submitButton = document.createElement('button');
  //
  //   hiddenInput.value = cmd;
  //   submitButton.setAttribute('type', 'submit');
  //   submitButton.classList += "cmd";
  //   submitButton.innerText = cmd;
  //   submitButton.addEventListener("click", function(e) {
  //     e.preventDefault();
  //     console.log(cmd);
  //   })
  //   fieldset.append(hiddenInput);
  //   fieldset.append(submitButton);
  //   return fieldset;
  // }
  breaker = () => {
    kamille.append(document.createElement('br'));
  }

  lefty = () => {
    kamille.append(` │ `);
  }

  printCharOneByOne = (statement, i = 0, t = 0) => {
    var del = Math.floor(Math.random() * 10) + 20;
    var interval = setInterval(function(){
      kamille.innerHTML += statement.charAt(i);
      i++;
      t += del;
      if (i > statement.length){
        clearInterval(interval);
        breaker();
      }
    }, del);
  }

  writeCmd = (val) => {
    commandPrompt.value = "";
    kamille.append("< " + val);
    breaker();
    parseCmd(val);
  }

  parseCmd = (command) => {
    var resp;
    switch (command) {
      case "-h":
      case "-H":
      case "h":
      case "H":
      case "help":
      case "Help":
        resp = help();
        break;
      case "projects":
      case "Projects":
        resp = projects();
        break;
      case "chopin":
      case "Chopin":
        resp = printCharOneByOne("hey Matt, go fuck yourself");
        break;
      default:
        resp = "command not recognized!";
    }
    return resp;
  }


  //================================  help()  ==================================
  function help() {
  // DESCRIPTION
  //   formats and prints available commands to console
  // PARAMETERS
  //   none
  // RETURNS
  //   none
    available.forEach(cmd => {
      var cmdLink = document.createElement('button');
      cmdLink.setAttribute("onclick", `writeCmd("${cmd}")`);
      cmdLink.innerText = cmd;
      cmdLink.classList += "cmd";
      kamille.append(` ╶◎ `);
      kamille.append(cmdLink);
      breaker();
    })
    document.getElementById('commandPrompt').scrollIntoView();
  }

  //============================  projects()  ===============================
  async function projects() {
  // DESCRIPTION
  //   pings my rails backend for json dump of projects
  //   formats and prints projects to console
  // PARAMETERS
  //   none
  // RETURNS
  //   array of projects as json strings
    //--------------------  get projects json from rails  ----------------------
    try {
      const response = await fetch('http://0.0.0.0:3000/projects.json');
      let arr = [];
      let result = await response.json();
      //-----------------------  process each project --------------------------
      result.forEach(async val => {
        arr.push(JSON.stringify(val));
        var projectLink = document.createElement('a');
        projectLink.setAttribute("href", val.url);
        projectLink.setAttribute("target", "_blank");
        projectLink.innerText = val.name;
        projectLink.classList += "cmd";
        kamille.append(` ╭◎ `);
        kamille.append(projectLink);
        w = Math.floor(window.innerWidth / 11);
        const WINDOWWIDTH = (WIDTH > w ? w : WIDTH);

        kamille.append(` ◎`.padEnd(WINDOWWIDTH - val.name.length - 4, "╶"))
        kamille.append(`◎`)
        breaker();

        var d = new Date(val.when)
        var md = moment(d).format("MMMM YYYY");
        lefty();
        kamille.append(md);
        breaker();

        // split description so each line has box-left border
        var words = val.description.split(" ");
        var lines = [""];
        var currLine = 0;
        words.forEach(word => {
          var currLen = (lines[currLine]).length;
          var lenToAdd = word.length
          if ((currLen + lenToAdd) >= (WINDOWWIDTH-1)) {
            currLine++;
            lines[currLine] = "";
          }
          lines[currLine] += `${word} `
        })
        console.log("lines: ", lines)
        lines.forEach(line => {
          lefty();
          kamille.append(` ${line}`);
          breaker();
        })
        kamille.append(` ╰◎`);
        breaker();
        document.getElementById('commandPrompt').scrollIntoView();
      })
      return arr
    }
    catch (err) { kamille.append("> Error fetching resume: ", err); breaker(); }
  }

//---------------------------  printCharOneByOne()  ----------------------------


//------------------------------  initial prompt  ------------------------------
  t = 0;

//--------------------------------  input line  --------------------------------
  var commandForm = document.createElement('form');
  var commandPrompt = document.createElement('input');
  commandPrompt.setAttribute("id", "commandPrompt");
  commandPrompt.setAttribute("type", "text");
  commandPrompt.setAttribute("autofocus", "true");
  commandForm.appendChild(commandPrompt);
  commandForm.setAttribute("id", "commandForm");
  commandForm.setAttribute("autocomplete", "off")
  setTimeout(function() {
    kContainer.append("> ");
    kContainer.append(commandForm);
  }, t+1000);
//-------------------------  handle command input  -----------------------------
  commandForm.addEventListener("submit", function(e){
    e.preventDefault();

    var command = commandPrompt.value;
    writeCmd(command);

    // t = -900;
    // charTime = del;
    // lineTime = 1000;
    // setTimeout(() => {
    //   kamille.append("> ");
    //   var i = 0;
    //   printCharOneByOne(resp, i , t);
    // }, t += lineTime);
  });
}
