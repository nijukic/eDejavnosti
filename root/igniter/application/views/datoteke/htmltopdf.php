<?php $this->load->view("assets"); ?>

    </head>

    <body class="d-flex flex-column min-vh-100">
        
        <main role="main" class="flex-shrink-0">
            
                <div class="wrapper">

                    <?php 
                    if($this->session->userdata("vloga") == "admin"){
                        $this->load->view("meniAdmin"); 
                    }
                    elseif($this->session->userdata("vloga") == "profesor"){
                        $this->load->view("meniProfesor"); 
                    }
                    ?>
                    
                    <div class="container-fluid">
                    <?php echo '<a href="'.site_url().'/datoteke/pdfdetails/'.$this->session->flashdata("idDejavnost").'">Izvozi PDF</a>' ?>
                        <div class="row">
                        <?php
                            if(isset($prijavljeni))
                            {
                            ?>
                            <div class="table-responsive">
                            <table class="table table-striped table-bordered">
                                <tr>
                                <th>Dejavnost</th>
                                <th>Ime</th>
                                <th>Priimek</th>
                                <th>Letnik</th>
                                <th>Oddelek</th>
                                <th>Program</th>
                                <th>Sola</th>
                                </tr>
                            <?php
                            foreach($prijavljeni->result() as $row)
                            {
                                echo '
                                <tr>
                                <td>'.$row->naziv.'</td>
                                <td>'.$row->ime.'</td>
                                <td>'.$row->priimek.'</td>
                                <td>'.$row->stevilka.'</td>
                                <td>'.$row->crka.'</td>
                                <td>'.$row->nazivPrograma.'</td>
                                <td>'.$row->nazivSole.'</td>
                                </tr>
                                ';
                            }
                            ?>
                            </table>
                            </div>
                            <?php
                            }
                            if(isset($customer_details))
                            {
                            echo $customer_details;
                            }
                            ?>
                            </div>
                        
                        </div>
                    </div>
            </div>
            
        </main>
        
        <?php $this->load->view("footer"); ?>