<?php
    include 'plantilla.php';
    require 'conexion.php';

    $query= "SELECT nombres,paterno,materno FROM funcionario";//consulta
    $resultado = $mysqli->query($query);

    $pdf=new PDF();
    $pdf->AliasNbPages();
    $pdf->AddPage('L');

    $pdf->SetFillColor(232,232,232);
    $pdf->Cell(250,6,date('d/m/y'),0,1,'R');
    $pdf->SetFont('Arial','B',12);
    $pdf->Cell(50,6,'NOMBRE',1,0,'C',1);
    $pdf->Cell(50,6,'PATERNO',1,0,'C',1);
    $pdf->Cell(50,6,'MATERNO',1,1,'C',1);


    $pdf->SetFont('Arial','',10);

    while ($row = $resultado->fetch_assoc())
    {
        $pdf->Cell(50,6,($row['nombres']),1,0,'C');
        $pdf->Cell(50,6,($row['paterno']),1,0,'C');
        $pdf->Cell(50,6,($row['materno']),1,1,'C');
    }
    $pdf->Output();
?>