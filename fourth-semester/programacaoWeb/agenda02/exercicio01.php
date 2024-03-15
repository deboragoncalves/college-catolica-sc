<?php

/*
Desenvolva um algoritmo PHP que tenha duas variáveis quaisquer e imprima todos os valores intermediários entre estes valores
*/

$initialNumber = 5;
$finalNumber = 15;
$intermediateNumbers = "";

for ($i=$initialNumber; $i < $finalNumber; $i++) {
    $intermediateNumbers = strval($intermediateNumbers) . " " . strval($i);
}

echo $intermediateNumbers;