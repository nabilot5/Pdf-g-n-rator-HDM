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

// Initiate id of user
$id = $_GET['id'];

// Retrieve all data linked with the user id
$sql = "SELECT * FROM users WHERE id = " . $id;
$result = mysqli_query($conn, $sql);
if (mysqli_num_rows($result) > 0) {
    while ($row = mysqli_fetch_assoc($result)) {
        $array_values[] = $row;
    }
} else {
    echo "0 results";
}
$res = $array_values;

// Selection country
function dataBaseCountry($id, $conn)
{
    $sql = "SELECT * FROM country WHERE id=" . $id;
    $result = mysqli_query($conn, $sql != null ? $sql : printf('database error'));
    $row = mysqli_fetch_assoc($result);

    if ($row != null) {
        return iconv('UTF-8', 'windows-1252', $row['name']);
    } else {
        return "There is a country missing in the database";
    }
}

// Selection role
function dataBaseRole($id, $conn)
{
    $sql = "SELECT * FROM role WHERE id=$id";
    $result = mysqli_query($conn, $sql);
    $row = mysqli_fetch_assoc($result);

    if ($row != null) {

        return iconv('UTF-8', 'windows-1252', $row['name']);
    } else {
        return printf("There is a country missing in the database");
    }
}

// set the source file
$pdf->setSourceFile('./termination.pdf');
$pdf->SetTextColor(0, 0, 0);
$pdf->SetFont('OpenSans', '', 12);
/*-----------------------------------*/

## Tags
$name = iconv('UTF-8', 'windows-1252', $res[0]['firstname'] . ' ' . $res[0]['lastname']);
$birthday = date("d/m/Y", strtotime($res[0]["birthday"] != null));
$nationality = dataBaseCountry($res[0]["country"], $conn);
$role = iconv('UTF-8', 'windows-1252', dataBaseRole($res[0]['role'], $conn));
$localisation = iconv('UTF-8', 'windows-1252', $res[0]['street_number'] . ' ' . $res[0]['street'] . ', ' . $res[0]['city'] . ' ' . strtoupper(dataBaseCountry($res[0]["country"], $conn)));

// import page 1
$pdf->AddPage('', 'A4');
$tplIdx = $pdf->importPage(1);
$pdf->useTemplate($tplIdx, 0, 0, 210);
$pdf->Text(34, 64.5, $name != null ? $name : 'NoName');
$pdf->Text(40, 69.90, $birthday != null ? $birthday : 'NoBirthday');
$pdf->Text(67, 74.70, $role != null ? $role : 'NoRole');
$pdf->Text(48, 79.80, $localisation != null ? $localisation : 'NoLocalisation');

// import page 2
$pdf->AddPage('', 'A4');
$tplIdx = $pdf->importPage(2);
$pdf->useTemplate($tplIdx, 0, 0, 210);

// import page 3
$pdf->AddPage('', 'A4');
$tplIdx = $pdf->importPage(3);
$pdf->useTemplate($tplIdx, 0, 0, 210);

// import page 4
$pdf->AddPage('', 'A4');
$tplIdx = $pdf->importPage(4);
$pdf->useTemplate($tplIdx, 0, 0, 210);

// import page 5
$pdf->AddPage('', 'A4');
$tplIdx = $pdf->importPage(5);
$pdf->useTemplate($tplIdx, 0, 0, 210);
$pdf->SetXY(88, 172);
$pdf->Cell(30, 3, iconv('UTF-8', 'windows-1252', $res[0]['lastname']), 0, 0, 'C');
$pdf->SetXY(88, 177);
$pdf->Cell(30, 3, iconv('UTF-8', 'windows-1252', $res[0]['firstname']), 0, 0, 'C');

$pdf->Output('I', 'generated.pdf');
