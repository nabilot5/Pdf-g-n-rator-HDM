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

// Set the source file to load pages
$pdf->setSourceFile('./booklet.pdf');

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

// Selection of the pole according to the id
$sqlPole = "SELECT * from pole P, users U WHERE U.pole = P.id AND U.id=$id";
$resultPole = mysqli_query($conn, $sqlPole);

// Selection of team leaders according to the data
function dataBaseTL($id, $conn)
{
    $sql = "SELECT * FROM users WHERE role=$id";
    $result = mysqli_query($conn, $sql);
    $row = mysqli_fetch_assoc($result);

    if ($row != null) {

        return iconv('UTF-8', 'windows-1252', $row['firstname'] . ' ' . $row['lastname']);
    } else {
        return printf("There is a TL missing in the database");
    }
}

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

// import page 1
$pdf->AddPage();
$tplIdx = $pdf->importPage(1);
$pdf->useTemplate($tplIdx, 0, 0, 210);
$pdf->SetTextColor(0, 0, 0);
$pdf->SetFont('OpenSans', '', 20);
#####DATA#####
$str = $res[0]["firstname"] . " " . $res[0]["lastname"];
$str = iconv('UTF-8', 'windows-1252', $str);
$pdf->SetXY(0, 275);
$pdf->Cell(210, 1, $str, 0, 0, 'C');
#####DATA#####

// import page 2
$pdf->AddPage();
$tplIdx = $pdf->importPage(2);
$pdf->useTemplate($tplIdx, 0, 0, 210);
$pdf->SetFont('OpenSans', '', 18);
#####DATA#####
if (mysqli_num_rows($resultPole) > 0) {
    while ($row = mysqli_fetch_assoc($resultPole)) {
        $array_valuesPole[] = $row;
    }
    $resPole = $array_valuesPole;
    $pdf->Text(42, 67.1, $resPole[0]["name"]);
} else {
    echo "0 results";
}
$pdf->Text(22, 75.1, date("d/m/Y", strtotime($res[0]["intership_begin"])));
$pdf->Text(22, 84.5, date("d/m/Y", strtotime($res[0]["intership_end"])));
#####DATA#####

// import page 3
$pdf->AddPage();
$tplIdx = $pdf->importPage(3);
$pdf->useTemplate($tplIdx, 0, 0, 210);
// import page 4
$pdf->AddPage();
$tplIdx = $pdf->importPage(4);
$pdf->useTemplate($tplIdx, 0, 0, 210);
// import page 5
$pdf->AddPage();
$tplIdx = $pdf->importPage(5);
$pdf->useTemplate($tplIdx, 0, 0, 210);
// import page 6
$pdf->AddPage();
$tplIdx = $pdf->importPage(6);
$pdf->useTemplate($tplIdx, 0, 0, 210);
// import page 7
$pdf->AddPage();
$tplIdx = $pdf->importPage(8);
$pdf->useTemplate($tplIdx, 0, 0, 210);
// import page 8
$pdf->AddPage();
$tplIdx = $pdf->importPage(9);
$pdf->useTemplate($tplIdx, 0, 0, 210);
// import page 9
$pdf->AddPage();
$tplIdx = $pdf->importPage(10);
$pdf->useTemplate($tplIdx, 0, 0, 210);
// import page 10
$pdf->AddPage();
$tplIdx = $pdf->importPage(11);
$pdf->useTemplate($tplIdx, 0, 0, 210);
// import page 11
$pdf->AddPage();
$tplIdx = $pdf->importPage(7);
$pdf->useTemplate($tplIdx, 0, 0, 210);

// import page 12
$pdf->AddPage();
#####IMAGES#####
$pdf->Image('./assets/16.jpg', 0, -1, 210, 300);
$pdf->Image('./assets/organigramme_ceo.png', 10, 100, 170, 0);
#####IMAGES#####

#####TITLE#####
$pdf->SetFont('Mango', '', 70);
$pdf->SetTextColor(2, 42, 91, 255);
$pdf->Text(15.3, 30, 'INTRODUCTION');
$pdf->SetTextColor(8, 88, 149, 255);
$pdf->SetFont('OpenSans', '', 21);
$pdf->SetTextColor(8, 81, 134, 255);
$pdf->Text(69, 43.3, iconv('UTF-8', 'windows-1252', "PRÉSENTATION DES TEAM-LEADERS"));
#####TITLE#####

