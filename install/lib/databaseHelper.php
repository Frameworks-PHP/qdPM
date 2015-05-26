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
<?php

  function tep_db_connect($server, $username, $password, $link = 'db_link') {
    global $$link, $db_error;

    $db_error = false;

    if (!$server) {
      $db_error = 'No Server selected.';
      return false;
    }

    $$link = @mysql_connect($server, $username, $password) or tep_db_error(mysql_error());
    
    tep_db_query("set names utf8");

    return $$link;
  }

  function tep_db_select_db($database) {
    if(!mysql_select_db($database)) tep_db_error(mysql_error());
  }

  function tep_db_query($query, $link = 'db_link') {
    global $$link;

    if(strlen(trim($query))>0)
    {
      return mysql_query($query, $$link) or die('Error: ' . mysql_errno() . ' - ' . mysql_error() . '<br><br>' . $query );
    }
  }
  
  function tep_db_error($error)
  {
    header('Location: index.php?step=database_config&db_error=' . urlencode($error));
    exit();
  }
