<h1>
    <?php  echo $campaigns['title']?>
</h1>
<?php if($campaigns['status'] == 0) : ?>
<div class='notice'>
    <?php echo __("Campaigns deactivated", $module) ?>
</div>
<?php endif; ?>
<?php  if ($this->user->level['campaigns'] >= LEVEL_EDIT) : ?>
<div class="adminbox">
    <?php  echo anchor('admin/campaigns/create/' . $campaigns['id'], __("Edit", "campaigns")) ?>
    <?php  if ($this->user->level['campaigns'] >= LEVEL_DEL) : ?> |
    <?php  echo anchor('admin/campaigns/delete/' . $campaigns['id'], __("Delete", "campaigns")) ?>

    <?php  endif; ?>
</div>
<?php  endif; ?>
<?php  
	$pre_content = "<div class='meta'><div class='author'>" . __("Submitted by:", "campaigns") . " " . $campaigns['author'] . "</div>";
	$pre_content .= "<div class='date'>" . __("On:", "campaigns") . " " . date("d/m/Y", $campaigns['date']) . "</div>";
	$pre_content .= "<div class='category'>" . __("In:", "campaigns") . " " . anchor('campaigns/cat/' . $campaigns['cat_uri'], (($campaigns['category'])?$campaigns['category']:__("No category", "campaigns"))) . "</div></div>";
	echo $this->plugin->apply_filters("campaigns_pre_content", $pre_content);
?>
<?php 
	if($page_break_pos = strpos($campaigns['body'], "<!-- page break -->"))
	{
		$campaigns['body'] = substr($campaigns['body'], $page_break_pos + 19);
	}
?>
<?php  echo $this->plugin->apply_filters("campaigns_content", $campaigns['body']) ?>


<?php $this->plugin->do_action('campaigns_post_content', $campaigns['id']); ?>
<div class="back">
    <a href="javascript:history.back()">
        <?php  echo __("Go back", $module) ?>
    </a>
</div>
<?php  if (!empty($comments)): ?>
<div id="comments">

    <h2>
        <?php  echo __("Comments:", "campaigns") ?>
    </h2>
    <?php  if (isset($notice) || $notice = $this->session->flashdata('notification')):?>
    <div class="notice">
        <?php  echo $notice;?>
    </div>
    <?php  endif;?>

    <?php  $i = 1; foreach ($comments as $comment): ?>
    <?php  if ($i % 2 != 0): $rowClass = 'odd'; else: $rowClass = 'even'; endif; ?>
    <div class="<?php  echo $rowClass?>">
        <h4>
            <?php  if (!empty($comment['website'])):?>
            <a href="<?php  echo $comment['website']?>">
                <?php  endif;?>
                <?php  echo $i . ". " . $comment['author']?>
                <?php  if (!empty($comment['website'])):?>
            </a>
            <?php  endif;?>
        </h4>
        <p>
            <?php  echo nl2br(strip_tags($comment['body'], "<b><i><img>")) ?></p>
    </div>
    <?php  $i++; endforeach; ?>
</div>
<?php  endif; ?>
<?php if ((isset($settings['allow_comments']) && $settings['allow_comments'] == 1) && $campaigns['allow_comments']) :?>
<div id='comment_form' class='clear'>
    <h2>
        <?php  echo __("Add a comment", $module)?>
    </h2>
    <form action="<?php  echo site_url('campaigns/comment')?>" method='post'>
        <input type='hidden' name='campaigns_id' value='<?php  echo $campaigns[' id ']?>' />
        <input class="input-text" type='hidden' name='uri' value='<?php  echo $campaigns[' uri ']?>' />
        <label for='author'><?php  echo __("Name:", $module)?>[*]</label>
        <?php  if ($this->user->logged_in) : ?>
        <input type='hidden' name='author' value="<?php  echo $this->user->username ?>" />
        <?php  echo $this->user->username ?><br />
        <?php  else: ?>
        <input class="input-text" type='text' name='author' value='' id='name' /><br />
        <?php  endif; ?>
        <label for='email'><?php  echo __("Email:", $module)?>[*]</label>
        <?php  if ($this->user->logged_in) : ?>
        <input type='hidden' name='email' value="<?php  echo $this->user->email ?>" />
        <?php  echo $this->user->email ?><br />
        <?php  else: ?>

        <input class="input-text" type='text' name='email' value='' id='email' /><br />
        <?php  endif; ?>
        <label for='body'><?php  echo __("Comment", $module)?>[*]</label>
        <textarea class="input-textarea" name='body' id='body' rows="10"></textarea><br />
        <?php  
$tmp = '';
$tmp = $this->plugin->apply_filters('campaigns_comment_form', $tmp);
echo $tmp;
?> [*]
        <?php  echo __("Required", $module)?><br />
        <input type='submit' name='submit' class="input-submit" value="<?php  echo __(" Add comment ", $module)?>" /><br />
    </form>
</div>
<?php endif ;?>
