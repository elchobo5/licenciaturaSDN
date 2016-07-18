<?php

$arreglo = array();
$arreglo["name"] = "topo8";
$arreglo["switches"] = array();
for ($i = 0; $i < 73; $i++) {
	$j = $i + 1;
	$arreglo["switches"][$i] = array('name' => "s".$j, 'type' => "lan");
}

$arreglo["nodes"] = array();
/*for ($i = 0; $i < 512; $i++) {
	$j = $i + 1;
	$arreglo["nodes"][$i] = array('name' => "h".$j, 'type' => "host");
}*/
$arreglo["links"] = array();
$arreglo["links"][0]["type"] = "lan";
$arreglo["links"][0]["switches"] = array();
$nodoArbol = 2;
$hostArbol = 1;
$profundidad = 0;
for ($i = 0; $i < 73; $i++) {
	$j = $i + 1;
	if ($profundidad < 2) {
		$arreglo["links"][0]["switches"][$i]["name"] = "s".$j;
		$arreglo["links"][0]["switches"][$i]["connected_switches"][0]["name"] = "s".($nodoArbol);
		$arreglo["links"][0]["switches"][$i]["connected_switches"][1]["name"] = "s".($nodoArbol + 1);
		$arreglo["links"][0]["switches"][$i]["connected_switches"][2]["name"] = "s".($nodoArbol + 2);
		$arreglo["links"][0]["switches"][$i]["connected_switches"][3]["name"] = "s".($nodoArbol + 3);
		$arreglo["links"][0]["switches"][$i]["connected_switches"][4]["name"] = "s".($nodoArbol + 4);
		$arreglo["links"][0]["switches"][$i]["connected_switches"][5]["name"] = "s".($nodoArbol + 5);
		$arreglo["links"][0]["switches"][$i]["connected_switches"][6]["name"] = "s".($nodoArbol + 6);
		$arreglo["links"][0]["switches"][$i]["connected_switches"][7]["name"] = "s".($nodoArbol + 7);
	}
	else { 
		/*$arreglo["links"][0][$i]["connected_nodes"][0]["name"] = "h".($hostArbol);
		$arreglo["links"][0][$i]["connected_nodes"][1]["name"] = "h".($hostArbol + 1);
		$arreglo["links"][0][$i]["connected_nodes"][2]["name"] = "h".($hostArbol + 2);
		$arreglo["links"][0][$i]["connected_nodes"][3]["name"] = "h".($hostArbol + 3);
		$arreglo["links"][0][$i]["connected_nodes"][4]["name"] = "h".($hostArbol + 4);
		$arreglo["links"][0][$i]["connected_nodes"][5]["name"] = "h".($hostArbol + 5);
		$arreglo["links"][0][$i]["connected_nodes"][6]["name"] = "h".($hostArbol + 6);
		$arreglo["links"][0][$i]["connected_nodes"][7]["name"] = "h".($hostArbol + 7);*/
		$hostArbol = $hostArbol + 8;
	}
	$nodoArbol = $nodoArbol + 8;
	if (($i == 0) || ($i == 8) || ($i == 64))
		$profundidad++;
}

$json = json_encode($arreglo);

print_r($json);

?>