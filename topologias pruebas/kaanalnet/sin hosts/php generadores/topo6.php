<?php

$arreglo = array();
$arreglo["name"] = "topo6";
$arreglo["switches"] = array();
for ($i = 0; $i < 30; $i++) {
	$j = $i + 1;
	$arreglo["switches"][$i] = array('name' => "s".$j, 'type' => "lan");
}

$arreglo["nodes"] = array();
/*for ($i = 0; $i < 120; $i++) {
	$j = $i + 1;
	$arreglo["nodes"][$i] = array('name' => "h".$j, 'type' => "host");
}*/
$arreglo["links"] = array();
for ($i = 0; $i < 30; $i++) {
	$j = $i + 1;
	$arreglo["links"][$i]["name"] = "s".$j; 
	/*$arreglo["links"][$i]["connected_nodes"][0]["name"] = "h".($j*4-3);
	$arreglo["links"][$i]["connected_nodes"][1]["name"] = "h".($j*4-2);
	$arreglo["links"][$i]["connected_nodes"][2]["name"] = "h".($j*4-1);
	$arreglo["links"][$i]["connected_nodes"][3]["name"] = "h".($j*4);*/
	if ($j == 30)
		$arreglo["links"][$i]["connected_switches"][0]["name"] = "s1";
	else 
		$arreglo["links"][$i]["connected_switches"][0]["name"] = "s".($j+1);
}

$json = json_encode($arreglo);

print_r($json);

?>