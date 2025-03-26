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
                        <div class="row">
                        <form method="post" action="<?php echo site_url(); ?>/datoteke/izvoziPrijavljene3">
   <div class="panel panel-default">
    <div class="panel-heading">
     <div class="row">
      <div class="col-md-6">
       <h3 class="panel-title">Student Data</h3>
      </div>
      <div class="col-md-6" align="right">
       <input type="submit" name="export" class="btn btn-success btn-xs" value="Export to CSV" />
      </div>
     </div>
    </div>
    <div class="panel-body">
     <div class="table-responsive">
      <table class="table table-bordered table-striped">
       <tr>
        <th>Student Name</th>
        <th>Student Phone</th>
       </tr>
       <?php
       foreach($data->result_array() as $row)
       {
        echo '
        <tr>
         <td>'.$row["ime"].'</td>
         <td>'.$row["priimek"].'</td>
        </tr>
        ';
       }
       ?>
      </table>
     </div>
    </div>
   </div>
  </form>
                        
                        </div>
                    </div>
            </div>
            
        </main>
        
        <?php $this->load->view("footer"); ?>