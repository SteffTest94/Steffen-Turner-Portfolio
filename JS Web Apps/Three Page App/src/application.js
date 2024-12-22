localStorage.setItem("username", "User1");
localStorage.setItem("password", "P@ssWord");
//I am aware this is not the most secure method for setting a username and password, but as we
//are not working with servers in this particular class/assignment it seemed like the easiest
//way to go set a username and password
var logInInfo = document.querySelector("form");
console.log();
logInInfo.addEventListener("submit", function(attempt) {
    attempt.preventDefault();
    var userAttempt = logInInfo.elements.user.value;
    var passwordAttempt = logInInfo.elements.password.value;
    try {
        if (userAttempt + passwordAttempt  === localStorage.getItem("username") + localStorage.getItem("password")) {
            //attatched date info to session so that it could easily be pulled from across all pages
            sessionStorage.setItem("time", new Date().getTime());
            //this code is native to the index's/login application, but is isolated in its own document for the other pre-constructed pages.
            var startLogTime = sessionStorage.getItem("time");
            sessionStorage.setItem("time", startLogTime);
            setInterval(function() {
            var timeLogged = new Date() - startLogTime;
            var secondsTotal = timeLogged/1000;
            var hours = Math.floor(secondsTotal / 3600);
            var minutes = Math.floor(secondsTotal / 60) % 3600;
            var seconds = Math.floor(secondsTotal)  % 60;
            document.getElementById('timer').innerHTML = "You have been logged in for: " + hours + ":" + minutes + ":" + seconds;
           
        }, 1000);

            const logInForm = document.getElementById("login");
            logInForm.hidden = true;
            const dropDown = document.getElementById("dropdown");
            dropDown.hidden = false;
            dropDown.addEventListener("click", openCalculator()); {
                const choice = this.value;
                if (choice == "calculator"); {
                    window.location.href = "Calculator/calculator.html";
                } elseif (choice == "tictactoe"); {
                    window.location.href = "TicTacToe/tictactoe.html";
                }
            }
        } else { 
            document.getElementById("wrong-info").innerHTML = "This information is incorrect, please try again."
        }
    } 
        //I considered using catch to handle wrong user information, but decided to just keep it for generic erorr handling.
        catch (error){
        document.getElementById("error").innerHTML = write.error()
    }
}

)

