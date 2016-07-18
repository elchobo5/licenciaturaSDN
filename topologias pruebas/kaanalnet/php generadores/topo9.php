<?php

$arreglo = array();
$arreglo["name"] = "topo9";
$arreglo["switches"] = array();
for ($i = 0; $i < 127; $i++) {
	$j = $i + 1;
	$arreglo["switches"][$i] = array('name' => "s".$j, 'type' => "lan");
}

$arreglo["nodes"] = array();
for ($i = 0; $i < 128; $i++) {
	$j = $i + 1;
	$arreglo["nodes"][$i] = array('name' => "h".$j, 'type' => "host");
}
$arreglo["links"] = array();
$arreglo["links"][0]["type"] = "lan";
$arreglo["links"][0]["switches"] = array();
$nodoArbol = 2;
$hostArbol = 1;
$profundidad = 0;
for ($i = 0; $i < 127; $i++) {
	$j = $i + 1;
	$arreglo["links"][0]["switches"][$i]["name"] = "s".$j;
	if ($profundidad < 6) {
		$arreglo["links"][0]["switches"][$i]["connected_switches"][0]["name"] = "s".($nodoArbol);
		$arreglo["links"][0]["switches"][$i]["connected_switches"][1]["name"] = "s".($nodoArbol + 1);
	}
	else { 
		$arreglo["links"][0]["switches"][$i]["connected_nodes"][0]["name"] = "h".($hostArbol);
		$arreglo["links"][0]["switches"][$i]["connected_nodes"][1]["name"] = "h".($hostArbol + 1);
		$hostArbol = $hostArbol + 2;
	}
	$nodoArbol = $nodoArbol + 2;
	if (($i == 0) || ($i == 2) || ($i == 6)|| ($i == 14)|| ($i == 30)|| ($i == 62)|| ($i == 126))
		$profundidad++;
}

$json = json_encode($arreglo);

print_r($json);

?>