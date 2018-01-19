<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <title><?php echo $this->system->site_name?> | <?php if (!empty($title)):?><?php echo $title?><?php endif;?></title>
      <meta name="keywords" content="<?php if (!empty($meta_keywords)):?><?php echo $meta_keywords?> - <?php endif; ?><?php echo $this->system->meta_keywords;?>" />
      <meta name="description" content="<?php if (!empty($meta_description)):?><?php echo $meta_description?> - <?php endif; ?><?php echo $this->system->meta_description;?>" />
	  <meta name="robots" content="index,follow" />
	  <link rel="shortcut icon" href="<?php echo base_url()?>application/views/<?php echo $this->system->theme_dir . $this->system->theme ?>/images/favicon.ico" type="image/x-icon" />
      <link rel='stylesheet' href='<?php echo base_url()?>application/views/<?php echo $this->system->theme_dir . $this->system->theme ?>/style/settings.css' type='text/css' media='all' />
      <link rel='stylesheet' href='<?php echo base_url()?>application/views/<?php echo $this->system->theme_dir . $this->system->theme ?>/style/front-flex.css' type='text/css' media='all' />
      <link rel='stylesheet' href='<?php echo base_url()?>application/views/<?php echo $this->system->theme_dir . $this->system->theme ?>/style/font-awesome.min.css' type='text/css' media='all' />
      <link rel='stylesheet' href='<?php echo base_url()?>application/views/<?php echo $this->system->theme_dir . $this->system->theme ?>/style/custom-style.css' type='text/css' media='all' />
      <link rel='stylesheet' href='<?php echo base_url()?>application/views/<?php echo $this->system->theme_dir . $this->system->theme ?>/style/style.css' type='text/css' media='all' />
      <link rel='stylesheet' href='//fonts.googleapis.com/css?family=Open+Sans:300,300italic,400,italic,600,600italic,700,700italic,800,800italic&#038;subset=greek-ext,greek,cyrillic-ext,latin-ext,latin,vietnamese,cyrillic' type='text/css' media='all' />
      <link rel='stylesheet' href='//fonts.googleapis.com/css?family=Roboto+Slab:100,300,400,700&#038;subset=greek-ext,greek,cyrillic-ext,latin-ext,latin,vietnamese,cyrillic' type='text/css' media='all' />
      <script type='text/javascript' src='<?php echo base_url()?>application/views/<?php echo $this->system->theme_dir . $this->system->theme ?>/javascript/jquery/jquery.js'></script>
      <script type='text/javascript' src='<?php echo base_url()?>application/views/<?php echo $this->system->theme_dir . $this->system->theme ?>/javascript/jquery/jquery-migrate.min.js'></script>
      <script type='text/javascript' src='<?php echo base_url()?>application/views/<?php echo $this->system->theme_dir . $this->system->theme ?>/javascript/jquery.themepunch.tools.min.js'></script>
      <script type='text/javascript' src='<?php echo base_url()?>application/views/<?php echo $this->system->theme_dir . $this->system->theme ?>/javascript/jquery.themepunch.revolution.min.js'></script>
      <script type='text/javascript'>
         /* <![CDATA[ */
         var panelsStyles = {
             "fullContainer": "body"
         };
         /* ]]> */
      </script>
      <script type='text/javascript' src='<?php echo base_url()?>application/views/<?php echo $this->system->theme_dir . $this->system->theme ?>/javascript/styling-260.min.js'></script>
      <link rel="stylesheet" type="text/css" href="<?php echo base_url()?>application/views/<?php echo $this->system->theme_dir . $this->system->theme ?>/style/siteorigin-panels-layouts-footer.css">
   <?php $this->plugin->do_action('header');?>
   </head>