#####TEXTBLOC#####
$pdf->SetTextColor(37, 118, 135);
$pdf->SetFont('OpenSans', '', 19);
$y = 70;
$pdf->Text(10, $y, iconv('UTF-8', 'windows-1252', "Votre team-leader sera chargé de vous guider dans votre"));
$y += 10;
$pdf->Text(10, $y, iconv('UTF-8', 'windows-1252', "travail et de veiller a votre bonne intégration dans l’entreprise."));
$y += 10;
$pdf->Text(10, $y, iconv('UTF-8', 'windows-1252', "Il sera votre interlocuteur privilégié si vous avez des questions"));
$y += 10;
$pdf->Text(10, $y, iconv('UTF-8', 'windows-1252', "ou des interrogations concernant une mission confiée."));
#####TEXTBLOC#####

#####DATA#####
$pdf->SetFont('Mango', '', 23);
$pdf->SetTextColor(2, 42, 91, 255);
$pdf->Text(195, 282, '11', 0, 0, 'C');
$pdf->SetFont('OpenSans', '', 15);
$pdf->Text(20, 191, dataBaseAdmin(8, 1, $conn));
$pdf->Text(115, 191, dataBaseAdmin(8, 2, $conn));

$pdf->Text(30, 207, 'Ressource Humaines');
$pdf->Text(40, 221, 'Recrutement - TL:');
$pdf->SetTextColor(0, 0, 0);
$pdf->Text(43, 227, dataBaseTL(6, $conn));
$pdf->SetTextColor(2, 42, 91, 255);

$pdf->Text(42, 236, 'Placement - TL:');
$pdf->SetTextColor(0, 0, 0);
$pdf->Text(45, 242, dataBaseTL(7, $conn));
$pdf->SetTextColor(2, 42, 91, 255);

$pdf->Text(28, 253, "Business developpers/");
$pdf->Text(28, 260, "Commerciaux (B2B) - TL:");
$pdf->SetTextColor(0, 0, 0);
$pdf->Text(90, 260, dataBaseTL(10, $conn));
$pdf->SetTextColor(2, 42, 91, 255);

$pdf->Text(28, 272, "SEO/Journalistes - TL:");
$pdf->SetTextColor(0, 0, 0);
$pdf->Text(82, 272, dataBaseTL(11, $conn));
$pdf->SetTextColor(2, 42, 91, 255);

$pdf->Text(122, 211, "Graphistes - TL:");
$pdf->SetTextColor(0, 0, 0);
$pdf->Text(125, 217, dataBaseTL(9, $conn));
$pdf->SetTextColor(2, 42, 91, 255);

$pdf->Text(122, 225, "WEB Developers - TL:");
$pdf->SetTextColor(0, 0, 0);
$pdf->Text(125, 231, dataBaseTL(5, $conn));
$pdf->SetTextColor(2, 42, 91, 255);
#####DATA#####

// import page 13
$pdf->AddPage();
$tplIdx = $pdf->importPage(13);
$pdf->useTemplate($tplIdx, 0, 0, 210);
// import page 14
$pdf->AddPage();
$tplIdx = $pdf->importPage(14);
$pdf->useTemplate($tplIdx, 0, 0, 210);
// import page 15
$pdf->AddPage();
$tplIdx = $pdf->importPage(15);
$pdf->useTemplate($tplIdx, 0, 0, 210);
// import page 16
$pdf->AddPage();
$tplIdx = $pdf->importPage(16);
$pdf->useTemplate($tplIdx, 0, 0, 210);
// import page 17
$pdf->AddPage();
$tplIdx = $pdf->importPage(17);
$pdf->useTemplate($tplIdx, 0, 0, 210);
// import page 18
$pdf->AddPage();
$tplIdx = $pdf->importPage(18);
$pdf->useTemplate($tplIdx, 0, 0, 210);
// import page 19
$pdf->AddPage();
$tplIdx = $pdf->importPage(19);
$pdf->useTemplate($tplIdx, 0, 0, 210);

$pdf->Output('I', 'generated.pdf');
