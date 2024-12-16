const getJoke = "https://api.chucknorris.io/jokes/random";
const gettingJoke = document.getElementById("joke");
const newJoke = document.getElementById("newjoke");
function enableButton () {
    document.getElementById("newjoke").disabled=false
}
function showJoke () {
     fetch(getJoke)
  .then((response) => response.json())
  .then((data) => {
    const joke = data.value;
    window.alert(joke).onclose(enableButton);
  })
  .catch((error) => {
    console.error("Error:", error);
  })};
  gettingJoke.addEventListener('click', showJoke);
  newJoke.addEventListener('click', showJoke);


