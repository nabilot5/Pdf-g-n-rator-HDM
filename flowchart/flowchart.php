<?php
use setasign\Fpdi\Fpdi;
require_once './fpdf.php';
require_once './src/autoload.php';

// Initiate FPDI
$pdf = new Fpdi();

// Initiate typeface
$pdf->AddFont('Mango', '', 'BlackMango-Regular.php');
$pdf->AddFont('Arial', '', 'arial.php');
$pdf->AddFont('Arial', 'B', 'arialbd.php');
$pdf->AddFont('OpenSans', '', 'OpenSans-Regular.php');
$pdf->AddFont('OpenSans', 'B', 'OpenSans-Semibold.php');

// Initiate sql
include './db_connexion.php';
$conn = OpenCon();

function dataBaseAdmin($id, $l, $conn)
{
    $sql = "SELECT * FROM users WHERE role=$id";
    $result = mysqli_query($conn, $sql);
    for ($i = 0; $i < $l; $i++) {
        $row = mysqli_fetch_assoc($result);
    }

    if ($row != null) {

        return iconv('UTF-8', 'windows-1252', strtoupper($row['firstname']) . ' ' . $row['lastname']);
    } else {
        return printf("There is admin missing in the database");
    }
}

// Selection of team leaders according to the data
function dataBaseTLLastname($id, $conn)
{
    $sql = "SELECT * FROM users WHERE role=$id";
    $result = mysqli_query($conn, $sql);
    $row = mysqli_fetch_assoc($result);

    if ($row != null) {
        $dataIntern = iconv('UTF-8', 'windows-1252', $row['lastname']);
        return $dataIntern;
    } else {
        return printf("There is a TL missing in the database");
    }
}
// Selection of team leaders according to the data
function dataBaseTLFirstname($id, $conn)
{
    $sql = "SELECT * FROM users WHERE role=$id";
    $result = mysqli_query($conn, $sql);
    $row = mysqli_fetch_assoc($result);

    if ($row != null) {
        $dataIntern = iconv('UTF-8', 'windows-1252', $row['firstname']);
        return $dataIntern;
    } else {
        return printf("There is a TL missing in the database");
    }
}

// set the source file
$pdf->setSourceFile('./flowchart.pdf');
/*-----------------------------------*/
// import page 1
$pdf->AddPage('L', 'A5');
$tplIdx = $pdf->importPage(1);
$pdf->useTemplate($tplIdx, 0, 0, 210);
$pdf->SetTextColor(0, 0, 0);
$pdf->SetFont('OpenSans', 'B', 20);
$pdf->Text(97, 19, 'HDM');

#####DATA#####
$pdf->SetFont('OpenSans', 'B', 9);
$pdf->SetXY(53, 33);
$pdf->MultiCell(22, 5, dataBaseAdmin(8, 1, $conn), 0, 'C', 0);
#####DATA#####
$pdf->SetFont('OpenSans', 'B', 9);
$pdf->SetXY(136, 33);
$pdf->MultiCell(22, 5, dataBaseAdmin(8, 2, $conn), 0, 'C', 0);
#####DATA#####

#####DATA#####
$pdf->SetFont('OpenSans', 'B', 9);
$pdf->Text(87.5, 61, "Marketing Digital SEO");
$pdf->SetFont('OpenSans', '', 8);
$pdf->Text(96.5, 66, iconv('UTF-8', 'windows-1250', "+journaliste"));
$pdf->SetXY(94.5, 66);
$pdf->MultiCell(20, 5, 'TL: ' . dataBaseTLFirstname(11, $conn), 0, 'C', 0);
$pdf->SetXY(94.5, 70);
$pdf->MultiCell(20, 5, dataBaseTLLastname(11, $conn), 0, 'C', 0);
#####DATA#####
$pdf->SetFont('OpenSans', 'B', 9);
$pdf->Text(123, 75, "Graphisme");
$pdf->SetFont('OpenSans', '', 8);
$pdf->SetXY(122, 77);
$pdf->MultiCell(20, 3, iconv('UTF-8', 'windows-1250', "Illustration et Web Design"));
$pdf->SetXY(126, 85);
$pdf->MultiCell(20, 3, 'TL: ' . dataBaseTLFirstname(9, $conn), 0, 'C', 0);
$pdf->SetXY(126, 88);
$pdf->MultiCell(20, 3, dataBaseTLLastname(9, $conn), 0, 'C', 0);
#####DATA#####
$pdf->SetFont('OpenSans', 'B', 9);
$pdf->SetXY(68, 72);
$pdf->MultiCell(20, 3, 'Ressources humaines', 0, 'C', 0);
$pdf->SetFont('OpenSans', '', 8);
$pdf->SetXY(68, 79);
$pdf->MultiCell(20, 3, iconv('UTF-8', 'windows-1250', "Recrutement et gestion du personnel"));
$pdf->SetXY(65, 89);
$pdf->MultiCell(20, 3, 'TL: ' . dataBaseTLFirstname(6, $conn), 0, 'C', 0);
$pdf->SetXY(65, 92);
$pdf->MultiCell(20, 3, dataBaseTLLastname(6, $conn), 0, 'C', 0);
#####DATA#####
$pdf->SetFont('OpenSans', 'B', 9);
$pdf->SetXY(66, 102);
$pdf->MultiCell(20, 3, 'Ressources humaines', 0, 'C', 0);
$pdf->SetFont('OpenSans', '', 8);
$pdf->SetXY(70, 111);
$pdf->MultiCell(20, 3, iconv('UTF-8', 'windows-1250', "Placement"));
$pdf->SetXY(69, 115);
$pdf->MultiCell(20, 3, 'TL: ' . dataBaseTLFirstname(7, $conn), 0, 'C', 0);
$pdf->SetXY(69, 118);
$pdf->MultiCell(20, 3, dataBaseTLLastname(7, $conn), 0, 'C', 0);
#####DATA#####
$pdf->SetFont('OpenSans', 'B', 9);
$pdf->SetXY(93, 118);
$pdf->MultiCell(22, 3, iconv('UTF-8', 'windows-1250', 'Développeur Web'), 0, 'C', 0);
$pdf->SetFont('OpenSans', '', 8);
$pdf->SetXY(95, 125);
$pdf->MultiCell(20, 3, iconv('UTF-8', 'windows-1250', "Teach Lead"));
$pdf->Text(95, 133, 'TL: ' . dataBaseTLFirstname(5, $conn));
$pdf->Text(100, 136, dataBaseTLLastname(5, $conn));
#####DATA#####
$pdf->SetFont('OpenSans', 'B', 9);
$pdf->SetXY(122, 102);
$pdf->MultiCell(22, 3, iconv('UTF-8', 'windows-1250', 'Business Développeur'), 0, 'C', 0);
$pdf->SetFont('OpenSans', '', 8);
$pdf->SetXY(121, 110);
$pdf->MultiCell(20, 3, iconv('UTF-8', 'windows-1250', "+Commercial B2B"));
$pdf->SetXY(120, 118);
$pdf->MultiCell(20, 3, 'TL: ' . dataBaseTLFirstname(10, $conn), 0, 'C', 0);
$pdf->SetXY(120, 121);
$pdf->MultiCell(20, 3, dataBaseTLLastname(10, $conn), 0, 'C', 0);
#####DATA#####

$pdf->Output('I', 'generated.pdf');
