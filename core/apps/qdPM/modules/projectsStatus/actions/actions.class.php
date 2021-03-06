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

/**
 * projectsStatus actions.
 *
 * @package    sf_sandbox
 * @subpackage projectsStatus
 * @author     Your name here
 * @version    SVN: $Id: actions.class.php 23810 2009-11-12 11:07:44Z Kris.Wallsmith $
 */
class projectsStatusActions extends sfActions
{
  public function executeIndex(sfWebRequest $request)
  {
    $this->projects_statuss = Doctrine_Core::getTable('ProjectsStatus')
      ->createQuery('a')
      ->orderBy('sort_order, name')
      ->execute();
      
    app::setPageTitle('Projects Status',$this->getResponse());
  }

  public function executeNew(sfWebRequest $request)
  {
    $this->form = new ProjectsStatusForm();
  }

  public function executeCreate(sfWebRequest $request)
  {
    $this->forward404Unless($request->isMethod(sfRequest::POST));

    $this->form = new ProjectsStatusForm();

    $this->processForm($request, $this->form);

    $this->setTemplate('new');
  }

  public function executeEdit(sfWebRequest $request)
  {
    $this->forward404Unless($projects_status = Doctrine_Core::getTable('ProjectsStatus')->find(array($request->getParameter('id'))), sprintf('Object projects_status does not exist (%s).', $request->getParameter('id')));
    $this->form = new ProjectsStatusForm($projects_status);
  }

  public function executeUpdate(sfWebRequest $request)
  {
    $this->forward404Unless($request->isMethod(sfRequest::POST) || $request->isMethod(sfRequest::PUT));
    $this->forward404Unless($projects_status = Doctrine_Core::getTable('ProjectsStatus')->find(array($request->getParameter('id'))), sprintf('Object projects_status does not exist (%s).', $request->getParameter('id')));
    $this->form = new ProjectsStatusForm($projects_status);

    $this->processForm($request, $this->form);

    $this->setTemplate('edit');
  }

  public function executeDelete(sfWebRequest $request)
  {
    $request->checkCSRFProtection();

    $this->forward404Unless($projects_status = Doctrine_Core::getTable('ProjectsStatus')->find(array($request->getParameter('id'))), sprintf('Object projects_status does not exist (%s).', $request->getParameter('id')));
    $projects_status->delete();

    $this->redirect('projectsStatus/index');
  }

  protected function processForm(sfWebRequest $request, sfForm $form)
  {
    $form->bind($request->getParameter($form->getName()), $request->getFiles($form->getName()));
    if ($form->isValid())
    {
      $projects_status = $form->save();
      
      if($projects_status->getDefaultValue()==1)
      {
        app::resetCfgDefaultValue($projects_status->getId(),'ProjectsStatus');
      }

      $this->redirect('projectsStatus/index');
    }
  }
}
