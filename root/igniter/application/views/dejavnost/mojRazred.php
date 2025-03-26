<?php $this->load->view("assets"); ?>

    </head>

    <body class="d-flex flex-column min-vh-100">

        <main role="main" class="flex-shrink-0">
            
                <div class="wrapper">

                    <?php 
                        $this->load->view("meniProfesor"); 
                    ?>
                    
                    <div class="container-fluid">
                    <?php
                                if($udelezenci == null){
                                    echo "<h1>Ni podatkov za vaš razred</h1>";
                                }
                                else{
                                    echo "<div class='row''>";
                                    echo "<div class='col-12 ' style='margin: auto !important'>";
                                    

                                    echo "<br><h1 style='text-align:left !important'>" . $udelezenci[0]["stevilka"] . "." . $udelezenci[0]["crka"] . " " . $udelezenci[0]["kraticaProgram"] . "</h1>";   
                                    
                                    echo "<h3 style='text-align:left !important'>Izvozi prijave:</h3><br>";

                                    echo form_open("datoteke/razrednikIzvoziPrijaveCSV");
                                    echo "<button type='submit'  name='gumb' id='gumb' class='allButtons btn btn-dark' value=" . $udelezenci[0]["idOddelek"]  . ">CVS</button>";
                                    echo form_close();                                     
                                    
                                    echo form_open("datoteke/razrednikIzvoziPrijavePDF");
                                    echo "<button type='submit'  name='gumb' id='gumb' class='allButtons btn btn-dark' value=" . $udelezenci[0]["idOddelek"]  . ">PDF</button>";
                                    echo form_close();
                                    
                                    echo form_open("dejavnost/razrednikPrisotnosti");
                                    echo "<button type='submit'  name='gumb' id='gumb' class='allButtons btn btn-dark' value=" . $udelezenci[0]["idOddelek"]  . ">Preglej prisotnost</button>";
                                    echo form_close();
                                    echo "</div>";
                                    
                                    foreach($udelezenci as $opcija){
                                        
                                        echo "<div class='col-4 col-sm-3 col-md-3 col-lg-3 col-xl-2 cellContent border'>";
    
                                        echo "<p>"  . $opcija["ime"] . " " . $opcija["priimek"] . ", " . $opcija["stevilka"] . "." . $opcija["crka"] .  "</p>"; 
    
                                        echo "<p>" . $opcija["nazivPrograma"] . "</p>";  
                                        
                                        echo "</div>";
                                    }

                                    echo "</div>";   
                                }


                                
                            ?>
                                <br>
                        
                        
                </div>
            </div>
            
        </main>
        
        <?php $this->load->view("footer"); ?>