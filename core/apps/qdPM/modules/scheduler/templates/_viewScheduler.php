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

<?php echo javascript_include_tag('/template/plugins/fullcalendar/fullcalendar/fullcalendar.min.js') ?>

<h3 class="page-title"><?php echo __('Personal Scheduler') ?></h3>

<div class="portlet calendar">
	<div class="portlet-title">
		<div class="caption">			
      <span id='loading' style='display:none'><img src="<?php echo public_path('images/spinner.gif') ?>"> <?php echo __('Loading...') ?></span> 
		</div>
	</div>
	<div class="portlet-body">
  		      
		<div id="calendar" class="has-toolbar"></div>	  
	</div>
</div>

<script>
var Calendar = function () {


    return {
        //main function to initiate the module
        init: function () {
            Calendar.initCalendar();
        },

        initCalendar: function () {

            if (!jQuery().fullCalendar) {
                return;
            }

            var date = new Date();
            var d = date.getDate();
            var m = date.getMonth();
            var y = date.getFullYear();

            var h = {};

            if (App.isRTL()) {
                 if ($('#calendar').parents(".portlet").width() <= 720) {
                    $('#calendar').addClass("mobile");
                    h = {
                        right: 'title, prev, next',
                        center: '',
                        right: 'agendaDay, agendaWeek, month, today'
                    };
                } else {
                    $('#calendar').removeClass("mobile");
                    h = {
                        right: 'title',
                        center: '',
                        left: 'agendaDay, agendaWeek, month, today, prev,next'
                    };
                }                
            } else {
                 if ($('#calendar').parents(".portlet").width() <= 720) {
                    $('#calendar').addClass("mobile");
                    h = {
                        left: 'title, prev, next',
                        center: '',
                        right: 'today,month,agendaWeek,agendaDay'
                    };
                } else {
                    $('#calendar').removeClass("mobile");
                    h = {
                        left: 'title',
                        center: '',
                        right: 'prev,next,today,month,agendaWeek,agendaDay'
                    };
                }
            }
           

            var initDrag = function (el) {
                // create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
                // it doesn't need to have a start or end
                var eventObject = {
                    title: $.trim(el.text()) // use the element's text as the event title
                };
                // store the Event Object in the DOM element so we can get to it later
                el.data('eventObject', eventObject);
                // make the event draggable using jQuery UI
                el.draggable({
                    zIndex: 999,
                    revert: true, // will cause the event to go back to its
                    revertDuration: 0 //  original position after the drag
                });
            }

              

            $('#calendar').fullCalendar('destroy'); // destroy the calendar
            $('#calendar').fullCalendar({ //re-initialize the calendar
                year: <?php echo ($sf_request->hasParameter('useYear') ? $sf_request->getParameter('useYear'):date('Y')) ?>,
                month: <?php echo ($sf_request->hasParameter('useMonth') ? $sf_request->getParameter('useMonth'):(date('n')-1)) ?>,                
                header: h,
                aspectRatio: 2,
                slotMinutes: 15,
                monthNames: ["<?php echo __('January') ?>", "<?php echo __('February') ?>", "<?php echo __('March') ?>", "<?php echo __('April') ?>", "<?php echo __('May') ?>", "<?php echo __('June') ?>", "<?php echo __('July') ?>","<?php echo __('August') ?>", "<?php echo __('September') ?>", "<?php echo __('October') ?>", "<?php echo __('November') ?>", "<?php echo __('December') ?>"], 
                monthNamesShort: ["<?php echo __('Jan') ?>", "<?php echo __('Feb') ?>", "<?php echo __('Mar') ?>", "<?php echo __('Apr') ?>", "<?php echo __('May') ?>", "<?php echo __('Jun') ?>","<?php echo __('Jul') ?>", "<?php echo __('Aug') ?>", "<?php echo __('Sep') ?>", "<?php echo __('Oct') ?>", "<?php echo __('Nov') ?>", "<?php echo __('Dec') ?>"],
                dayNamesShort: ["<?php echo __('Sun') ?>", "<?php echo __('Mon') ?>", "<?php echo __('Tue') ?>", "<?php echo __('Wed') ?>", "<?php echo __('Thu') ?>", "<?php echo __('Fri') ?>", "<?php echo __('Sat') ?>"],
                dayNames: ["<?php echo __('Sunday') ?>","<?php echo  __('Monday') ?>","<?php echo __('Tuesday') ?>","<?php echo  __('Wednesday') ?>","<?php echo  __('Thursday') ?>","<?php echo  __('Friday') ?>","<?php echo  __('Saturday')?>"],
                buttonText:{today: "<span class='fc-text-arrow'><i class='fa fa-calendar'></i></span>",month: "<?php echo __('Month') ?>",week: "<?php echo __('Week') ?>",day: "<?php echo __('Day') ?>"},
                allDayText:'',  
                editable: true,
                droppable: true, // this allows things to be dropped onto the calendar !!!
                drop: function (date, allDay) { // this function is called when something is dropped

                    // retrieve the dropped element's stored Event Object
                    var originalEventObject = $(this).data('eventObject');
                    // we need to copy it, so that multiple events don't have a reference to the same object
                    var copiedEventObject = $.extend({}, originalEventObject);

                    // assign it the date that was reported
                    copiedEventObject.start = date;
                    copiedEventObject.allDay = allDay;
                    copiedEventObject.className = $(this).attr("data-class");

                    // render the event on the calendar
                    // the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
                    $('#calendar').fullCalendar('renderEvent', copiedEventObject, true);

                    // is the "remove after drop" checkbox checked?
                    if ($('#drop-remove').is(':checked')) {
                        // if so, remove the element from the "Draggable Events" list
                        $(this).remove();
                    }
                },
                events: "<?php echo url_for('scheduler/jsonEvents')?>",
                eventClick: function(event) {
                    if (event.url) {                        
                        openModalBox(event.url);
                        return false;
                    }
                },
                eventMouseover:function( event, jsEvent, view ) { 
                 
                },
                dayClick: function(date, allDay, jsEvent, view) {                  
                  openModalBox("<?php echo url_for('scheduler/new'); ?>" + '?day='+$(this).attr('data-date')+'&users_id='+"<?php echo $users_id ?>")                                    
                },
                eventResize: function(event,dayDelta,minuteDelta,revertFunc) {                    
                    $.ajax({type: "POST",url: "<?php echo url_for('scheduler/eventResize')?>",data: {id:event.id,days:dayDelta,minutes:minuteDelta}});            
                },
                eventDrop: function(event,dayDelta,minuteDelta,allDay,revertFunc) {                      
                    $.ajax({type: "POST",url: "<?php echo url_for('scheduler/eventDrop')?>",data: {id:event.id,days:dayDelta,minutes:minuteDelta}});      
                },
                loading: function(bool) {
          				if (bool) $('#loading').show();
          				else $('#loading').hide();
          			}
                
            });

        }

    };

}();


</script>
