const WIDTH = 80;
function mountCommandLine(document) {
  var kamille = document.getElementById("kamilleotron");
  var kContainer = document.getElementById("kContainer");
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

  //============================  getProjects()  ===============================
  async function getProjects(cmd) {
  // DESCRIPTION
  //   pings my rails backend for json dump of projects
  //   formats and prints projects to console
  // PARAMETERS
  //   cmd: string command entered by user for appending to the kamilleotron
  // RETURNS
  //   array of projects as json strings
    //-------------------------  handle user input  ----------------------------
    commandPrompt.value = "";
    var br = document.createElement("br");
    kamille.append("< " + cmd);
    kamille.append(br);
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
        projectLink.setAttribute("target", "_blank")
        projectLink.innerText = val.name;
        kamille.append(` ┌─ `);
        kamille.append(projectLink);
        var w = WIDTH
        if (w > Math.floor(window.innerWidth / 11)) {
          w = Math.floor(window.innerWidth / 11);
        }

        kamille.append(` ──`.padEnd(w - val.name.length - 3, "─"))
        breaker();

        kamille.append(` │ `);
        var d = new Date(val.when).toUTCString()
        kamille.append(d)
        breaker();

        var w = WIDTH
        kamille.append(` │ `);
        kamille.append(val.description);
        breaker();
        kamille.append(` └`.padEnd(w - 13, "─"))
        breaker();
      })
      return arr
    }
    catch (err) { kamille.append("> Error fetching resume: ", err); breaker(); }
  }

//---------------------------  printCharOneByOne()  ----------------------------
  var del = Math.floor(Math.random() * 10) + 20;
  var printCharOneByOne = function(statement, i, t) {
    var interval = setInterval(function(){
      kamille.innerHTML += statement.charAt(i);
      i++;
      t += del;
      if (i > statement.length){
        clearInterval(interval);
        breaker;
      }
    }, del);
  }

//------------------------------  initial prompt  ------------------------------
  t = 0;
  charTime = del;
  lineTime = 1000;
  setTimeout(() => {
    kamille.append("> ");
    var i = 0;
    printCharOneByOne("or type -h for help", i , t);
  }, t += lineTime);

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
    var br = document.createElement('br');
    var br2 = document.createElement('br');
    var command = commandPrompt.value;
    var resp;
    switch (command) {
      case "-h":
      case "-H":
      case "h":
      case "H":
        resp = `available commands: ${command}, projects`;

        break;
      case "projects":
      case "Projects":
        getProjects(command);
        return
        break;
      case "chopin":
      case "Chopin":
        resp = "hey Matt, go fuck yourself";
        break;
      default:
        resp = "command not recognized!";
    }

//---------------------------------  response  ---------------------------------
    commandPrompt.value = "";

    kamille.append("< " + command);
    kamille.append(br);

    t = -900;
    charTime = del;
    lineTime = 1000;
    setTimeout(() => {
      kamille.append("> ");
      var i = 0;
      printCharOneByOne(resp, i , t);
    }, t += lineTime);
  });
}
