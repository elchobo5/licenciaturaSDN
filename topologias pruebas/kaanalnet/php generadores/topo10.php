<?php

$arreglo = array();
$arreglo["name"] = "topo10";
$arreglo["switches"] = array();
for ($i = 0; $i < 1; $i++) {
	$j = $i + 1;
	$arreglo["switches"][$i] = array('name' => "s".$j, 'type' => "lan");
}

$arreglo["nodes"] = array();
for ($i = 0; $i < 1000; $i++) {
	$j = $i + 1;
	$arreglo["nodes"][$i] = array('name' => "h".$j, 'type' => "host");
}
$arreglo["links"] = array();
$arreglo["links"][0]["name"] = "s1";
for ($i = 0; $i < 1000; $i++) {
	$j = $i + 1;
	$arreglo["links"][0]["connected_nodes"][$i]["name"] = "h".($j);
}

$json = json_encode($arreglo);

print_r($json);

?>