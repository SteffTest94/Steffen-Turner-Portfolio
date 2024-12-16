const getPokemon = "https://pokeapi.co/api/v2/pokemon?limit=151";

//to help keep things together
document.addEventListener("DOMContentLoaded", () =>{
//consistent lets / backend utils
let dropDown = document.querySelector('#pokelist');
renderEverything()
let selectPokemon = document.querySelector('#pokemon')

dropDown.addEventListener('change', renderSinglePokemon)

//i have been trying to get this accursed drop down
//to populate all week. f m l
//i'm keeping it hidden just to immortalize my own hubris and
//stubborn futility
//function createDropdown () {
 //   fetch(getPokemon)
//    .then(response => response.json())
//    .then(function(allpokemon){
 //       allpokemon.results.forEach(function(pokemon){
 //           addEle.text = pokemon.name
 //           addEle.value = 'pokemon'
 //           dropDown.append(addEle)
            //console.log(addEle)
  //      })
 //   })
//}



function renderEverything(){
    let allPokemonContainer = document.querySelector('#poke-container')
    allPokemonContainer.innerText = "";
    fetchPokemon();
}

//attempt at rendering single pokemon
function renderSinglePokemon() {
    let allPokemonContainer = document.querySelector('#poke-container')
    allPokemonContainer.innerText = ""
    fetchLonePokemon()
    console.log()
}

//initial fetch for all pokemon
function fetchPokemon(){
    fetch(getPokemon)
    .then(response => response.json())
    .then(function(allpokemon){
        allpokemon.results.forEach(function(pokemon){
            fetchDropData(pokemon);
        })
    })
}
//attempt to fetch single pokemon
function fetchLonePokemon(){
    fetch(getPokemon)
    .then (response => response.json())
    .then (function(singlepokemon){
        singlepokemon.results.forEach(function(pokemon){
        let findPokemon = selectPokemon
        let foundPokemon = singlepokemon.results.filter((singlepokemon) =>
            singlepokemon.name == findPokemon)
        fetchPokemonData(pokemon)
        console.log(findPokemon)
    })
}

)}
//fetchLonePokemon()

//fetching all pokemon data for renders
function fetchPokemonData(pokemon){
    let url = pokemon.url 
    fetch(url)
    .then(response => response.json())
    .then(function(pokeData){
        renderPokemon(pokeData)
    })
}

function fetchDropData(pokemon){
    let url = pokemon.url 
    fetch(url)
    .then(response => response.json())
    .then(function(dropData){
        createDropdown(dropData)

    })
}

//renders ALL pokemon (currently). usefull as it creates divs
//on webpage
function renderPokemon(dropData){
    let allPokemonContainer = document.getElementById('poke-container');
    let pokeContainer = document.createElement("div") //div will be used to hold the data/details for indiviual pokemon.{}
    let pokeName = document.createElement('h4')
    pokeName.innerText = dropData.name
    let pokeNumber = document.createElement('p')
    pokeNumber.innerText = `#${dropData.id}`
    let pokeTypes = document.createElement('ul') 
    //ul list will hold the pokemon types
    createTypes(dropData.types, pokeTypes) 
    // helper function to go through the types array and create li tags for each one
    pokeContainer.append(pokeName, pokeNumber, pokeTypes);   
    //appending all details to the pokeContainer div
    allPokemonContainer.appendChild(pokeContainer);       
    //appending that pokeContainer div to the main div which will 
    //hold all the pokemon cards
}

//createes seperate type 'sheet'
function createTypes(types, ul){
    types.forEach(function(type){
        let typeLi = document.createElement('li');
        typeLi.innerText = type['type']['name'];
        ul.append(typeLi)
    })
}
//eyyy have the dropdown working seperately!!!

function createDropdown (dropData) {
    let allPokemonContainer = document.querySelector('#poke-container')
    let addEle = document.createElement('option');
    JSON.stringify(dropData.name)
    toCapitilize = dropData.name
    capitilized = toCapitilize[0].toUpperCase() + toCapitilize.slice(1)
    addEle.value = 'pokemon'
    allPokemonContainer.innerText = ""
    addEle.innerText = capitilized
    dropDown.append(addEle)
}

})