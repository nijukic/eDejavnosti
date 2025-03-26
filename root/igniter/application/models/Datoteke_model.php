<?php

class Datoteke_model extends CI_Model{

    public function prijavljeni($idDejavnost){
        $this->db->select(" naziv, ime, priimek, stevilka, crka, nazivPrograma, nazivSole, idOseba");
        $this->db->from("oseba_has_dejavnost");
        $this->db->join("dejavnost", "Dejavnost_idDejavnost=idDejavnost");
        $this->db->join("oseba", "oseba.idOseba=oseba_has_dejavnost.Oseba_idOseba");
        $this->db->join("oddelek", "oddelek.idOddelek = oseba.Oddelek_idOddelek");
        $this->db->join("letnik", "letnik.idLetnik = oddelek.Letnik_idLetnik");
        $this->db->join("program", "program.idProgram = letnik.Program_idProgram");
        $this->db->join("sola", "sola.idSola = program.Sola_idSola");
        $this->db->where("idDejavnost", $idDejavnost);
        $this->db->where("avtor", 0);
        $this->db->where("odobreno", 1);
        $this->db->order_by('priimek', 'ASC');
        $this->db->order_by('ime', 'ASC');
        return $this->db->get();
    }

    function prijavljeniPDF($idDejavnost){
        $this->db->select(" naziv, ime, priimek, stevilka, crka, nazivPrograma, kratica, idOseba");
        $this->db->from("oseba_has_dejavnost");
        $this->db->join("dejavnost", "Dejavnost_idDejavnost=idDejavnost");
        $this->db->join("oseba", "oseba.idOseba=oseba_has_dejavnost.Oseba_idOseba");
        $this->db->join("oddelek", "oddelek.idOddelek = oseba.Oddelek_idOddelek");
        $this->db->join("letnik", "letnik.idLetnik = oddelek.Letnik_idLetnik");
        $this->db->join("program", "program.idProgram = letnik.Program_idProgram");
        $this->db->join("sola", "sola.idSola = program.Sola_idSola");
        $this->db->where("idDejavnost", $idDejavnost);
        $this->db->where("avtor", 0);
        $this->db->where("odobreno", 1);
        $this->db->order_by('priimek', 'ASC');
        $this->db->order_by('ime', 'ASC');
        $data = $this->db->get();
        $output = "<div class='table-responsive'>
        <table class='table table-striped table-bordered'>
            <tr>
            <th>Dejavnost</th>
            <th>Ime</th>
            <th>Priimek</th>
            <th>Letnik</th>
            <th>Oddelek</th>
            <th>Program</th>
            <th>Sola</th>
            </tr>";
        foreach($data->result() as $row){
        $output .= '
        <tr>
        <td>'.$row->naziv.'</td>
        <td>'.$row->ime.'</td>
        <td>'.$row->priimek.'</td>
        <td>'.$row->stevilka.'</td>
        <td>'.$row->crka.'</td>
        <td>'.$row->nazivPrograma.'</td>
        <td>'.$row->kratica.'</td>
        </tr>
        ';
        }
        $output .= '</table></div>';
        return $output;
    }

    public function prijavljeniRazred($idOddelek){
        $this->db->select("naziv, ime, priimek, stevilka, crka, nazivPrograma, nazivSole, idOseba");
        $this->db->from("oseba_has_dejavnost");
        $this->db->join("dejavnost", "Dejavnost_idDejavnost=idDejavnost");
        $this->db->join("oseba", "oseba.idOseba=oseba_has_dejavnost.Oseba_idOseba");
        $this->db->join("oddelek", "oddelek.idOddelek = oseba.Oddelek_idOddelek");
        $this->db->join("letnik", "letnik.idLetnik = oddelek.Letnik_idLetnik");
        $this->db->join("program", "program.idProgram = letnik.Program_idProgram");
        $this->db->join("sola", "sola.idSola = program.Sola_idSola");
        $this->db->where("oseba.Oddelek_idOddelek", $idOddelek);
        $this->db->where("avtor", 0);
        $this->db->where("odobreno", 1);
        $this->db->where("stanje", 1);
        $this->db->order_by('priimek', 'ASC');
        $this->db->order_by('ime', 'ASC');
        return $this->db->get();
    }

    function prijavljeniRazredPDF($idOddelek){
        $this->db->select(" naziv, ime, priimek, stevilka, crka, nazivPrograma, kratica, idOseba");
        $this->db->from("oseba_has_dejavnost");
        $this->db->join("dejavnost", "Dejavnost_idDejavnost=idDejavnost");
        $this->db->join("oseba", "oseba.idOseba=oseba_has_dejavnost.Oseba_idOseba");
        $this->db->join("oddelek", "oddelek.idOddelek = oseba.Oddelek_idOddelek");
        $this->db->join("letnik", "letnik.idLetnik = oddelek.Letnik_idLetnik");
        $this->db->join("program", "program.idProgram = letnik.Program_idProgram");
        $this->db->join("sola", "sola.idSola = program.Sola_idSola");
        $this->db->where("oseba.Oddelek_idOddelek", $idOddelek);
        $this->db->where("avtor", 0);
        $this->db->where("odobreno", 1);
        $this->db->where("stanje", 1);
        $this->db->order_by('priimek', 'ASC');
        $this->db->order_by('ime', 'ASC');
        $data = $this->db->get();
        $output = "<div class='table-responsive'>
        <table class='table table-striped table-bordered'>
            <tr>
            <th>Dejavnost</th>
            <th>Ime</th>
            <th>Priimek</th>
            <th>Letnik</th>
            <th>Oddelek</th>
            <th>Program</th>
            <th>Šola</th>
            </tr>";
        foreach($data->result() as $row){
        $output .= '
        <tr>
        <td>'.$row->naziv.'</td>
        <td>'.$row->ime.'</td>
        <td>'.$row->priimek.'</td>
        <td>'.$row->stevilka.'</td>
        <td>'.$row->crka.'</td>
        <td>'.$row->nazivPrograma.'</td>
        <td>'.$row->kratica.'</td>
        </tr>
        ';
        }
        $output .= '</table></div>';
        return $output;
    }

