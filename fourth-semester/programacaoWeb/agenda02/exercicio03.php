<?php

function operationNumbers($number1, $number2, $operation) {
    $resultOperation = 0;

    switch ($operation) {
        case "+":
            $resultOperation = $number1 + $number2;
            break;
        case "-":
            $resultOperation = $number1 - $number2;
            break;
        case "*":
            $resultOperation = $number1 * $number2;
            break;
        case "/":
            $resultOperation = $number1 / $number2;
            break;
        default:
            return "Operação Inválida";
    }

    return $resultOperation;

}


$number1 = 10;
$number2 = 5;
$operation = "%";

$result = operationNumbers($number1, $number2, $operation);
echo $result;