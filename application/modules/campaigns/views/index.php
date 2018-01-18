<div class="container">
    <h1>
        <?php  echo $title ?>
    </h1>
    <?php $campaigns_pre_list = ""; ?>
    <?php echo $this->plugin->apply_filters("campaigns_pre_list", $campaigns_pre_list) ?>
    <?php  if (is_array($rows) && count($rows) > 0) :?>
    <div id="panel-4967-3-0-1" class="so-panel widget widget_events panel-last-child" data-index="8">
        <div class="thim-widget-events thim-widget-events-base">
            <div class="thim-events">
                <div class="events archive-content row">
                    <?php  $i = $total_rows; foreach($rows as $row):?>
                    <?php  if ($i % 2 != 0): $rowClass = 'odd'; else: $rowClass = 'even'; endif;?>


                    <article class="col-sm-4 post-277 tp_event type-tp_event status-tp-event-happenning has-post-thumbnail hentry">
                        <div class="content-inner">
                            <div class="entry-thumbnail">
                                <div class="thumbnail">
                                    <a href="<?php  echo site_url('campaigns/' . $row['uri'])?>">
                                        <?php if ($row['image']): ?>
                                        <img src="<?php  echo site_url('media/images/m/' . $row['image']['file'])?>" />
                                        <?php else : ?>
                                        <img src="<?php echo site_url('application/views/themes/aamada/images/demo_image-570x310.jpg');?>">
                                        <?php endif; ?>
                                    </a>
                                </div>
                                <a href="<?php  echo site_url('campaigns/' . $row['uri'])?>" class="thim-button style3">Read more</a>
                            </div>
                            <div class="event-content">
                                <div class="entry-meta">
                                    <div class="metas">
                                        <div class="entry-header">
                                            <h2 class="blog_title">
                                                <a href="<?php  echo site_url('campaigns/' . $row['uri'])?>">
                                                    <?php  echo $row['title']?>
                                                </a>
                                            </h2>
                                        </div>

                                        <span class="location">
                                            <i class="fa fa-map-marker"></i>
                                            <?php echo $row['institute'];?>                                     
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </article>



                    <?php  $i--; endforeach;?>
                    <div class="pager">
                        <?php  echo $pager?>
                    </div>
                    <?php  else : ?>
                    <?php  echo __("No campaigns found", $module)?>
                    <?php  endif; ?>

                </div>
            </div>
        </div>
    </div>

    <?php $campaigns_post_list = ""; ?>
    <?php echo $this->plugin->apply_filters("campaigns_post_list", $campaigns_post_list) ?>
</div>
