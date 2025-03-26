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

                    <?php $this->load->view("meniAdmin"); ?>

                <div class="container">

                <h1>Tukaj lahko uvažate uporabnike in generirate podatke za prijavo</h1><br>

                    <div class="row">

                        <div class=" col-11 col-md-5 cellContent">
                            <h3>Uvažanje dijakov</h3>
                        <?php echo form_open_multipart("datoteke/uvoziUporabnikeDijaki");
                        ?>
                        <div class="form-group">
                            <label>Izberite datoteko</label>
                            <input type="file" name="csv_file" id="csv_file" required accept=".csv" />
                        </div>
                        <br />
                        <?php
                        echo "<button type='submit'  name='gumb' id='gumb' class='allButtons btn btn-dark'>Uvozi dijake</button>";
                        echo form_close(); ?>

                        <?php
                        echo form_open("datoteke/generirajCSVUvozDijaki");
                            echo "<button type='submit'  name='gumb' id='gumb' class='allButtons btn btn-dark'>Prenesi CSV datoteko za uvoz dijakov</button>";
                        echo form_close(); ?>
                        </div>

                        

                        <div class="col-11 col-md-5 cellContent"><br><br><br>
                        <?php echo form_open("prijava/generirajPodatkeZaPrijavoPDFDijaki");?>


                            <div class="form-group">
                              <select id="txt_sola" name="txt_sola[]" multiple="multiple" class="form-control limit" data-limit="1">
                              <?php
                               foreach($sole as $opcija){
                                    echo "<option value=" . $opcija["idSola"] . ">" . $opcija["nazivSole"] . "</option>";
                              }
                              ?>
                              </select>
                              <?php echo form_error("txt_sola", "<div class='error'>", "</div>"); ?>
                            </div>

                            <br>

                            <div class="form-group">
                              <select class="form-control limit" id="txt_program" name="txt_program[]" multiple="multiple" data-limit="1">
                              </select>
                              <?php echo form_error("txt_program", "<div class='error'>", "</div>"); ?>
                            </div>

                            <br>

                            <div class="form-group">
                              <select class="form-control limit" id="txt_letnik" name="txt_letnik[]" multiple="multiple" data-limit="1"> 
                              </select>
                              <?php echo form_error("txt_letnik", "<div class='error'>", "</div>"); ?>
                            </div>

                            <br>

                            <div class="form-group">
                              <select class="form-control limit" id="txt_oddelek" name="txt_oddelek[]" multiple="multiple" data-limit="1">
                              </select>
                              <?php echo form_error("txt_oddelek", "<div class='error'>", "</div>"); ?>
                            </div>
                            

                            <br>

                            <button type="submit" class="btn btn-dark">Generiraj podatke za prijavo</button><br><br>
                          <?php echo form_close() ?>

                        
                        </div>
                        <div class="col-11  col-md-5 cellContent">
                        <h3>Uvažanje profesorjev</h3>
                        <?php echo form_open_multipart("datoteke/uvoziUporabnikeProfesorji");
                        ?>
                        <div class="form-group">
                            <label>Izberite datoteko</label>
                            <input type="file" name="csv_file" id="csv_file" required accept=".csv" />
                        </div>
                        <br />
                        <?php
                        echo "<button type='submit'  name='gumb' id='gumb' class='allButtons btn btn-dark'>Uvozi profesorje</button>";
                        echo form_close(); ?>

                        <?php
                        echo form_open("datoteke/generirajCSVUvozProfesorji");
                            echo "<button type='submit'  name='gumb' id='gumb' class='allButtons btn btn-dark'>Prenesi CSV datoteko za uvoz profesorjev</button>";
                        echo form_close(); ?>
                        </div>
                        <div class="col-11 col-md-5 cellContent">
                        <?php echo form_open("prijava/generirajPodatkeZaPrijavoPDFProfesorji");?>
                        <br><br><br>

                            <div class="form-group">
                              <select id="txt_sola2" name="txt_sola2[]" multiple="multiple" class="form-control limit" data-limit="1">
                              <?php
                               foreach($sole as $opcija){
                                    echo "<option value=" . $opcija["idSola"] . ">" . $opcija["nazivSole"] . "</option>";
                              }
                              ?>
                              </select>
                              <?php echo form_error("txt_sola2", "<div class='error'>", "</div>"); ?>
                            </div>


                            <button type="submit" class="btn btn-dark">Generiraj podatke za prijavo</button><br><br>
                          <?php echo form_close() ?>
                          </div>
                        </div>
                    <br/>
                    </div>
                    </div>



                    <div>
                    
                    </div> 
                    

            <script>
            /* Set the width of the side navigation to 250px */
            function openNav() {
              document.getElementById("mySidenav").style.width = "250px";
            }

            /* Set the width of the side navigation to 0 */
            function closeNav() {
              document.getElementById("mySidenav").style.width = "0";
            }
            $(document).ready(function(){
              $('#txt_sola').multiselect({
                nonSelectedText: "Izberite šolo",
                onChange:function(option, checked){
                  var sola_id = this.$select.val();
                  if(sola_id.length > 0)
                  {
                    $.ajax({
                      url:"<?php echo site_url() . "/dejavnost/fetch_programe";?>",
                      method:"POST",
                      data:{sola_id:sola_id},
                      success:function(data)
                      {
                        $('#txt_program').html(data);
                        $('#txt_program').multiselect('rebuild');
                      }
                    });
                  }
                }
              });

              $('#txt_program').multiselect({
                nonSelectedText: "Izberite program",
                onChange:function(option, checked){
                  var program_id = this.$select.val();
                  if(program_id.length > 0)
                  {
                    $.ajax({
                      url:"<?php echo site_url() . "/dejavnost/fetch_letnike";?>",
                      method:"POST",
                      data:{program_id:program_id},
                      success:function(data)
                      {
                        $('#txt_letnik').html(data);
                        $('#txt_letnik').multiselect('rebuild');
                      }
                    });
                  }
                }
              });

              $('#txt_letnik').multiselect({
                nonSelectedText: "Izberite letnik",            
                onChange:function(option, checked){
                  var letnik_id = this.$select.val();
                  if(letnik_id.length > 0)
                  {
                    $.ajax({
                      url:"<?php echo site_url() . "/dejavnost/fetch_oddelke";?>",
                      method:"POST",
                      data:{letnik_id:letnik_id},
                      success:function(data)
                      {
                        $('#txt_oddelek').html(data);
                        $('#txt_oddelek').multiselect('rebuild');
                      }
                    });
                  }
                }
              });

              $('#txt_oddelek').multiselect({
                nonSelectedText: "Izberite oddelek",

              });

              $('#txt_sola2').multiselect({
                nonSelectedText: "Izberite šolo",
              });
              
              $('select.limit').on('change', function() {
        if ($(this).val().length > $(this).data('limit')) {
            $(this).val($(this).data('value'));
            $('select').material_select();
        } else {
            $(this).data('value', $(this).val());
        }
    });

            


              });
        </script>
            
        </main>
        <?php $this->load->view("footer"); ?>