let firstOperatorInput = document.getElementById("firstOperator");
let secondOperatorInput = document.getElementById("secondOperator");

let resultInput = document.getElementById("result");

const validateInputs = () => {

    let validInput = true;

    if (isNaN(firstOperatorInput.value) || isNaN(secondOperatorInput.value)) {
        showInvalidMessage();
        return !validInput;
    } 

    return validInput;
}

const showInvalidMessage = () => {
    alert("Os valores informados são inválidos.");
    resultInput.value = "";
}

const sum = () => {
    if (!validateInputs()) {
        return;
    }

    resultInput.value = parseFloat(firstOperatorInput.value) + parseFloat(secondOperatorInput.value);
    resultInput.value = Math.round(resultInput.value);
}

let buttonSum = document.querySelector("#plus");
buttonSum.addEventListener("click", sum);

const reduce = () => {
    if (!validateInputs()) {
        return;
    }

    resultInput.value = parseFloat(firstOperatorInput.value) - parseFloat(secondOperatorInput.value);
    resultInput.value = Math.round(resultInput.value);
}

let buttonReduce = document.querySelector("#reduce");
buttonReduce.addEventListener("click", reduce);

const multiple = () => {
    if (!validateInputs()) {
        return;
    }

    resultInput.value = parseFloat(firstOperatorInput.value) * parseFloat(secondOperatorInput.value);
    resultInput.value = Math.round(resultInput.value);
}

let buttonMultiple = document.querySelector("#multiple");
buttonMultiple.addEventListener("click", multiple);

const division = () => {
    if (!validateInputs()) {
        return;
    }

    resultInput.value = parseFloat(firstOperatorInput.value) / parseFloat(secondOperatorInput.value);
    resultInput.value = Math.round(resultInput.value);
}

let buttonDivision = document.querySelector("#division");
buttonDivision.addEventListener("click", division);
