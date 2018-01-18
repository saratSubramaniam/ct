<div id="footer-bottom">
               <div class="container">
               </div>
            </div>
         </div>
      </div>
      <!-- .wrapper-container -->
      <div id="donate_hidden" class="mfp-hide"></div>
      <div class="donate_ajax_overflow">
         <div class="donate_ajax_loading">
            <span class="donate-1"></span>
            <span class="donate-2"></span>
            <span class="donate-3"></span>
            <span class="donate-4"></span>
            <span class="donate-5"></span>
            <span class="donate-6"></span>
         </div>
      </div>
      <div class="gallery-slider-content"></div>
      <script type="text/javascript">
         function revslider_showDoubleJqueryError(sliderID) {
             var errorMessage = "Revolution Slider Error: You have some jquery.js library include that comes after the revolution files js include.";
             errorMessage += "<br> This includes make eliminates the revolution slider libraries, and make it not work.";
             errorMessage += "<br><br> To fix it you can:<br>&nbsp;&nbsp;&nbsp; 1. In the Slider Settings -> Troubleshooting set option:  <strong><b>Put JS Includes To Body</b></strong> option to true.";
             errorMessage += "<br>&nbsp;&nbsp;&nbsp; 2. Find the double jquery.js include and remove it.";
             errorMessage = "<span style='font-size:16px;color:#BC0C06;'>" + errorMessage + "</span>";
             jQuery(sliderID).show().html(errorMessage);
         }
      </script>
     
      <script type='text/javascript' src='<?php echo base_url()?>application/views/<?php echo $this->system->theme_dir . $this->system->theme ?>/javascript/jquery/ui/core.min.js'></script>
      <script type='text/javascript' src='<?php echo base_url()?>application/views/<?php echo $this->system->theme_dir . $this->system->theme ?>/javascript/underscore.min.js'></script>
     
     
      <script type='text/javascript' src='<?php echo base_url()?>application/views/<?php echo $this->system->theme_dir . $this->system->theme ?>/javascript/bootstrap.min.js'></script>
     
     
      
      <script type='text/javascript' src='<?php echo base_url()?>application/views/<?php echo $this->system->theme_dir . $this->system->theme ?>/javascript/backbone.min.js'></script>
      
      <script type='text/javascript' src='<?php echo base_url()?>application/views/<?php echo $this->system->theme_dir . $this->system->theme ?>/javascript/main.min.js'></script>
      <script type='text/javascript' src='<?php echo base_url()?>application/views/<?php echo $this->system->theme_dir . $this->system->theme ?>/javascript/custom-script.js'></script>
      <script type='text/javascript' src='<?php echo base_url()?>application/views/<?php echo $this->system->theme_dir . $this->system->theme ?>/javascript/custom-scroll.min.js'></script>
      <script type='text/javascript' src='<?php echo base_url()?>application/views/<?php echo $this->system->theme_dir . $this->system->theme ?>/javascript/jquery/ui/datepicker.min.js'></script>
      <script type='text/javascript' src='<?php echo base_url()?>application/views/<?php echo $this->system->theme_dir . $this->system->theme ?>/javascript/jquery/ui/widget.min.js'></script>
      <script type='text/javascript' src='<?php echo base_url()?>application/views/<?php echo $this->system->theme_dir . $this->system->theme ?>/javascript/jquery/ui/spinner.min.js'></script>
   </body>
</html>