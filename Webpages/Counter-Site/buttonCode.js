//setting up the queries for the buttons
let counterDisplayElem = document.querySelector ('.counter-display');
let counterPlusElem = document.querySelector ('.counter-plus');
//creating coutning variable
let count = 0;
//calling function
updateDisplay();
//making it so that button click triggers adding to the count and displays it
counterPlusElem.addEventListener("click",()=>{
    count = count +1;
    updateDisplay();
});
//create function to update display
function updateDisplay(){
    counterDisplayElem.innerHTML = count;
}