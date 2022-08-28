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
if (!isset($id)) {
    $id = 1;
}
// Set the source file to load pages
$pdf->setSourceFile('./internshipAgreement.pdf');

// Selection of admin
function dataBaseAdmin($id, $l, $conn)
{
    $sql = "SELECT * FROM users WHERE role=$id";
    $result = mysqli_query($conn, $sql);
    for ($i = 0; $i < $l; $i++) {
        $row = mysqli_fetch_assoc($result);
    }

    if ($row != null) {
        return iconv('UTF-8', 'windows-1252', $row['firstname'] . ' ' . strtoupper($row['lastname']));
    } else {
        return printf("There is admin missing in the database");
    }
}

// Retrieve all data linked with the user id
$sql = "SELECT * FROM users WHERE id = " . $id;
$result = mysqli_query($conn, $sql);
if (mysqli_num_rows($result) > 0) {
    while ($row = mysqli_fetch_assoc($result)) {
        $array_values[] = $row;
    }
} else {
    echo "user not found";
}
$res = $array_values;

// import page 1
$pdf->AddPage();
$tplIdx = $pdf->importPage(1);
$pdf->useTemplate($tplIdx, 0, 0, 210);
$pdf->SetFont('OpenSans', '', 12);
$pdf->SetTextColor(0, 0, 0);
$pdf->SetFillColor(255, 255, 255);
$pdf->Text(63, 90.5, iconv('UTF-8', 'windows-1252', dataBaseAdmin(8, 1, $conn)));
$pdf->Text(60, 126.8, iconv('UTF-8', 'windows-1252', strtoupper($res[0]['lastname']) . ' ' . $res[0]['firstname']));
$pdf->Text(49, 132, iconv('UTF-8', 'windows-1252', $res[0]['street_number'] . ' ' . $res[0]['street'] . ', ' . $res[0]['cp'] . ' ' . $res[0]['localisation']));
$pdf->Text(44, 137.6, iconv('UTF-8', 'windows-1252', $res[0]['mail']));
$pdf->Text(40, 143.5, iconv('UTF-8', 'windows-1252', $res[0]['phone']));
$pdf->Text(62, 160, iconv('UTF-8', 'windows-1252', $res[0]['school_contact']));
$pdf->Text(49, 165, iconv('UTF-8', 'windows-1252', $res[0]['school_name']));
$pdf->Text(43, 170.5, iconv('UTF-8', 'windows-1252', $res[0]['school_mail']));
$pdf->Text(40, 176.3, iconv('UTF-8', 'windows-1252', $res[0]['school_phone']));

// import page 2
$pdf->AddPage();
$pdf->SetTextColor(0, 0, 0);
$pdf->SetFont('OpenSans', '', 12);
$date1 = date_create($res[0]["intership_begin"]);
$date2 = date_create($res[0]["intership_end"]);
$date_diff = date_diff($date1, $date2);
$tplIdx = $pdf->importPage(2);
$pdf->useTemplate($tplIdx, 0, 0, 210);
$pdf->Text(96, 61.9, date("d/m/Y", strtotime($res[0]["intership_begin"])));
$pdf->Text(135, 61.9, date("d/m/Y", strtotime($res[0]["intership_end"])));
$pdf->SetFont('OpenSans', '', 11);
$pdf->Text(70, 93.7, $date_diff->format("%a jours"));
$pdf->Text(120.5, 93.4, round($date_diff->format("%a") / 7));
$pdf->Text(158, 93.4, round(($date_diff->format("%a") / 7) * 35));
// import page 3
$pdf->AddPage();
$tplIdx = $pdf->importPage(3);
$pdf->useTemplate($tplIdx, 0, 0, 210);

$pdf->Text(63, 167.5, date('d/m/Y'));

$pdf->Output('I', 'generated.pdf');
