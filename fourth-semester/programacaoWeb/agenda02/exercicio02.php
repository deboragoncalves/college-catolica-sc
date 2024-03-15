<?php

$yearMonths = array();
array_push($yearMonths, "Janeiro");
array_push($yearMonths, "Fevereiro");
array_push($yearMonths, "Março");
array_push($yearMonths, "Abril");
array_push($yearMonths, "Maio");
array_push($yearMonths, "Junho");
array_push($yearMonths, "Julho");
array_push($yearMonths, "Agosto");
array_push($yearMonths, "Setembro");
array_push($yearMonths, "Outubro");
array_push($yearMonths, "Novembro");
array_push($yearMonths, "Dezembro");

date_default_timezone_set('America/Sao_Paulo');

$fullDate = new DateTime();
$dateFormat = new IntlDateFormatter('pt_BR',
                                    IntlDateFormatter::LONG,
                                    IntlDateFormatter::NONE,
                                    'America/Sao_Paulo',          
                                    IntlDateFormatter::GREGORIAN);

$todayFullDateFormat = $dateFormat->format($fullDate);
$dateToday = date('d-m-Y');

echo $dateToday . "\n" . $todayFullDateFormat;