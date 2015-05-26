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
 * ExtraFieldsList
 * 
 * This class has been auto-generated by the Doctrine ORM Framework
 * 
 * @package    sf_sandbox
 * @subpackage model
 * @author     Your name here
 * @version    SVN: $Id: Builder.php 7490 2010-03-29 19:53:27Z jwage $
 */
class ExtraFieldsList extends BaseExtraFieldsList
{
  public static function deleteFieldsByBindId($bind_id,$bind_type)
  {
    $list = Doctrine_Core::getTable('ExtraFieldsList')
            ->createQuery('efl')
            ->leftJoin('efl.ExtraFields ef')
            ->addWhere('efl.bind_id=?',$bind_id)
            ->addWhere('ef.bind_type=?',$bind_type)
            ->execute();
            
    foreach($list as $l)
    {
      $l->delete();
    }
  }
  
  public static function resetFieldsValues()
  {
    $list = Doctrine_Core::getTable('ExtraFieldsList')
            ->createQuery('efl')
            ->leftJoin('efl.ExtraFields ef')
            ->addWhere('efl.bind_id>0')
            ->fetchArray();
            
    foreach($list as $l)
    {
      switch($l['ExtraFields']['bind_type'])
      {
        case 'projects': $t = 'Projects';
          break;
        case 'tasks': $t = 'Tasks';
          break;
        case 'tickets': $t = 'Tickets';
          break;
        case 'discussions': $t = 'Discussions';
          break;
        case 'users': $t = 'Users';
          break;
        case 'events': $t = 'Events';
          break;
        case 'contacts': $t = 'Contacts';
          break;     
      }
      
      if(Doctrine_Core::getTable($t)->createQuery()->addWhere('id=?',$l['bind_id'])->count()==0)
      {
        Doctrine_Query::create()
          ->delete()
          ->from('ExtraFieldsList')
          ->andWhere('id=?',$l['id'])
          ->execute();
      }
    }
  }
  
  public static function getFieldsByType($bind_type,$sf_user,$display_in_list=false, $query_params = array())
  {
    $q = Doctrine_Core::getTable('ExtraFields')
                ->createQuery()
                ->addWhere('bind_type=?',$bind_type)                
                ->addWhere('active=1');
    
    if($display_in_list)
    {
      $q->addWhere('display_in_list=1');
    }
    
    if(isset($query_params['exclude']))
    {
      $q->whereNotIn('type',explode(',',$query_params['exclude']));
    }
    elseif(isset($query_params['include']))
    {
      $q->whereIn('type',explode(',',$query_params['include']));
    }
                    
    return $q->orderBy('sort_order, name')                
                ->fetchArray();                                
  }
  
