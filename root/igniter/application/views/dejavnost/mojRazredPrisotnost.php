<?php $this->load->view("assets"); ?>

    </head>

    <body class="d-flex flex-column min-vh-100">
        <?php
        if($this->session->flashdata("succes")){
            ?>
        <div class="btn btn-success" id="plsgoaway">
            <?php echo $this->session->flashdata("succes") ?>        
        </div>
        <?php        
            }
        elseif($this->session->flashdata("error")){
                ?>
        <div class="btn btn-danger" id="plsgoaway">
            <?php echo $this->session->flashdata("error") ?>        
        </div>
        <?php        
            }
            ?>
        
        <main role="main" class="flex-shrink-0">
                
                <div class="wrapper">

                    <?php $this->load->view("meniProfesor"); ?>

                    <div class="container-fluid">
                    <?php
                            if($dejavnosti == null){
                                echo "<h1>Ni preteklih dejavnosti!</h1>";
                            }
                            else{
                                echo "<h1>Pretekle dejavnosti ". $ime[0]["stevilka"] . "." . $ime[0]["crka"] .":</h1>";
                    ?>
                    <div class="row">
                            <?php
                                foreach($dejavnosti as $opcija){
                                    echo "<div class='col-12 col-md-6 col-lg-4 vsebina'>";
                                        echo "<div class='cellContent border'>";
    
                                        echo "<h1>" . $opcija["naziv"] . "</h1>" . "<br>";
    
                                        echo "<p>Mentor: " . $opcija["ime"] . " " . $opcija["priimek"] . "</p>" . "<br>";
    
                                        echo "<p>Opis: " . $opcija["opis"] . "</p>";

                                        echo "<p>" . "Datum začetka: " . $opcija["datumZacetek"] . "</p>";
                                        echo "<p>" . "Datum konca: " . $opcija["datumKonec"] . "</p><br>";

                                        echo form_open("datoteke/razrednikPrikaziPrisotnostPDF");
                                        echo "<button type='submit'  name='gumb' id='gumb' class='btn btn-dark' value=" . $opcija["idDejavnost"] . ";" . $ime[0]["idOddelek"]  . ">PDF</button>";
                                        echo form_close(); 

                                        echo "</div>";
                                        echo "</div>";
    
                                }
                            }        

                        ?>


                    </div> 
                    
                </div>

            </div>
            
        </main>
       <?php $this->load->view("footer"); ?>