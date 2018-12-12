<?php
require 'fpdf/fpdf.php';
class PDF extends FPDF
{
    function Header()
    {
        $this->Image('images/logorpt.png',10,5,30);
        $this->SetFont('Arial','B',15);
        $this->Cell(30);
        $this->Cell(0,10,'REPORTE DE FUNCIONARIOS',0,0,'C');
        
        $this->Ln(25);
        
    }
    function Footer()
    {
        $this->SetY(-15);
        $this->SetFont('Arial','I',8);
        $this->Cell(0,10,'Pagina '.$this->PageNo().'/{nb}',0,0,'C');
        
    }
} 
?>