  public static function setValues($fields,$bind_id,$bind_type,$sf_user,$request)
  {
    $extra_fields = ExtraFieldsList::getFieldsByType($bind_type,$sf_user, false,array('all'=>true));
    
    foreach($extra_fields as $ef)
    { 
      //escape view only fields 
      if(in_array($sf_user->getAttribute('users_group_id'),explode(',',$ef['view_only_access']))) continue;
      
      if(isset($fields[$ef['id']]))
      {
        $v = $fields[$ef['id']];
      }
      else
      {
        $v = '';
      }
      
      $v = app::strip_tags($v);            
      
      if($ef['type']=='file')
      {
        
        $files = $request->getFiles();
        
        if($extra_fields_files_delete = $request->getParameter('extra_fields_files_delete'))
        {
          if(isset($extra_fields_files_delete[$ef['id']]))
          {
            if($a = Doctrine_Core::getTable('Attachments')->find($extra_fields_files_delete[$ef['id']]))
            {
              if(is_file($file_path = sfConfig::get('sf_upload_dir') . '/attachments/' . $a->getFile()))
              {
                unlink($file_path);
              }
              
              $a->delete();
            }
          }
        }
        
        if($extra_fields_files = $request->getParameter('extra_fields_files'))
        {
          if(isset($extra_fields_files[$ef['id']]))
          {
            $v = $extra_fields_files[$ef['id']];
          }
        }
        
        if(strlen($files['extra_fields'][$ef['id']]['name'])>0)
        {
          if($v>0)
          {
            if($a = Doctrine_Core::getTable('Attachments')->find($v))
            {
              if(is_file($file_path = sfConfig::get('sf_upload_dir') . '/attachments/' . $a->getFile()))
              {
                unlink($file_path);
              }
              
              $a->delete();
            }
          }          
          
          $file = $files['extra_fields'][$ef['id']];
          $filename = rand(111111,999999)  . '-' . $file['name'];
          move_uploaded_file($file['tmp_name'], sfConfig::get('sf_upload_dir') . '/attachments/'  . $filename);
                
          $a = new Attachments();
          $a->setFile($filename);          
          $a->setBindType('extra_fields');            
          $a->setBindId($ef['id']);                    
          $a->save();
          
          $v = $a->getId();
        }                        
      }
      elseif($ef['type']=='date_dropdown')
      {
        $v = implode('-',$v);
      }
      elseif($ef['type']=='date_range')
      {
        $v = implode('|',$v);
      }
      elseif($ef['type']=='checkbox' and is_array($v))
      {
        $v = implode("\n",$v);
      }            
      elseif(is_array($v))
      {
        $v = implode(',',$v);
      }
       
       $f = Doctrine_Core::getTable('ExtraFieldsList')
            ->createQuery()
            ->addWhere('bind_id=?',$bind_id)
            ->addWhere('extra_fields_id=?',$ef['id'])
            ->fetchOne();
            
        if($f)
        {
          $f->setValue($v);
          $f->save();
        }
        else
        {
          $f = new ExtraFieldsList;
          $f->setBindId($bind_id);
          $f->setExtraFieldsId($ef['id']);
          $f->setValue($v);
          $f->save();
        }     
    }
  }
  
  public static function getValuesList($extra_fields,$bind_id)
  {
    $ids = array();
    foreach($extra_fields as $v)
    {
      $ids[] = $v['id']; 
    }
    
    $list = Doctrine_Core::getTable('ExtraFieldsList')
              ->createQuery()
              ->addWhere('bind_id=?',$bind_id)
              ->whereIn('extra_fields_id',$ids)
              ->fetchArray();
    
    $values = array();
    
    foreach($list as $v)
    {
      $values[$v['extra_fields_id']] =$v['value'];
    }
    
    return $values;    
  }  
      
  public static function renderListingThead($extra_fields)
  {  
    $html = '';
    
    foreach($extra_fields as $v)
    {
      if($v['display_in_list']==1)
      {
        $html .= '<th ' . (in_array($v['type'],array('date','date_time','date_range','date_dropdown')) ? 'data-bsType="title-numeric"':''). '><div>' . $v['name'] . '</div></th>';
      } 
    }
    
    return $html;
  }
  
  public static function renderListingTbody($extra_fields,$values,$extra_values = array())
  {  
    $html = '';
    
    foreach($extra_fields as $v)
    {
      if($v['display_in_list']==1)
      {
        $html .= '<td>' . ExtraFieldsList::renderFieldValueByType($v,$values,$extra_values) . '</td>';
      }
    }
    
    return $html;
  }
  
  public static function getListingTotals($totals, $extra_fields,$values,$extra_values = array())
  {
    foreach($extra_fields as $v)
    {      
      if($v['display_in_list']==1 and in_array($v['type'],array('number','formula')))
      {
        if(!isset($totals[$v['id']])) $totals[$v['id']] = 0;
      
        $totals[$v['id']]+=ExtraFieldsList::renderFieldValueByType($v,$values,$extra_values);
      }
    }
    
    return $totals;
  }
  
  public static function renderListingTotals($totals, $extra_fields)
  {      
    $html = '';
    
    foreach($extra_fields as $v)
    {
      if($v['display_in_list']==1)
      {
        if(isset($totals[$v['id']]))
        {
          $html .= '<td>' . $totals[$v['id']] . '</td>';
        }
        else
        {
          $html .= '<td></td>';
        }
      }
    }
            
    return $html;
  }
  