<body class="home page-template page-template-page-templates page-template-homepage page-template-page-templateshomepage-php page page-id-4967 logged-in admin-bar no-customize-support siteorigin-panels siteorigin-panels-home loading thim_header_custom_style thim_header_style2 thim_fixedmenu ">
      <div class="thim-loading">
         <img src="<?php echo base_url()?>application/views/<?php echo $this->system->theme_dir . $this->system->theme ?>/images/loading.gif" alt="Test Website" /> 
      </div>
      <div class="thim-menu line mobile-not-line">
         <span class="close-menu"><i class="fa fa-times"></i></span>
         <div class="main-menu">
            <ul class="nav navbar-nav">
               <li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-home current-menu-item page_item page-item-4967 current_page_item menu-item-has-children drop_to_right standard"><a href="./"><span data-hover="Home">Home</span></a>
               </li>
               <li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-has-children drop_to_right standard"><a href="./index.php/about/"><span data-hover="About Us">About Us</span></a>
               </li>
               <li class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children drop_to_right standard">
                  <a href="http://charitywp.thimpress.com/demo-3/campaigns"><span data-hover="Causes">Causes</span></a>
                  <ul class="sub-menu">
                     <li class="menu-item menu-item-type-custom menu-item-object-custom"><a href="http://charitywp.thimpress.com/demo-3/campaigns/?style=list">Causes List</a></li>
                     <li class="menu-item menu-item-type-custom menu-item-object-custom"><a href="http://charitywp.thimpress.com/demo-3/campaigns/?style=grid">Causes Grid</a></li>
                     <li class="menu-item menu-item-type-custom menu-item-object-custom"><a href="http://charitywp.thimpress.com/demo-3/campaigns/building-clean-water-system-for-rural-poor/">Single Cause</a></li>
                  </ul>
               </li>
               <li class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children drop_to_right standard"><a href="http://charitywp.thimpress.com/demo-3/events/"><span data-hover="Events">Events</span></a>
               </li>
               <li class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children drop_to_right standard"><a href="#"><span data-hover="Portfolio">Portfolio</span></a>
               </li>
            </ul>
         </div>
         <div class="menu-sidebar thim-hidden-768px">
         </div>
      </div>
      <div id="wrapper-container" class="wrapper-container">
         <div class="content-pusher ">
            <!-- toolbar/start -->
            <div class="toolbar-sidebar">
               <div class="container">
                  <div class="widget widget_siteorigin-panels-builder">
                     <div id="pl-w57674e2f6ed42" class="panel-layout">
                        <div id="pg-w57674e2f6ed42-0" class="panel-grid panel-has-style">
                           <div class="thim-hidden-md-2 panel-row-style panel-row-style-for-w57674e2f6ed42-0">
                              <div id="pgc-w57674e2f6ed42-0-0" class="panel-grid-cell">
                                 <div id="panel-w57674e2f6ed42-0-0-0" class="so-panel widget widget_sow-editor panel-first-child panel-last-child" data-index="0">
                                    <div class="so-widget-sow-editor so-widget-sow-editor-base">
                                       <div class="siteorigin-widget-tinymce textwidget">
                                          <ul>
                                             <li style="font-size: 12px">COMPASSIONATE TRIVANDRUM</li>
                                          </ul>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            <!-- toolbar/end -->
            <header id="masthead" class="site-header line">
               <div class="top-header">
                  <div class="container">
                     <div class="thim-toggle-mobile-menu">
                        <span class="inner">toggle menu</span>
                     </div>
                     <div class="thim-logo">
                        <a href="<?php echo base_url()?>" title="" rel="home">
                        <img class="logo" src="<?php echo base_url()?>application/views/<?php echo $this->system->theme_dir . $this->system->theme ?>/images/logo.png" alt="Test Website" />
                        <img class="sticky-logo" src="<?php echo base_url()?>application/views/<?php echo $this->system->theme_dir . $this->system->theme ?>/images/logo.png" alt="Test Website" />
                        <img class="mobile-logo" src="<?php echo base_url()?>application/views/<?php echo $this->system->theme_dir . $this->system->theme ?>/images/logo.png" alt="Test Website" />
                        </a>
                     </div>
                     <div class="thim-menu">
                     	<?php if ($navs = $this->navigation->get()) :?>
                        <div class="main-menu">
                           <ul class="nav navbar-nav">
                           	<?php $i=1; foreach ($navs as $nav) : ?>
                              <li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-home page_item page-item-4967 current_page_item standard">
                                 <a href="<?php echo $nav['uri']?>">
                                 <span data-hover="Home"><?php echo $nav['title']?></span>
                                 </a>
                              </li>
                              <?php $i++; endforeach; ?>
                             <!--  <li class="menu-item menu-item-type-post_type menu-item-object-page standard">
                                 <a href="./index.php/about/">
                                 <span data-hover="About Us">About Us</span>
                                 </a>
                              </li> -->
                              <!-- <li class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children drop_to_right standard">
                                 <a href="http://charitywp.thimpress.com/demo-3/campaigns">
                                 <span data-hover="Causes">Causes</span>
                                 </a>
                                 <ul class="sub-menu">
                                    <li class="menu-item menu-item-type-custom menu-item-object-custom">
                                       <a href="http://charitywp.thimpress.com/demo-3/campaigns/?style=list">Causes List</a>
                                    </li>
                                    <li class="menu-item menu-item-type-custom menu-item-object-custom">
                                       <a href="http://charitywp.thimpress.com/demo-3/campaigns/?style=grid">Causes Grid</a>
                                    </li>
                                    <li class="menu-item menu-item-type-custom menu-item-object-custom">
                                       <a href="http://charitywp.thimpress.com/demo-3/campaigns/building-clean-water-system-for-rural-poor/">Single Cause</a>
                                    </li>
                                 </ul>
                              </li> -->
                              
                           </ul>
                        </div>
                        <?php endif; ?>
                     </div>
                  </div>
               </div>
            </header>