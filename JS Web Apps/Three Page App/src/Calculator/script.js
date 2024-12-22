function appendToDisplay(value) {
    const display = document.getElementById("display");
    display.value += value;
}

function clearDisplay() {
    const display = document.getElementById("display");
    display.value = '';
}

function calculateResult() {
    const display = document.getElementById("display");
    try {
        display.value = eval(display.value);
    } catch {
        display.value = 'Error';
    }
    if (display.value = 'Infinity') {
        display.value = 'Cannot Divide by 0'
        const buttons = document.querySelectorAll('button');
        buttons.forEach(button => button.disabled = true);
        document.getElementById('clear').disabled = false;
    }
}