  public static function renderDescriptionFileds($bind_type,$object,$sf_user, $use_fields = '')
  {
    if(strlen($use_fields)>0 and $use_fields=='set_off_extra_fields') return '';
    
    $extra_fields = ExtraFieldsList::getFieldsByType($bind_type,$sf_user,false,array('include'=>'textarea_wysiwyg,file','all'=>true));
    $values = ExtraFieldsList::getValuesList($extra_fields,($object?$object->getId():false));
    
    $html = '';
    
    foreach($extra_fields as $v)
    {
      if(strlen($use_fields)>0 and !in_array($v['id'],explode(',',$use_fields))) continue;
              
      if(strlen($value = ExtraFieldsList::renderFieldValueByType($v, $values))==0) continue;
      
      if($v['type']=='textarea_wysiwyg')
      {
        $value = replaceTextToLinks($value);
      }        
              
      $html .= '<div class="fieldHeading">' . $v['name']. ':</strong></div><div class="fieldDescription">' . $value . '</div>'; 
    }
    
    return $html;
  }
  
  public static function renderInfoFileds($bind_type,$object,$sf_user, $use_fields = '',$extra_values = array())
  {
    if(strlen($use_fields)>0 and $use_fields=='set_off_extra_fields') return '';
    
    $extra_fields = ExtraFieldsList::getFieldsByType($bind_type,$sf_user,false,array('exclude'=>'textarea_wysiwyg,file'));
    
    if($bind_type=='events')
    {
      $values = ExtraFieldsList::getValuesList($extra_fields,($object?$object->getEventId():false));
    }
    else
    {
      $values = ExtraFieldsList::getValuesList($extra_fields,($object?$object->getId():false));
    }
    
    $html = '';
    
    foreach($extra_fields as $v)
    {
      if(strlen($use_fields)>0 and !in_array($v['id'],explode(',',$use_fields))) continue;
              
      if(strlen($value = ExtraFieldsList::renderFieldValueByType($v, $values,$extra_values))==0) continue;        
              
      $html .= '
        <tr>
          <th>' . $v['name']. '</th>
          <td>' . $value . '</td>
        </tr>'; 
    }        
    
    return $html;
  }
  
  public static function renderFormFiledsByType($bind_type,$object,$sf_user,$type)
  {
    switch($type)
    {
      case 'input':
          $extra_fields = ExtraFieldsList::getFieldsByType($bind_type,$sf_user,false,array('exclude'=>'textarea_wysiwyg,file'));          
          return ExtraFieldsList::renderFormFileds($bind_type,$object,$sf_user, $extra_fields);
        break;
      case 'text':
          $extra_fields = ExtraFieldsList::getFieldsByType($bind_type,$sf_user,false,array('include'=>'textarea_wysiwyg'));
          return ExtraFieldsList::renderFormFileds($bind_type,$object,$sf_user, $extra_fields);
        break;
      case 'file':
          $extra_fields = ExtraFieldsList::getFieldsByType($bind_type,$sf_user,false,array('include'=>'file'));
          return ExtraFieldsList::renderFormFileds($bind_type,$object,$sf_user, $extra_fields);
        break;
    }
  }
  
  public static function renderFormFiledsByTab($bind_type,$object,$sf_user,$tab)
  {
    $extra_fields = ExtraFieldsList::getFieldsByType($bind_type,$sf_user,false,array('tab'=>$tab));
    return ExtraFieldsList::renderFormFileds($bind_type,$object,$sf_user, $extra_fields);
  }
  
  public static function renderFormFileds($bind_type,$object,$sf_user, $extra_fields = null)
  {
    if($extra_fields===null)
    {
      $extra_fields = ExtraFieldsList::getFieldsByType($bind_type,$sf_user);
    }
    
    if($bind_type=='events')
    {
      $values = ExtraFieldsList::getValuesList($extra_fields,($object?$object->getEventId():false));
    }
    else
    {
      $values = ExtraFieldsList::getValuesList($extra_fields,($object?$object->getId():false));
    }
    
    $html = ''; 
    
    foreach($extra_fields as $v)
    {
      if($v['type']=='formula') continue;
      
      
      $html .='
      <div class="form-group">
      	<label class="col-md-3 control-label">' . $v['name'] . ($v['type']=='checkbox' ? '<br><a href="#" onClick="return checkAllInContainer(\'checkboxesList' . $v['id']. '\')"><small>' .  __('Select All') . '</small></a>':'').  '</label>
      	<div class="col-md-9">
      		' . ExtraFieldsList::renderFormFieldByType($v, $values) . '
      	</div>
      </div>
      ';
    
    }
    
    return $html;
  }
  
