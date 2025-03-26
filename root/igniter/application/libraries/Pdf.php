<?php defined('BASEPATH') OR exit('No direct script access allowed');

require_once 'dompdf/autoload.inc.php';

use Dompdf\Dompdf;
class Pdf extends DOMPDF
{

protected function ci()
{
    return get_instance();
}

public function load_view($view, $data = array())
{
    $dompdf = new Dompdf();
    $html = $this->ci()->load->view($view, $data, TRUE);

    $dompdf->loadHtml($html);

    // (Optional) Setup the paper size and orientation
    $dompdf->setPaper('A4', 'landscape');

    // Render the HTML as PDF
    $dompdf->render();
    $time = time();

    // Output the generated PDF to Browser
    $dompdf->stream("welcome-". $time);
}
}