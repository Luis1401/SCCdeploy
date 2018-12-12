<?php
$mysqli = new mysqli('localhost','root','','combustible_ucatec');
if($mysqli->connect_error){
    die ('Error en la conexion' . $mysqli->connect_error);
}
//printf ("La conexion a la Base de datos se ha realizado con exito; La version del  sevidor es : %s\n", $mysqli->server_info);
?>