    function prikaziPrisotnostRazredPDF($idDejavnost, $idOddelek){
        $this->db->select("naziv, ime, priimek, datum, prisoten");
        $this->db->from("oseba_has_dejavnost");
        $this->db->join("dejavnost", "Dejavnost_idDejavnost=idDejavnost");
        $this->db->join("oseba", "oseba.idOseba=oseba_has_dejavnost.Oseba_idOseba");
        $this->db->join("prisotnost", "oseba.idOseba = prisotnost.idOseba");
        $this->db->join("oddelek", "oddelek.idOddelek = oseba.Oddelek_idOddelek");
        $this->db->join("letnik", "letnik.idLetnik = oddelek.Letnik_idLetnik");
        $this->db->join("program", "program.idProgram = letnik.Program_idProgram");
        $this->db->join("sola", "sola.idSola = program.Sola_idSola");
        $this->db->where("Dejavnost_idDejavnost", $idDejavnost);
        $this->db->where("Oddelek_idOddelek", $idOddelek);
        $this->db->where("avtor", 0);
        $this->db->where("odobreno", 1);
        $this->db->group_by(array("Dejavnost_idDejavnost", "datum", "oseba.idOseba"));
        $this->db->order_by('priimek', 'ASC');
        $this->db->order_by('ime', 'ASC');
        $this->db->order_by('datum', 'ASC');
        $data = $this->db->get();
        $output = "<div class='table-responsive'>
        <table class='table table-striped table-bordered'>
            <tr>
            <th>Dejavnost</th>
            <th>Ime</th>
            <th>Priimek</th>
            <th>Datum</th>
            <th>Prisotnost</th>
            </tr>";
            foreach($data->result() as $row){
                $output .= '
                <tr>
                <td>'.$row->naziv.'</td>
                <td>'.$row->ime.'</td>
                <td>'.$row->priimek.'</td>
                <td>'.$row->datum.'</td>
                <td>';
                if($row->prisoten == 1){
                    $output .= "da" .'</td></tr>';
                }
                else{
                    $output .= "ne" .'</td></tr>';
                }
        
            }
        $output .= '</table></div>';
        return $output;
    }

    public function select()
    {
     $this->db->order_by('idOseba', 'DESC');
     $this->db->limit("20");
     $query = $this->db->get('oseba');
     return $query;
    }
   
    public function insert($data)
    {
     $this->db->insert('oseba', $data);
    }

    public function sestaviMailUvoz($podatki, $nazivSole){
        $this->db->select("kratica");
        $this->db->from("sola");
        $this->db->where("nazivSole", $nazivSole);
        $query = $this->db->get();
        $kratica = $query->result_array();          

        $ime = $podatki["ime"];
        $priimek = $podatki["priimek"];
        $pretvornik1 = array('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z', "č", "š", "ž", "Č", "Š", "Ž", "Ć", "ć");
        $pretvornik2 = array('a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z', "c", "s", "z", "c", "s", "z", "c", "c");
        $ime = str_replace($pretvornik1, $pretvornik2, $ime);
        $priimek = str_replace($pretvornik1, $pretvornik2, $priimek);
        $email = $ime . "." . $priimek . "@" . $podatki["vloga"] . "-" . $kratica[0]["kratica"] . ".si";
        return($email);
    }

    public function najdiOddelekUvoz($oddelek, $letnik, $program, $sola){
        $this->db->select("idOddelek");
        $this->db->from("oddelek");
        $this->db->join("letnik", "letnik.idLetnik = oddelek.Letnik_idLetnik");
        $this->db->join("program", "program.idProgram = letnik.Program_idProgram");
        $this->db->join("sola", "sola.idSola = program.Sola_idSola");
        $this->db->where("crka", $oddelek);
        $this->db->where("stevilka", $letnik);
        $this->db->where("nazivPrograma", $program);
        $this->db->where("nazivSole", $sola);
        $query = $this->db->get();
        return $result = $query->result_array();          
    }

    public function iskanjeIDsole($idOddelek){
        $this->db->select("idSola");
        $this->db->from("sola");
        $this->db->join("program", "program.Sola_idSola=sola.idSola");
        $this->db->join("letnik", "letnik.Program_idProgram=program.idProgram");
        $this->db->join("oddelek", "oddelek.Letnik_idLetnik=letnik.idLetnik");
        $this->db->where("idOddelek", $idOddelek);
        $query = $this->db->get();
        return $rezultat = $query->row_array();
    }

    public function vstavljanjeRazrednikaVOddelek($idOddelek, $idRazrednik){
        $this->db->set("idRazrednik", $idRazrednik);
        $this->db->where('idOddelek', $idOddelek);
        $this->db->update('oddelek');
    }

    public function preveriCeSolaObstaja($nazivSole){
        $this->db->select("idSola");
        $this->db->from("sola");
        $this->db->like("nazivSole", $nazivSole);
        $query = $this->db->get();
        return $rezultat = $query->row_array();
    }



}