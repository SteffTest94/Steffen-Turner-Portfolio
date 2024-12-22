var startLogTime = sessionStorage.getItem("time");
           setInterval(function() {
            var timeLogged = new Date() - startLogTime;
            var secondsTotal = timeLogged/1000;
            var hours = Math.floor(secondsTotal / 3600);
            var minutes = Math.floor(secondsTotal / 60) % 3600;
            var seconds = Math.floor(secondsTotal)  % 60;
            document.getElementById('timer').innerHTML = "You have been logged in for: " + hours + ":" + minutes + ":" + seconds;
           }, 1000)