  public static function renderFieldValueByType($f,$values,$extra_values = array(),$is_export = false)
  {
    $value = (isset($values[$f['id']])?$values[$f['id']]:'');
    
    switch($f['type'])
    {
      case 'file':
            $html = '';
            if($a = Doctrine_Core::getTable('Attachments')->find($value))
            {
              if($is_export)
              {
                return app::public_url('attachments/download?id='.$a->getId());
              }
              else
              {
                $html = Attachments::getLink($a);
              }
            }
          return $html;
        break;
      case 'date_dropdown':
          return (strlen($value)>2 ? app::dateFormat($value,0,($is_export ? false:true)):'');
        break;
      case 'date':
          return app::dateFormat($value,0,($is_export ? false:true));
        break;
      case 'date_time':
          return app::dateTimeFormat($value,0,($is_export ? false:true));
        break;
      case 'date_range':
          if(strlen($value)>1)
          {
            $value = explode('|',$value);
            
            return  app::dateFormat($value[0],0,($is_export ? false:true)) . ' - ' . app::dateFormat($value[1],0,($is_export ? false:true));
          }
          else
          {
            return '';
          }
        break;
      case 'formula':                 
           $formula = $f['default_values'];
           
           foreach($values as $k=>$v)
           {
             $formula = str_replace('[' . $k . ']',(float)$v,$formula);
           }
           
           foreach($extra_values as $k=>$v)
           {
             $formula = str_replace('[' . $k . ']',(float)$v,$formula);
           }
                                 
           if(!strstr($formula,'['))
           {
           
              if(strstr($formula,'{'))
              {
                $eval_str = 'function getFormulaValue()' . $formula . '; $fv=getFormulaValue();';
              }
              else
              {                  
                $eval_str = '$fv=' . $formula . ';';
              } 
                                                          
              @$r = eval($eval_str);
                                          
              if($r!==null)
              {        
                $fv = $formula;              
              }
              
             return $fv; 
           }
           else
           {
             return '';
           }                                 
        break;
      case 'checkbox':          
          return str_replace("\n",'<br>',$value);
        break;
      case 'url':
          if(strlen($value)>0)
          {      
            if(!strstr($value,'://'))
            {
              $value = 'http://' . $value;
            } 
            
            if($is_export)
            {
              return $value;
            }
            else
            {
              return '<a href="' . $value . '" target="blank">' . t::__('view') . '</a>';
            }                         
          }
          else
          {
            return '';
          }
        break;
      case 'textarea':          
          return nl2br($value);
        break; 
      default:
          return $value;
        break;
    }        
  }
  
