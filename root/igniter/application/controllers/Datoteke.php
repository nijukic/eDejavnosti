<?php
class Datoteke extends CI_Controller{

    public function __construct() {
        parent::__construct();
        $this->load->model("datoteke_model");
        $this->load->model("prijavni_model");
        $this->load->library('pdf');
        $this->load->library('csvimport');
    }

    public function validateDate($date, $format = 'Y-m-d'){
    $d = DateTime::createFromFormat($format, $date);
    // The Y ( 4 digits year ) returns TRUE for any integer with any number of digits so changing the comparison from == to === fixes the issue.
    return $d && $d->format($format) === $date;
    }

    public function izvoziPrijavljeneCSV(){
        if($this->session->userdata("vloga") != "admin" and $this->session->userdata("vloga") != "profesor"){
            redirect("");
        }
        else{
        $id = $this->input->post("gumb");
        $file_name = 'student_details_on_'.date('Ymd').'.csv'; 
        header("Content-Description: File Transfer"); 
        header("Content-Disposition: attachment; filename=$file_name"); 
        header("Content-Type: application/csv;");
        $student_data = $this->datoteke_model->prijavljeni($id);
        $file = fopen('php://output', 'w');
        $header = array("Dejavnost", "Ime", "Priimek", "Letnik", "Oddelek", "Program", "Sola", "idOseba"); 
        fprintf($file, chr(0xEF).chr(0xBB).chr(0xBF));
        fputcsv($file, $header, ";");
        foreach ($student_data->result_array() as $key => $value)
        { 
            fputcsv($file, $value, ";"); 
        }
        fclose($file);
        exit;
        }
    }
   
