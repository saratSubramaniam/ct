<?php  if (!defined('BASEPATH')) exit('No direct script access allowed');?>
<h3>
    <?php  echo __("Latest campaigns", $this->template['module'])?>
</h3>
<ul>
    <?php  foreach ($rows as $row): ?>
    <li><a href="<?php  echo site_url('campaigns/'. $row['uri'])?>"><?php  echo (($row['title']) > 20 )? substr($row['title'], 0, 20) . '...': $row['title']?></a></li>
    <?php  endforeach; ?>
</ul>
