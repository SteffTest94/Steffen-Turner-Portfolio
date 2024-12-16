function addTo() {
    num1 = Number(document.getElementById("firstNumber").value);
    num2 = Number(document.getElementById("secondNumber").value);
    document.getElementById("answer").innerHTML = num1 + num2;
}
function subtractFrom() {
    num1 = Number(document.getElementById("firstNumber").value);
    num2 = Number(document.getElementById("secondNumber").value);
    document.getElementById("answer").innerHTML = num1 - num2;
}
function multiply() {
    num1 = Number(document.getElementById("firstNumber").value);
    num2 = Number(document.getElementById("secondNumber").value);
    document.getElementById("answer").innerHTML = num1 * num2;
}
function divide() {
    num1 = Number(document.getElementById("firstNumber").value);
    num2 = Number(document.getElementById("secondNumber").value);
    document.getElementById("answer").innerHTML = num1 / num2;
}