    public function izvoziPrijavljenePDF(){
        if($this->session->userdata("vloga") != "admin" and $this->session->userdata("vloga") != "profesor"){
            redirect("");
        }
        else{
        $id = $this->input->post("gumb");
        $idDejavnost = $id;
        $html_content = '<head><meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <style>

        body { font-family: DejaVu Sans, sans-serif; font-size: 80%;}

        table {
        border-collapse: collapse;
        width: 100%;
        }

        th, td {
        text-align: left;
        padding: 8px;
        }

        tr:nth-child(even){background-color: #f2f2f2}

        th {
        background-color:  #374045;
        color: white;
        }
        </style>
        </head><h3 align="center">Seznam prijavljenih na dejavnost</h3>';
        $html_content .= $this->datoteke_model->prijavljeniPDF($idDejavnost);
        $this->pdf->loadHtml($html_content);
        $this->pdf->render();
        $this->pdf->stream("".$idDejavnost.".pdf", array("Attachment"=>0));
        }
    }



    public function razrednikIzvoziPrijaveCSV(){
        if($this->session->userdata("vloga") != "profesor"){
            redirect("");
        }
        else{
        $id = $this->input->post("gumb");
        $file_name = 'student_details_on_'.date('Ymd').'.csv'; 
        header("Content-Description: File Transfer"); 
        header("Content-Disposition: attachment; filename=$file_name"); 
        header("Content-Type: application/csv;");
        $student_data = $this->datoteke_model->prijavljeniRazred($id);
        $file = fopen('php://output', 'w');
    
        $header = array("Dejavnost", "Ime", "Priimek", "Letnik", "Oddelek", "Program", "Sola", "idOseba"); 
        fprintf($file, chr(0xEF).chr(0xBB).chr(0xBF));
        fputcsv($file, $header);
        foreach ($student_data->result_array() as $key => $value)
        { 
            fputcsv($file, $value, ";"); 
        }
        fclose($file);
        exit;
        }
    }

    public function razrednikIzvoziPrijavePDF(){
        if($this->session->userdata("vloga") != "profesor"){
            redirect("");
        }
        else{
            $id = $this->input->post("gumb");
            $idOddelek = $id;
            $html_content = '<head><meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
            <style>

            body { font-family: DejaVu Sans, sans-serif; font-size: 80%;}

            table {
            border-collapse: collapse;
            width: 100%;
            }
    
            th, td {
            text-align: left;
            padding: 8px;
            }
    
            tr:nth-child(even){background-color: #f2f2f2}
    
            th {
            background-color:  #374045;
            color: white;
            }
            </style>
            </head><h3 align="center">Seznam prijavljenih na dejavnost</h3>';
            $html_content .= $this->datoteke_model->prijavljeniRazredPDF($idOddelek);
            $this->pdf->loadHtml($html_content);
            $this->pdf->render();
            $this->pdf->stream("".$idOddelek.".pdf", array("Attachment"=>0)); 
        }
      
    }

    public function razrednikPrikaziPrisotnostPDF(){
        if($this->session->userdata("vloga") != "profesor"){
            redirect("");
        }
        else{
        $id = $this->input->post("gumb");
        $id = explode(";", $id);
        $idDejavnost = $id[0];
        $idOddelek = $id[1];
        $html_content = '<head><meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <style>

        body { font-family: DejaVu Sans, sans-serif; font-size: 80%;}
>
        table {
        border-collapse: collapse;
        width: 100%;
        }

        th, td {
        text-align: left;
        padding: 8px;
        }

        tr:nth-child(even){background-color: #f2f2f2}

        th {
        background-color:  #374045;
        color: white;
        }
        </style>
        </head><h3 align="center">Seznam prijavljenih na dejavnost</h3>';
        $html_content .= $this->datoteke_model->prikaziPrisotnostRazredPDF($idDejavnost, $idOddelek);
        $this->pdf->loadHtml($html_content);
        $this->pdf->render();
        $this->pdf->stream("".$idDejavnost.".pdf", array("Attachment"=>0));
        }
     
    }

   /* public function uvoziUporabnike2(){
        if($this->session->userdata("vloga") != "admin"){
            redirect("");
        }
        else{
        $get = $this->input->post("csv_file");
        print_r($get);
        }
    }

    */

   /* function load_data()
 {
  $result = $this->datoteke_model->select();
  $output = '
   <h3 align="center">Imported User Details from CSV File</h3>
        <div class="table-responsive">
         <table class="table table-bordered table-striped">
          <tr>
          <th>idOseba</th>
           <th>Ime</th>
           <th>Priimek</th>
           <th>datumRojstva</th>
           <th>spol</th>
           <th>zacasnoGeslo</th>
           <th>Sola</th>
           <th>Program</th>
           <th>Letnik</th>
           <th>Oddelek</th>
          </tr>
  ';
  $count = 0;
  if($result->num_rows() > 0)
  {
   foreach($result->result() as $row)
   {
    $count = $count + 1;
    $output .= '
    <tr>
     <td>'.$count.'</td>
     <td>'.$row->ime.'</td>
     <td>'.$row->priimek.'</td>
     <td>'.$row->datumRojstva.'</td>
     <td>'.$row->spol.'</td>
     <td>'.$row->zacasnoGeslo.'</td>
     <td>'.$row->eNaslov.'</td>
     <td>'.$row->vloga.'</td>
     <td>'.$row->Oddelek_idOddelek.'</td>
    </tr>
    ';
   }
  }
  else
  {
   $output .= '
   <tr>
       <td colspan="5" align="center">Data not Available</td>
      </tr>
   ';
  }
  $output .= '</table></div>';
  echo $output;
 } */

    public function generirajCSVuvozDijaki(){
        if($this->session->userdata("vloga") != "admin"){
            redirect("");
        }
        else{
        $file_name = 'prazna_dat_uvoz_'.date('Ymd').'.csv'; 
        header("Content-Description: File Transfer"); 
        header("Content-Disposition: attachment; filename=$file_name"); 
        header("Content-Type: application/csv;");
        $file = fopen('php://output', 'w');
        $header = array("ime", "priimek", "datumRojstva", "spol", "zacasnoGeslo", "sola", "program", "letnik", "oddelek"); 
        fprintf($file, chr(0xEF).chr(0xBB).chr(0xBF));
        fputcsv($file, $header, ";");
        fclose($file);
        exit;
        }
    }

    public function generirajCSVuvozProfesorji(){
        if($this->session->userdata("vloga") != "admin"){
            redirect("");
        }
        else{
        $file_name = 'prazna_dat_uvoz_'.date('Ymd').'.csv'; 
        header("Content-Description: File Transfer"); 
        header("Content-Disposition: attachment; filename=$file_name"); 
        header("Content-Type: application/csv;");
        $file = fopen('php://output', 'w');
        $header = array("ime", "priimek", "datumRojstva", "spol", "zacasnoGeslo", "sola", "razrednik(da,ne)", "program", "letnik", "oddelek"); 
        fprintf($file, chr(0xEF).chr(0xBB).chr(0xBF));
        fputcsv($file, $header, ";");
        fclose($file);
        exit;
        }
    }

    public function uvoziUporabnikeDijaki(){
        $file_data = $this->csvimport->get_array($_FILES["csv_file"]["tmp_name"]);
        if($file_data != null){
            foreach($file_data as $row){
                $prvi = array_key_first($row);
                foreach(array("priimek", "datumRojstva", "spol", "zacasnoGeslo", "sola", "program", "letnik", "oddelek") as $niz){
                    if(array_key_exists($niz, $row) == false){
                        $this->session->set_flashdata("error", "V datoteki manjkajo podatki!1");
                        redirect("prijava/uporabniki");
                        die();
                    }
                }
                if($row[$prvi] == "" or $row["priimek"] == "" or $row["datumRojstva"] == "" or $this->validateDate(date("Y-m-d", strtotime($row["datumRojstva"]))) == false or in_array($row["spol"], array("m", "f")) == false  or $row["zacasnoGeslo"] == ""){
                    $this->session->set_flashdata("error", "V datoteki manjkajo podatki!2");
                    redirect("prijava/uporabniki");
                    die();
                }
            }
            foreach($file_data as $row){
                $oddelek = $this->datoteke_model->najdiOddelekUvoz($row["oddelek"], $row["letnik"], $row["program"], $row["sola"]);
                #echo mb_detect_encoding($row["sola"]);;
                #if($row["sola"] == "Srednja tehniška in poklicna šola Trbovlje"){
                 #   echo "enako";
                #}
                if($oddelek != null){
                    $data = array(
                        'ime' => $row[$prvi],
                        'priimek'  => $row["priimek"],
                        'datumRojstva'   => date('Y-m-d', strtotime(str_replace('/', '-', $row["datumRojstva"]))),
                        "spol"   => $row["spol"],
                        "eNaslov"   => "",
                        "vloga"   => "dijak",
                        'zacasnoGeslo'   => $row["zacasnoGeslo"],
                        'Oddelek_idOddelek'   => $oddelek[0]["idOddelek"]
                );
                $data["eNaslov"] = $this->datoteke_model->sestaviMailUvoz($data, $row["sola"]);
                $this->datoteke_model->insert($data);
                $IDosebe = $this->prijavni_model->iskanjeIDOsebe();
                $IDsole = $this->datoteke_model->iskanjeIDsole($oddelek[0]["idOddelek"]);
                $podatki_array2 = array(
                    "Sola_idSola" => $IDsole["idSola"],
                    "Oseba_idOseba" => $IDosebe["idOseba"]
                );
                $this->prijavni_model->vstavljanjeSolaHasOseba($podatki_array2);
                }
    
                $this->session->set_flashdata("succes", "Dijaki so bili uspešno uvoženi");
            }
    
            redirect("prijava/uporabniki");
        }
        else{
            $this->session->set_flashdata("error", "V datoteki manjkajo podatki!");
            redirect("prijava/uporabniki");
        }
  
    }


    public function uvoziUporabnikeProfesorji(){
        $file_data = $this->csvimport->get_array($_FILES["csv_file"]["tmp_name"]);
        if($file_data != null){
            foreach($file_data as $row){
                $prvi = array_key_first($row);
                foreach(array("priimek", "datumRojstva", "spol", "zacasnoGeslo", "sola", "razrednik(da,ne)") as $niz){
                    if(array_key_exists($niz, $row) == false){
                        $this->session->set_flashdata("error", "V datoteki manjkajo podatki!1");
                        redirect("prijava/uporabniki");
                        die();
                    }
                }
                if($row[$prvi] == "" or $row["priimek"] == "" or $row["datumRojstva"] == "" or $this->validateDate(date("Y-m-d", strtotime($row["datumRojstva"]))) == false or in_array($row["spol"], array("m", "f")) == false  or $row["zacasnoGeslo"] == ""
                or $row["sola"] == "" or $row["razrednik(da,ne)"] == ""){
                    $this->session->set_flashdata("error", "V datoteki manjkajo podatki!2");
                    redirect("prijava/uporabniki");
                    die();
            }
            }
            foreach($file_data as $row){
                if($row["razrednik(da,ne)"] == "da"){
                    $oddelek = $this->datoteke_model->najdiOddelekUvoz($row["oddelek"], $row["letnik"], $row["program"], $row["sola"]);
                    if($oddelek != null){
                        $data = array(
                            'ime' => $row[$prvi],
                            'priimek'  => $row["priimek"],
                            'datumRojstva'   => date('Y-m-d', strtotime(str_replace('/', '-', $row["datumRojstva"]))),
                            "spol"   => $row["spol"],
                            "eNaslov"   => "",
                            "vloga"   => "profesor",
                            'zacasnoGeslo'   => $row["zacasnoGeslo"],
                    );
                    $data["eNaslov"] = $this->datoteke_model->sestaviMailUvoz($data, $row["sola"]);
                    print_r($data);
                    $this->datoteke_model->insert($data);
                    $IDosebe = $this->prijavni_model->iskanjeIDOsebe();
                    $IDsole = $this->datoteke_model->iskanjeIDsole($oddelek[0]["idOddelek"]);
                    $podatki_array2 = array(
                        "Sola_idSola" => $IDsole["idSola"],
                        "Oseba_idOseba" => $IDosebe["idOseba"],
                        "razrednik" => $oddelek[0]["idOddelek"]
                    );
                    $this->prijavni_model->vstavljanjeSolaHasOseba($podatki_array2);
                    $this->datoteke_model->vstavljanjeRazrednikaVOddelek($oddelek[0]["idOddelek"], $IDosebe["idOseba"]);
                }
                
                #echo mb_detect_encoding($row["sola"]);;
                #if($row["sola"] == "Srednja tehniška in poklicna šola Trbovlje"){
                 #   echo "enako";
                #}
                
                }
                else{
                    $IDsole = $this->datoteke_model->preveriCeSolaObstaja($row["sola"]);
                    if($IDsole != null){
                        $data = array(
                            'ime' => $row[$prvi],
                            'priimek'  => $row["priimek"],
                            'datumRojstva'   => date("Y-m-d", strtotime($row["datumRojstva"])),
                            "spol"   => $row["spol"],
                            "eNaslov"   => "",
                            "vloga"   => "profesor",
                            'zacasnoGeslo'   => $row["zacasnoGeslo"],
                    );
                    $data["eNaslov"] = $this->datoteke_model->sestaviMailUvoz($data, $row["sola"]);
                    $this->datoteke_model->insert($data);
                    $IDosebe = $this->prijavni_model->iskanjeIDOsebe();
                    $podatki_array2 = array(
                        "Sola_idSola" => $IDsole["idSola"],
                        "Oseba_idOseba" => $IDosebe["idOseba"],
                    );
                    $this->prijavni_model->vstavljanjeSolaHasOseba($podatki_array2);
                }
    
                
            }

        }
        $this->session->set_flashdata("succes", "Profesorji so bili uspešno uvoženi");

        redirect("prijava/uporabniki");  
        }
        else{
            $this->session->set_flashdata("error", "V datoteki manjkajo podatki!");
            redirect("prijava/uporabniki");
        }

 
  
    }

 

}

   
