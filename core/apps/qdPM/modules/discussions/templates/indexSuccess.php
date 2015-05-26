<?php
/**
*qdPM
*
* NOTICE OF LICENSE
*
* This source file is subject to the Open Software License (OSL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/osl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@qdPM.net so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade qdPM to newer
* versions in the future. If you wish to customize qdPM for your
* needs please refer to http://www.qdPM.net for more information.
*
* @copyright  Copyright (c) 2009  Sergey Kharchishin and Kym Romanets (http://www.qdpm.net)
* @license    http://opensource.org/licenses/osl-3.0.php  Open Software License (OSL 3.0)
*/
?>
<?php if($sf_request->getParameter('projects_id')>0) include_component('projects','shortInfo', array('projects'=>$projects)) ?>

<h3 class="page-title"><?php echo __('Discussions') ?></h3>

<!--div class="pageHeading">
<table>
  <tr>
    <td><span class="pageHeading"><?php echo __('Discussions') ?></span></td>
    <td style="padding-left: 15px;"><?php include_component('discussions','filters') ?></td>
    <td style="padding-left: 15px;"><?php include_component('app','orderByMenu',array('module'=>'discussions')) ?></td>
    <td style="padding-left: 15px;"><?php include_component('app','searchMenu') ?></td>
  </tr>  
</table>
</div-->

<div><?php if(!$sf_request->hasParameter('search')) include_component('discussions','filtersPreview') ?></div>

<?php include_component('discussions','listing') ?>