  public static function renderFormFieldByType($f,$values)
  {
    $value = (isset($values[$f['id']])?$values[$f['id']]:'');
    
    $attributes = array();
    
    switch($f['type'])
    {
      case 'file':
          $html = '';
          if($value>0)
          if($a = Doctrine_Core::getTable('Attachments')->find($value))
          {
            $html = '<br>' . Attachments::getLink($a) . input_hidden_tag('extra_fields_files[' . $f['id'] . ']',$value) . '<br>' . input_checkbox_tag('extra_fields_files_delete[' . $f['id'] . ']',$value) . ' <label for="extra_fields_files_delete_' . $f['id'] . '">' . __('Delete') . '</label>';
            $attributes['class'] = '';
          }
          return input_file_tag('extra_fields[' . $f['id'] . ']','',$attributes) . $html;
        break; 
      case 'number':
          $attributes['class'] = 'form-control input-small';
          return input_tag('extra_fields[' . $f['id'] . ']',$value,$attributes);
        break;        
      case 'text':
      case 'url':
          $attributes['class'] = 'form-control input-large';
          return input_tag('extra_fields[' . $f['id'] . ']',$value,$attributes);
        break;  
      case 'textarea':
          $attributes['class'] = 'form-control input-xlarge';
          return textarea_tag('extra_fields[' . $f['id'] . ']',$value,$attributes);
        break;
      case 'textarea_wysiwyg':
          if(isset($attributes['class']))
          {
            $attributes['class'] .= ' form-control ckeditor';
          }
          else
          {
            $attributes['class'] = 'form-control ckeditor';
          }
      
          return textarea_tag('extra_fields[' . $f['id'] . ']',$value,$attributes);
        break;  
      case 'date':
          if(isset($attributes['class']))
          {
            $attributes['class'] .= 'form-control';
          }
          else
          {
            $attributes['class'] = 'form-control ';
          }
                              
          return '<div class="input-group input-medium date datepicker">' . input_tag('extra_fields[' . $f['id'] . ']',$value,$attributes) . '<span class="input-group-btn"><button class="btn btn-default date-set" type="button"><i class="fa fa-calendar"></i></button></span></div>';
        break;
      case 'date_range':
          if(isset($attributes['class']))
          {
            $attributes['class'] .= 'form-control';
          }
          else
          {
            $attributes['class'] = 'form-control';
          }
                    
                    
          if(strlen($value)>0)
          {          
            $value = explode('|',$value);
          }
          else
          {
            $value = array('','');
          }
                   
          return __('From') . ': 
                  <div class="input-group input-medium date datepicker">' . input_tag('extra_fields[' . $f['id'] . '][from]',$value[0],$attributes)  . '<span class="input-group-btn"><button class="btn btn-default date-set" type="button"><i class="fa fa-calendar"></i></button></span></div>                                    
                  ' . __('To') . ': 
                  <div class="input-group input-medium date datepicker">'. input_tag('extra_fields[' . $f['id'] . '][to]',$value[1],$attributes) . '<span class="input-group-btn"><button class="btn btn-default date-set" type="button"><i class="fa fa-calendar"></i></button></span></div>';
        break;          
      case 'date_time':
          if(isset($attributes['class']))
          {
            $attributes['class'] .= 'form-control';
          }
          else
          {
            $attributes['class'] = 'form-control';
          }
                              
          return '<div class="input-group input-medium date datetimepicker">' . input_tag('extra_fields[' . $f['id'] . ']',$value,$attributes) . '<span class="input-group-btn"><button class="btn btn-default date-set" type="button"><i class="fa fa-calendar"></i></button></span></div>';
        break;
      case 'date_dropdown':
          $attributes['class'] = 'form-control input-small'; 
          $years = range(date('Y')-100, date('Y')+20);                                                                
          $w = new sfWidgetFormDate(array('years' => array_combine($years, $years),'format'=>__('Year') . ':%year% ' . __('Month'). ':%month% ' . __('Day') . ':%day%'));
          return $w->render('extra_fields[' . $f['id'] . ']',$value,$attributes);
        break;            
      case 'pull_down':
          $choices = array();
          
          foreach(explode("\n",$f['default_values']) as $v)
          {
            $choices[trim($v)] = trim($v);
          }
          
          return select_tag('extra_fields[' . $f['id'] . ']',$value,array('choices'=>$choices),$attributes);
        break;
      case 'checkbox':
          $choices = array();
          
          foreach(explode("\n",$f['default_values']) as $v)
          {
            $choices[trim($v)] = trim($v);
          }
          
          return '<div id="checkboxesList' . $f['id'] . '" class="checkboxesList">' . select_tag('extra_fields[' . $f['id'] . ']',explode("\n",$value),array('choices'=>$choices, 'expanded' => true,'multiple' => true),$attributes) . '</div>';
        break;
      case 'radiobox':
          $choices = array();
          
          foreach(explode("\n",$f['default_values']) as $v)
          {
            $choices[trim($v)] = trim($v);
          }
          
          return select_tag('extra_fields[' . $f['id'] . ']',$value,array('choices'=>$choices, 'expanded' => true),$attributes);
        break;
    }
  }  
}
