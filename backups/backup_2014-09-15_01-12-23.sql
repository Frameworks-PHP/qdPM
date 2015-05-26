DROP TABLE IF EXISTS discussions_reports;
DROP TABLE IF EXISTS discussions_comments;
DROP TABLE IF EXISTS discussions;
DROP TABLE IF EXISTS user_reports;
DROP TABLE IF EXISTS tasks_comments;
DROP TABLE IF EXISTS tasks;
DROP TABLE IF EXISTS tickets_reports;
DROP TABLE IF EXISTS tickets_comments;
DROP TABLE IF EXISTS tickets;
DROP TABLE IF EXISTS tasks_groups;
DROP TABLE IF EXISTS versions;
DROP TABLE IF EXISTS projects_phases;
DROP TABLE IF EXISTS projects_reports;
DROP TABLE IF EXISTS projects_comments;
DROP TABLE IF EXISTS projects;
DROP TABLE IF EXISTS attachments;
DROP TABLE IF EXISTS events;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS versions_status;
DROP TABLE IF EXISTS users_groups;
DROP TABLE IF EXISTS tickets_types;
DROP TABLE IF EXISTS tickets_status;
DROP TABLE IF EXISTS tasks_types;
DROP TABLE IF EXISTS tasks_status;
DROP TABLE IF EXISTS tasks_priority;
DROP TABLE IF EXISTS tasks_labels;
DROP TABLE IF EXISTS projects_types;
DROP TABLE IF EXISTS projects_status;
DROP TABLE IF EXISTS phases;
DROP TABLE IF EXISTS phases_status;
DROP TABLE IF EXISTS extra_fields_list;
DROP TABLE IF EXISTS extra_fields;
DROP TABLE IF EXISTS discussions_status;
DROP TABLE IF EXISTS configuration;


CREATE TABLE IF NOT EXISTS `configuration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8;

INSERT IGNORE INTO configuration VALUES
('1','app_administrator_email','admin@localhost.com'),
('2','app_administrator_password','$P$ELxhb.MkF1g//mVbf/kxW4uC4usawu.'),
('3','app_app_name','Workspace1'),
('4','app_app_short_name','qdPM'),
('5','app_email_label','qdPM -'),
('6','app_default_skin','qdPM'),
('7','sf_default_timezone','America/New_York'),
('8','sf_default_culture','en'),
('9','app_rows_per_page','15'),
('10','app_custom_short_date_format','M d, Y'),
('11','app_custom_logn_date_format','M d, Y H:i'),
('12','app_allow_adit_tasks_comments_date','on'),
('13','app_show_menu_icons','off'),
('14','app_show_footer_links','off'),
('15','app_tasks_fields_tasks_version','off'),
('16','app_tasks_fields_tasks_phase','on'),
('17','app_tasks_fields_tasks_group','off'),
('18','app_tasks_fields_priority','on'),
('19','app_tasks_fields_label','on'),
('20','app_tasks_fields_id','off'),
('21','app_tasks_fields_name','on'),
('22','app_tasks_fields_status','on'),
('23','app_tasks_fields_assigned_to','on'),
('24','app_tasks_fields_created_by','off'),
('25','app_tasks_fields_estimated_time','on'),
('26','app_tasks_fields_start_date','off'),
('27','app_tasks_fields_due_date','on'),
('28','app_tasks_fields_progress','off'),
('29','app_tasks_fields_created_at','off'),
('30','app_use_skins','on'),
('31','app_use_related_tasks','on'),
('32','app_use_public_tickets','on'),
('33','app_public_tickets_show_login_link','off'),
('34','app_public_tickets_allow_attachments','on'),
('35','app_use_project_phases','on'),
('36','app_use_project_versions','on'),
('37','app_use_project_discussions','on'),
('38','app_use_tasks_groups','on'),
('39','app_use_tasks_timetracker','on'),
('40','app_use_fck_editor','on'),
('41','app_notify_all_project_team','off'),
('42','app_notify_all_customers','off'),
('43','app_use_single_email','off'),
('44','app_single_email_addres_from',NULL),
('45','app_single_name_from',NULL),
('46','app_use_smtp','off'),
('47','app_smtp_server',NULL),
('48','app_smtp_port','25'),
('49','app_smtp_encryption',NULL),
('50','app_smtp_login',NULL),
('51','app_smtp_pass',NULL),
('52','app_use_ldap_login','on'),
('53','app_ldap_host',NULL),
('54','app_ldap_port',NULL),
('55','app_ldap_base_dn',NULL),
('56','app_ldap_version','3'),
('57','app_use_email_notification','on'),
('58','app_show_user_email','off'),
('59','app_show_user_photo','on'),
('60','app_tasks_fields_type','off'),
('61','app_login_page_heading','Welcome to qdPM'),
('62','app_login_page_content','Urgent Support\r\n \r\nIf your request is urgent and/or you want your Ticket dealt within 24 hours then please use the Express Support queue. All other tickets are handled on first come first serve basis.\r\n '),
('63','app_new_user_email_subject',NULL),
('64','app_new_user_email_body',NULL),
('65','app_amount_previous_comments','2'),
('66','app_rows_limit','150'),
('67','app_tasks_columns_list','Id,TasksGroups,Versions,ProjectsPhases,TasksPriority,TasksLabels,Name,TasksStatus,AssignedTo,CreatedBy,EstimatedTime,WorkHours,StartDate,DueDate,Progress,CreatedAt'),
('68','app_send_email_to_owner','on'),
('69','app_public_tickets_use_antispam','on'),
('70','app_app_logo','EX.png'),
('71','app_use_javascript_dropdown','on'),
('72','app_ldap_default_user_group','2'),
('73','app_ldap_server',NULL),
('74','app_ldap_uid',NULL),
('75','app_ldap_user_filter',NULL),
('76','app_ldap_email',NULL),
('77','app_ldap_user',NULL),
('78','app_ldap_password',NULL),
('79','app_notify_all_tasks','on'),
('80','app_notify_all_tickets','on'),
('81','app_notify_all_discussions','on');

CREATE TABLE IF NOT EXISTS `discussions_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `sort_order` int(11) DEFAULT '0',
  `default_value` tinyint(1) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT IGNORE INTO discussions_status VALUES
('1','Open','0','1','1'),
('2','Closed','1',NULL,'1');

CREATE TABLE IF NOT EXISTS `extra_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `bind_type` varchar(64) NOT NULL DEFAULT '',
  `type` varchar(64) DEFAULT NULL,
  `sort_order` int(11) DEFAULT '0',
  `active` tinyint(1) DEFAULT NULL,
  `display_in_list` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

INSERT IGNORE INTO extra_fields VALUES
('1','Review Brief','projects','date','2','1',NULL),
('2','Design','projects','date','3','1',NULL),
('3','Development','projects','date','4','1',NULL),
('4','Site Test','projects','date','5','1',NULL),
('5','UAT','projects','date','6','1',NULL),
('6','Go Live','projects','date','7',NULL,'1'),
('7','Live Url','projects','url','0','1',NULL),
('8','Test Url','projects','url','1','1',NULL),
('13','url','users','url','0','1','1'),
('21','Phone','users','text','0','1','1'),
('22','a sdfasd fas df','users','text','0','1',NULL),
('23','asdasdasdasd','users','text','0','1',NULL),
('24','qweqweqwe','users','text','0','1',NULL),
('25','date','tasks','date','0','1','1');

CREATE TABLE IF NOT EXISTS `extra_fields_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `extra_fields_id` int(11) NOT NULL DEFAULT '0',
  `bind_id` int(11) NOT NULL DEFAULT '0',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_extra_fields_list_extra_fields` (`extra_fields_id`),
  CONSTRAINT `extra_fields_list_ibfk_1` FOREIGN KEY (`extra_fields_id`) REFERENCES `extra_fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=467 DEFAULT CHARSET=utf8;

INSERT IGNORE INTO extra_fields_list VALUES
('95','7','7',''),
('96','8','7',''),
('97','1','7',''),
('98','2','7',''),
('99','3','7',''),
('100','4','7',''),
('101','5','7',''),
('102','7','8',''),
('103','8','8',''),
('104','1','8',''),
('105','2','8',''),
('106','3','8',''),
('107','4','8',''),
('108','5','8',''),
('120','13','3',''),
('121','21','3',''),
('124','21','5',''),
('125','13','5',''),
('126','22','6',''),
('127','23','6',''),
('128','21','6',''),
('129','24','6',''),
('130','13','6',''),
('131','7','9',''),
('133','8','9',''),
('134','1','9',''),
('135','2','9',''),
('136','3','9',''),
('137','4','9',''),
('138','5','9',''),
('139','7','10',''),
('141','8','10',''),
('142','1','10',''),
('143','2','10',''),
('144','3','10',''),
('145','4','10',''),
('146','5','10',''),
('147','22','3',''),
('148','23','3',''),
('149','24','3',''),
('150','7','11',''),
('151','8','11',''),
('152','1','11',''),
('153','2','11',''),
('154','3','11',''),
('155','4','11',''),
('156','5','11',''),
('157','7','12',''),
('158','8','12',''),
('159','1','12',''),
('160','2','12',''),
('161','3','12',''),
('162','4','12',''),
('163','5','12',''),
('164','7','13',''),
('165','8','13',''),
('166','1','13',''),
('167','2','13',''),
('168','3','13',''),
('169','4','13',''),
('170','5','13',''),
('171','7','14',''),
('172','8','14',''),
('173','1','14',''),
('174','2','14',''),
('175','3','14',''),
('176','4','14',''),
('177','5','14',''),
('178','7','15',''),
('179','8','15',''),
('180','1','15',''),
('181','2','15',''),
('182','3','15',''),
('183','4','15',''),
('184','5','15',''),
('185','7','16',''),
('186','8','16',''),
('187','1','16',''),
('188','2','16',''),
('189','3','16',''),
('190','4','16',''),
('191','5','16',''),
('192','22','5',''),
('193','23','5',''),
('194','24','5',''),
('195','22','7',''),
('196','23','7',''),
('197','21','7',''),
('198','24','7',''),
('199','13','7',''),
('200','22','8',''),
('201','23','8',''),
('202','21','8',''),
('203','24','8',''),
('204','13','8',''),
('205','25','4','2014-07-10'),
('206','25','3','2014-07-11'),
('207','25','2','2014-07-18'),
('208','25','1',''),
('209','25','5',''),
('210','25','6',''),
('211','25','7',''),
('212','25','8',''),
('213','25','9',''),
('214','25','10',''),
('215','25','11',''),
('216','7','17',''),
('217','8','17',''),
('218','1','17',''),
('219','2','17',''),
('220','3','17',''),
('221','4','17',''),
('222','5','17',''),
('223','7','18',''),
('224','8','18',''),
('225','1','18',''),
('226','2','18',''),
('227','3','18',''),
('228','4','18',''),
('229','5','18',''),
('230','7','19',''),
('231','8','19',''),
('232','1','19',''),
('233','2','19',''),
('234','3','19',''),
('235','4','19',''),
('236','5','19',''),
('237','7','20',''),
('238','8','20',''),
('239','1','20',''),
('240','2','20',''),
('241','3','20',''),
('242','4','20',''),
('243','5','20',''),
('244','7','21',''),
('245','8','21',''),
('246','1','21',''),
('247','2','21',''),
('248','3','21',''),
('249','4','21',''),
('250','5','21',''),
('251','7','22',''),
('252','8','22',''),
('253','1','22',''),
('254','2','22',''),
('255','3','22',''),
('256','4','22',''),
('257','5','22',''),
('258','7','23',''),
('259','8','23',''),
('260','1','23',''),
('261','2','23',''),
('262','3','23',''),
('263','4','23',''),
('264','5','23',''),
('265','7','24',''),
('266','8','24',''),
('267','1','24',''),
('268','2','24',''),
('269','3','24',''),
('270','4','24',''),
('271','5','24',''),
('272','7','25',''),
('273','8','25',''),
('274','1','25',''),
('275','2','25',''),
('276','3','25',''),
('277','4','25',''),
('278','5','25',''),
('279','7','26',''),
('280','8','26',''),
('281','1','26',''),
('282','2','26',''),
('283','3','26',''),
('284','4','26',''),
('285','5','26',''),
('286','7','27',''),
('287','8','27',''),
('288','1','27',''),
('289','2','27',''),
('290','3','27',''),
('291','4','27',''),
('292','5','27',''),
('293','7','28',''),
('294','8','28',''),
('295','1','28',''),
('296','2','28',''),
('297','3','28',''),
('298','4','28',''),
('299','5','28',''),
('300','7','29',''),
('301','8','29',''),
('302','1','29',''),
('303','2','29',''),
('304','3','29',''),
('305','4','29',''),
('306','5','29',''),
('307','7','30',''),
('308','8','30',''),
('309','1','30',''),
('310','2','30',''),
('311','3','30',''),
('312','4','30',''),
('313','5','30',''),
('314','7','31',''),
('315','8','31',''),
('316','1','31',''),
('317','2','31',''),
('318','3','31',''),
('319','4','31',''),
('320','5','31',''),
('321','7','32',''),
('322','8','32',''),
('323','1','32',''),
('324','2','32',''),
('325','3','32',''),
('326','4','32',''),
('327','5','32',''),
('328','7','33',''),
('329','8','33',''),
('330','1','33',''),
('331','2','33',''),
('332','3','33',''),
('333','4','33',''),
('334','5','33',''),
('335','7','34',''),
('336','8','34',''),
('337','1','34',''),
('338','2','34',''),
('339','3','34',''),
('340','4','34',''),
('341','5','34',''),
('342','7','35',''),
('343','8','35',''),
('344','1','35',''),
('345','2','35',''),
('346','3','35',''),
('347','4','35',''),
('348','5','35',''),
('349','7','36',''),
('350','8','36',''),
('351','1','36',''),
('352','2','36',''),
('353','3','36',''),
('354','4','36',''),
('355','5','36',''),
('356','7','37',''),
('357','8','37',''),
('358','1','37',''),
('359','2','37',''),
('360','3','37',''),
('361','4','37',''),
('362','5','37',''),
('363','7','38',''),
('364','8','38',''),
('365','1','38',''),
('366','2','38',''),
('367','3','38',''),
('368','4','38',''),
('369','5','38',''),
('370','7','39',''),
('371','8','39',''),
('372','1','39',''),
('373','2','39',''),
('374','3','39',''),
('375','4','39',''),
('376','5','39',''),
('377','7','40',''),
('378','8','40',''),
('379','1','40',''),
('380','2','40',''),
('381','3','40',''),
('382','4','40',''),
('383','5','40',''),
('384','7','41',''),
('385','8','41',''),
('386','1','41',''),
('387','2','41',''),
('388','3','41',''),
('389','4','41',''),
('390','5','41',''),
('391','7','42',''),
('392','8','42',''),
('393','1','42',''),
('394','2','42',''),
('395','3','42',''),
('396','4','42',''),
('397','5','42',''),
('398','7','43',''),
('399','8','43',''),
('400','1','43',''),
('401','2','43',''),
('402','3','43',''),
('403','4','43',''),
('404','5','43',''),
('405','7','44',''),
('406','8','44',''),
('407','1','44',''),
('408','2','44',''),
('409','3','44',''),
('410','4','44',''),
('411','5','44',''),
('412','7','45',''),
('413','8','45',''),
('414','1','45',''),
('415','2','45',''),
('416','3','45',''),
('417','4','45',''),
('418','5','45',''),
('419','25','16',''),
('420','25','17',''),
('421','25','18',''),
('422','22','9',''),
('423','23','9',''),
('424','21','9',''),
('425','24','9',''),
('426','13','9',''),
('427','25','19',''),
('428','7','46',''),
('429','8','46',''),
('430','1','46',''),
('431','2','46',''),
('432','3','46',''),
('433','4','46',''),
('434','5','46',''),
('435','22','10',''),
('436','23','10',''),
('437','21','10',''),
('438','24','10',''),
('439','13','10',''),
('440','25','20',''),
('441','25','21',''),
('442','25','22',''),
('443','25','23',''),
('444','25','24',''),
('445','25','25',''),
('446','25','26',''),
('447','25','27',''),
('448','25','28',''),
('449','25','29',''),
('450','25','30',''),
('451','25','31',''),
('452','25','32',''),
('453','25','33',''),
('454','25','34',''),
('455','25','35',''),
('456','25','36',''),
('457','25','37',''),
('458','25','38',''),
('459','25','39',''),
('460','25','40',''),
('461','25','41',''),
('462','25','42',''),
('463','25','43',''),
('464','25','44',''),
('465','25','45',''),
('466','25','46','');

CREATE TABLE IF NOT EXISTS `phases_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `sort_order` int(11) DEFAULT '0',
  `default_value` tinyint(1) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT IGNORE INTO phases_status VALUES
('1','Open','0','1','1'),
('2','Completed','2',NULL,'1'),
('3','On Hold','1',NULL,'1'),
('4','Cancelled','3',NULL,'1');

CREATE TABLE IF NOT EXISTS `phases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `default_values` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT IGNORE INTO phases VALUES
('1','New Site','Quotes\r\nGraphic Design\r\nDevelopment\r\nSite Test\r\nUser Test\r\nGo Live\r\nWarranty'),
('2','Support','Quotes\r\nDefects\r\nChanges\r\n');

CREATE TABLE IF NOT EXISTS `projects_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `sort_order` int(11) DEFAULT '0',
  `default_value` tinyint(1) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT IGNORE INTO projects_status VALUES
('1','Open','1','1','1'),
('2','On Hold','0',NULL,'1'),
('3','Closed','2',NULL,'1'),
('4','Cancelled','3',NULL,'1');

CREATE TABLE IF NOT EXISTS `projects_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `sort_order` int(11) DEFAULT '0',
  `active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT IGNORE INTO projects_types VALUES
('2','New Site','1','1'),
('3','Support','0','1'),
('4','Internal','2','1');

CREATE TABLE IF NOT EXISTS `tasks_labels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `sort_order` int(11) DEFAULT '0',
  `default_value` tinyint(1) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

INSERT IGNORE INTO tasks_labels VALUES
('1','Task','0','1','1'),
('2','Bug','1',NULL,'1'),
('3','Idea','2',NULL,'1'),
('4','Issue','4',NULL,'1'),
('5','Quote','3',NULL,'1'),
('6','Change','0',NULL,'1'),
('7','PlugIn','0',NULL,'1');

CREATE TABLE IF NOT EXISTS `tasks_priority` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `icon` varchar(64) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `default_value` tinyint(1) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

INSERT IGNORE INTO tasks_priority VALUES
('1','Urgent','prio_1.png','0',NULL,'1'),
('2','High','prio_2.png','1',NULL,'1'),
('3','Low','prio_4.png','3',NULL,'1'),
('4','Unknown',NULL,'4',NULL,'1'),
('5','Medum','prio_3.png','2','1','1');

CREATE TABLE IF NOT EXISTS `tasks_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `group` varchar(64) NOT NULL DEFAULT '',
  `sort_order` int(11) DEFAULT '0',
  `default_value` tinyint(1) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

INSERT IGNORE INTO tasks_status VALUES
('1','Open','open','0','1','1'),
('2','Suspended','closed','2',NULL,'1'),
('3','Waiting Assessment','open','2',NULL,'1'),
('4','Re-opened','open','1',NULL,'1'),
('5','Done?','done','0',NULL,'1'),
('6','Paid','closed','1',NULL,'1'),
('7','Completed','closed','0',NULL,'1'),
('8','Lost','done','1',NULL,'1');

CREATE TABLE IF NOT EXISTS `tasks_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `sort_order` int(11) DEFAULT '0',
  `default_value` tinyint(1) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT IGNORE INTO tasks_types VALUES
('1','Change Priority Rate (Hourly rate $25.00)','1','1','1'),
('2','Changes (Hourly rate $15.00)','0',NULL,'1'),
('3','Defects (Hourly rate $0.00)','2',NULL,'1');

CREATE TABLE IF NOT EXISTS `tickets_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `group` varchar(64) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `default_value` int(11) DEFAULT NULL,
  `active` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

INSERT IGNORE INTO tickets_status VALUES
('1','New','open','1','1','1'),
('2','Open','open','2',NULL,'1'),
('3','Waiting Assessment','done','0',NULL,'1'),
('4','Re-opened','open','3',NULL,'1'),
('5','Resolved','closed','0',NULL,'1'),
('6','Canceled','closed','3',NULL,'1'),
('7','Fixed','closed','2',NULL,'1'),
('8','Closed','closed','1',NULL,'1'),
('9','asd','open','0',NULL,'1');

CREATE TABLE IF NOT EXISTS `tickets_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `sort_order` int(11) DEFAULT NULL,
  `active` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT IGNORE INTO tickets_types VALUES
('1','Report a Bug','0','1'),
('2','Request a Change','1','1'),
('3','Raise an Issue','3','1'),
('4','Ask a Question','2','1');

CREATE TABLE IF NOT EXISTS `users_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `allow_view_all` tinyint(1) DEFAULT NULL,
  `allow_manage_projects` tinyint(1) DEFAULT NULL,
  `allow_manage_tasks` tinyint(1) DEFAULT NULL,
  `allow_manage_tickets` tinyint(1) DEFAULT NULL,
  `allow_manage_users` tinyint(1) DEFAULT NULL,
  `allow_manage_configuration` tinyint(1) DEFAULT NULL,
  `allow_manage_tasks_viewonly` tinyint(1) DEFAULT NULL,
  `allow_manage_discussions` tinyint(1) DEFAULT NULL,
  `allow_manage_discussions_viewonly` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

INSERT IGNORE INTO users_groups VALUES
('1','Admin','1','1','1','1','1','1',NULL,'1',NULL),
('2','Developer',NULL,'1','1',NULL,NULL,NULL,NULL,NULL,NULL),
('3','Client',NULL,'1',NULL,'1',NULL,NULL,NULL,'2',NULL),
('4','Manager',NULL,'1','1','1','1',NULL,NULL,NULL,NULL),
('5','Designer',NULL,NULL,'1',NULL,NULL,NULL,'1',NULL,NULL);

CREATE TABLE IF NOT EXISTS `versions_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `sort_order` int(11) DEFAULT '0',
  `default_value` tinyint(1) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT IGNORE INTO versions_status VALUES
('1','Open','0','1','1'),
('2','Done','0',NULL,'1');

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_group_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `photo` varchar(64) DEFAULT NULL,
  `email` varchar(255) NOT NULL DEFAULT '',
  `culture` varchar(5) DEFAULT NULL,
  `password` varchar(64) NOT NULL DEFAULT '',
  `active` tinyint(1) DEFAULT NULL,
  `skin` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pople_people_group` (`users_group_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`users_group_id`) REFERENCES `users_groups` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

INSERT IGNORE INTO users VALUES
('3','1','Sergey Kharchishin',NULL,'asd@asd.com','en','$P$E.0161JOJFSZXtnDEgmemwKY2hKdG71','1','blue'),
('5','1','qweqwe','402506-IMG_1787.JPG','qwe@qwe.com','en','efe6398127928f1b2e9ef3207fb82663','1',NULL),
('6','2','werwer developer',NULL,'wer@wer.com','en','$P$E1v0vnyUnFIKi.AeUolQvoANpnG9b8.','1',NULL),
('7','1','Kym','252414-522593-avatar.jpg','kym@localhost.com','en','a8f5f167f44f4964e6c998dee827110c','1',NULL),
('8','1','Olga','883273-586684-olga.jpg','olga@localhost.com','en','a8f5f167f44f4964e6c998dee827110c','1',NULL),
('9','1','werwer',NULL,'wer@wer123.com','en','$P$ENOmo6mtbG5pnQHPPHXj2lBuPuABMv0','1',NULL),
('10','1','rrrrr',NULL,'rrr@rrr.com','en','$P$Eltek3hBm./g9NVJsVscd6isk8lHLg/','1',NULL);

CREATE TABLE IF NOT EXISTS `departments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '',
  `sort_order` int(11) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `users_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_departments_users` (`users_id`),
  CONSTRAINT `fk_departments_users` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT IGNORE INTO departments VALUES
('1','Support',NULL,'1','3');

CREATE TABLE IF NOT EXISTS `events` (
  `event_id` int(11) NOT NULL AUTO_INCREMENT,
  `event_name` text NOT NULL,
  `start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `details` text NOT NULL,
  `users_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`event_id`),
  KEY `fk_events_users` (`users_id`),
  CONSTRAINT `events_ibfk_1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

INSERT IGNORE INTO events VALUES
('1','test','2014-08-27 00:00:00','2014-08-28 00:00:00','<p>asdfasdfasdf</p>','3'),
('2','test2','2014-08-27 00:00:00','2014-08-29 13:25:00','<p>asdfasdfasdf</p>','3'),
('3','test3','2014-08-29 07:20:00','2014-08-29 14:05:00','<p>test3</p>','3'),
('4','test4','2014-08-28 00:00:00','2014-08-28 00:00:00','<p>test4</p>','3'),
('5','test5','2014-08-27 00:00:00','2014-08-27 00:00:00','<p>test5</p>','3'),
('6','test','2014-09-29 00:00:00','2014-10-02 00:00:00','<p>asdfasdfasdfasdf</p>','3'),
('7','qweqwe','2014-08-27 12:00:00','2014-08-28 13:00:00','<p>qweqwe</p>','3'),
('11','asdasd asdf asdfa sdfas dfasd fasdf asdf asdf asdfasfd asdf','2014-09-17 00:00:00','2014-09-18 00:00:00','<p>asdasdasdasdasd</p>','3'),
('13','asdasdasd11','2014-09-02 03:55:00','2014-09-11 09:25:00','','3');

CREATE TABLE IF NOT EXISTS `attachments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bind_type` varchar(64) NOT NULL DEFAULT '',
  `bind_id` int(11) NOT NULL DEFAULT '0',
  `file` varchar(255) DEFAULT NULL,
  `info` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8;

INSERT IGNORE INTO attachments VALUES
('21','projects','10','966501-IPLGConvertible.png','Lorem ipsum dolor sit amet,\r\nconsectetuer adipiscing elit, sed \r\ndiam nonummy nibh euismod \r\ntincidunt ut laoreet dolore magna \r\naliquam erat volutpat.Lorem ipsum'),
('22','projects','10','317942-JX.png','dqweqw'),
('23','projects','10','774043-MSedan.png','121321'),
('24','projects','10','495274-EX.png',NULL),
('38','projectsComments','3','548389-GCoupe.png',NULL),
('39','projectsComments','3','209600-GSedan.png',NULL),
('40','projectsComments','3','763815-IPLGCoupe.png',NULL),
('41','projectsComments','3','755468-JX.png',NULL),
('42','projectsComments','3','589090-QX.png',NULL),
('43','projectsComments','4','750052-FX.png',NULL),
('44','projectsComments','4','252032-GSedan.png',NULL),
('45','projectsComments','4','361154-JX.png',NULL),
('46','projects','11','643198-example1.png',NULL),
('47','projects','11','903353-Projects (6).csv',NULL),
('48','projects','11','792286-Projects (5).csv',NULL),
('49','projects','11','755954-Projects (4).csv',NULL),
('50','tasks','1','960658-974632-330265-head_warren.jpg',NULL),
('51','tasks','1','943045-example1.png',NULL),
('52','tickets','3','169253-Запросы.csv',NULL),
('53','tickets','3','740139-Задачи.csv',NULL),
('56','tasks','6','198160-Запросы.csv',NULL),
('57','tasks','6','587185-Задачи.csv',NULL),
('58','events','6','779135-EX.png',NULL),
('59','events','6','954998-FX.png',NULL),
('60','projects','44','941380-EX.png',NULL),
('61','projects','44','903595-FX.png',NULL),
('62','projectsComments','28','184270-IPLGCoupe.png',NULL),
('63','projectsComments','29','189238-IPLGCoupe.png',NULL),
('64','projectsComments','29','425158-JX.png',NULL),
('66','tasks','18','986010-EX.png',NULL),
('67','tasks','18','926896-FX.png',NULL),
('68','ticketsComments','9','865879-GConvertible.png',NULL),
('69','comments','24','583252-IPLGCoupe.png',NULL),
('70','tickets','9','141166-GCoupe.png',NULL),
('71','tickets','9','548623-JX.png',NULL),
('72','discussions','5','325105-JX.png',NULL),
('73','discussionsComments','4','984731-JX.png',NULL),
('74','ticketsComments','11','722023-GCoupe.png',NULL),
('75','ticketsComments','11','695674-JX.png',NULL),
('76','projects','35','547227-logo8.jpg',NULL),
('77','comments','46','251207-MSedan.png',NULL),
('78','comments','46','747577-QX.png',NULL),
('79','comments','50','392240-GCoupe.png',NULL),
('80','comments','50','197727-JX.png',NULL),
('81','projectsComments','30','572533-IPLGCoupe.png',NULL),
('82','tasks','36','397452-GCoupe.png',NULL),
('83','tasks','36','676061-JX.png',NULL),
('84','tasks','46','300798-GCoupe.png',NULL),
('85','tasks','46','640168-JX.png',NULL);

CREATE TABLE IF NOT EXISTS `projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projects_status_id` int(11) DEFAULT NULL,
  `projects_types_id` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `team` text,
  `created_at` datetime DEFAULT NULL,
  `order_tasks_by` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_projects_projects_status` (`projects_status_id`),
  KEY `fk_projects_project_types` (`projects_types_id`),
  KEY `fk_projects_pople` (`created_by`),
  CONSTRAINT `projects_ibfk_1` FOREIGN KEY (`projects_status_id`) REFERENCES `projects_status` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `projects_ibfk_2` FOREIGN KEY (`projects_types_id`) REFERENCES `projects_types` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `projects_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

INSERT IGNORE INTO projects VALUES
('7','2','2','3','Project 1',NULL,'7,8,9,6','2014-06-07 11:21:52',NULL),
('8','2','3','3','Project 2',NULL,NULL,'2014-06-07 11:22:04',NULL),
('10','1','2','3','test','<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</p>','3,5,6','2014-07-06 08:56:33',NULL),
('11','1','3','3','Project 3 First paragraph has','<div id=\"result1\" style=\"color: rgb(0, 0, 0); font-family: Helvetica, Arial, Verdana, sans-serif; font-size: medium; line-height: normal;\">First paragraph has selected class:&nbsp;false</div>\r\n\r\n<div id=\"result2\" style=\"color: rgb(0, 0, 0); font-family: Helvetica, Arial, Verdana, sans-serif; font-size: medium; line-height: normal;\">Second paragraph has selected class:&nbsp;true</div>\r\n\r\n<div id=\"result3\" style=\"color: rgb(0, 0, 0); font-family: Helvetica, Arial, Verdana, sans-serif; font-size: medium; line-height: normal;\">At least one paragraph has selected class:&nbsp;true\r\n<div id=\"result1\" style=\"color: rgb(0, 0, 0); font-family: Helvetica, Arial, Verdana, sans-serif; font-size: medium; line-height: normal;\">First paragraph has selected class:&nbsp;false</div>\r\n\r\n<div id=\"result2\" style=\"color: rgb(0, 0, 0); font-family: Helvetica, Arial, Verdana, sans-serif; font-size: medium; line-height: normal;\">Second paragraph has selected class:&nbsp;true</div>\r\n\r\n<div id=\"result3\" style=\"color: rgb(0, 0, 0); font-family: Helvetica, Arial, Verdana, sans-serif; font-size: medium; line-height: normal;\">At least one paragraph has selected class:&nbsp;true\r\n<div id=\"result1\" style=\"color: rgb(0, 0, 0); font-family: Helvetica, Arial, Verdana, sans-serif; font-size: medium; line-height: normal;\">First paragraph has selected class:&nbsp;false</div>\r\n\r\n<div id=\"result2\" style=\"color: rgb(0, 0, 0); font-family: Helvetica, Arial, Verdana, sans-serif; font-size: medium; line-height: normal;\">Second paragraph has selected class:&nbsp;true</div>\r\n\r\n<div id=\"result3\" style=\"color: rgb(0, 0, 0); font-family: Helvetica, Arial, Verdana, sans-serif; font-size: medium; line-height: normal;\">At least one paragraph has selected class:&nbsp;true\r\n<div id=\"result1\" style=\"color: rgb(0, 0, 0); font-family: Helvetica, Arial, Verdana, sans-serif; font-size: medium; line-height: normal;\">First paragraph has selected class:&nbsp;false</div>\r\n\r\n<div id=\"result2\" style=\"color: rgb(0, 0, 0); font-family: Helvetica, Arial, Verdana, sans-serif; font-size: medium; line-height: normal;\">Second paragraph has selected class:&nbsp;true</div>\r\n\r\n<div id=\"result3\" style=\"color: rgb(0, 0, 0); font-family: Helvetica, Arial, Verdana, sans-serif; font-size: medium; line-height: normal;\">At least one paragraph has selected class:&nbsp;true</div>\r\n</div>\r\n</div>\r\n</div>','7,8,3','2014-07-07 03:27:44',NULL),
('13','1','3','3','Project 5',NULL,NULL,'2014-07-07 03:28:01',NULL),
('14','1','3','3','Project 6',NULL,NULL,'2014-07-07 03:28:09',NULL),
('15','1','2','3','Project 7',NULL,NULL,'2014-07-07 03:48:26',NULL),
('16','1','3','3','Project 8',NULL,'3,8,6','2014-07-07 03:49:54',NULL),
('17','1','3','3','test','<p>testa sdfas dfasd fasd fasdf asdfsad f</p>',NULL,'2014-09-03 04:00:01',NULL),
('18','1','3','3','test','<p>testa sdfas dfasd fasd fasdf asdfsad f</p>',NULL,'2014-09-03 04:00:33',NULL),
('19','1','3','3','test','<p>asdfasdf asdf asdfa sdfasdf asdf asfd</p>','7,3','2014-09-03 04:01:01',NULL),
('20','1','3','3','test','<p>asdfasdf asdf asdfa sdfasdf asdf asfd</p>','7,3','2014-09-03 04:05:16',NULL),
('21','1','3','3','test','<p>asdfasdf asdf asdfa sdfasdf asdf asfd</p>','7,3','2014-09-03 04:06:49',NULL),
('22','1','3','3','test','<p>asdfasdf asdf asdfa sdfasdf asdf asfd</p>','7,3','2014-09-03 04:07:17',NULL),
('23','1','3','3','test','<p>asdfasdf asdf asdfa sdfasdf asdf asfd</p>','7,3','2014-09-03 04:07:49',NULL),
('24','1','3','3','test','<p>asdfasdf asdf asdfa sdfasdf asdf asfd</p>','7,3','2014-09-03 04:09:07',NULL),
('25','1','3','3','test','<p>asdfasdf asdf asdfa sdfasdf asdf asfd</p>','7,3','2014-09-03 04:09:37',NULL),
('26','1','3','3','test','<p>asdfasdf asdf asdfa sdfasdf asdf asfd</p>','7,3','2014-09-03 04:10:53',NULL),
('27','1','3','3','test','<p>asdfasdf asdf asdfa sdfasdf asdf asfd</p>','7,3','2014-09-03 04:11:11',NULL),
('28','1','3','3','test','<p>asdfasdf asdf asdfa sdfasdf asdf asfd</p>','7,3','2014-09-03 04:11:39',NULL),
('29','1','3','3','test','<p>asdfasdf asdf asdfa sdfasdf asdf asfd</p>','7,3','2014-09-03 04:11:58',NULL),
('30','1','3','3','test','<p>asdfasdf asdf asdfa sdfasdf asdf asfd</p>','7,3','2014-09-03 04:12:22',NULL),
('31','1','3','3','test','<p>asdfasdf asdf asdfa sdfasdf asdf asfd</p>','7,3','2014-09-03 04:13:08',NULL),
('32','1','3','3','test','<p>asdfasdf asdf asdfa sdfasdf asdf asfd</p>','7,3','2014-09-03 04:14:41',NULL),
('33','1','3','3','test','<p>asdfasdf asdf asdfa sdfasdf asdf asfd</p>','7,3','2014-09-03 04:16:37',NULL),
('34','1','3','3','test','<p>asdfasdf asdf asdfa sdfasdf asdf asfd</p>','7,3','2014-09-03 04:17:00',NULL),
('35','1','3','3','test','<p>asdfasdf asdf asdfa sdfasdf asdf asfd</p>','7,3','2014-09-03 04:18:31',NULL),
('36','1','3','3','test','<p>asdfasdf asdf asdfa sdfasdf asdf asfd</p>','7,3','2014-09-03 04:18:41',NULL),
('37','1','3','3','test','<p>asdfasdf asdf asdfa sdfasdf asdf asfd</p>','7,3','2014-09-03 04:18:47',NULL),
('38','1','3','3','test','<p>asdfasdf asdf asdfa sdfasdf asdf asfd</p>','7,3','2014-09-03 04:19:11',NULL),
('39','1','3','3','test','<p>asdfasdf asdf asdfa sdfasdf asdf asfd</p>','7,3','2014-09-03 04:19:40',NULL),
('40','1','3','3','test','<p>asdfasdf asdf asdfa sdfasdf asdf asfd</p>','7,3','2014-09-03 04:20:09',NULL),
('41','1','3','3','test','<p>asdfasdf asdf asdfa sdfasdf asdf asfd</p>','7,3','2014-09-03 04:20:20',NULL),
('42','1','3','3','test','<p>asdfasdf asdf asdfa sdfasdf asdf asfd</p>','7,3','2014-09-03 04:20:39',NULL),
('43','1','3','3','test','<p>asdfasdf asdf asdfa sdfasdf asdf asfd</p>','7,3','2014-09-03 04:20:52',NULL),
('44','1','3','3','test','<p>asdfasdf asdf asdfa sdfasdf asdf asfd</p>','7,3','2014-09-03 04:21:07',NULL),
('45','1','3','3','asdasdasdasd','<p>asdasdasdasd</p>',NULL,'2014-09-03 05:47:26',NULL),
('46','1','3','3','asdfasdfasdf','<p>asdfasdfasdfasdf</p>',NULL,'2014-09-08 04:34:45',NULL);

CREATE TABLE IF NOT EXISTS `projects_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projects_id` int(11) NOT NULL DEFAULT '0',
  `created_by` int(11) DEFAULT NULL,
  `description` text,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_projects_comments_projects` (`projects_id`),
  KEY `fk_projects_comments_pople` (`created_by`),
  CONSTRAINT `projects_comments_ibfk_1` FOREIGN KEY (`projects_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `projects_comments_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

INSERT IGNORE INTO projects_comments VALUES
('1','10','3','Assigned To: asdasd1, qweqwe, werwer','2014-07-06 11:09:22'),
('2','10','3','<p>asdasdasdasdas</p>','2014-07-06 13:22:07'),
('3','10','3','<p>I thinks alskdj a;lks ;alsk;askas</p>','2014-07-06 13:30:02'),
('4','10','3','<p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>','2014-07-06 13:33:23'),
('5','11','3','<p>asdfasdasdf</p>','2014-07-08 06:32:48'),
('6','11','3','<p>фывафывафыва</p>','2014-07-09 02:34:05'),
('7','14','3','<p>test</p>','2014-07-09 10:10:09'),
('8','14','3','<p>I don</p>','2014-07-09 10:26:55'),
('9','11','3','Назначен: Kym, Olga, Sergey Kharchishin','2014-07-10 02:36:14'),
('10','14','3','<p>asdfasdfasdf</p>','2014-09-03 05:34:39'),
('11','14','3','<p>asdfasdfasdf</p>','2014-09-03 05:34:50'),
('12','14','3','<p>asdfasdfasdf</p>','2014-09-03 05:35:12'),
('13','14','3','<p>asdfasdfasdf</p>','2014-09-03 05:35:52'),
('14','14','3','<p>asdfasdfasdf</p>','2014-09-03 05:36:06'),
('15','14','3','<p>asdfasdfasdf</p>','2014-09-03 05:39:14'),
('16','14','3','<p>asdfasdfasdf</p>','2014-09-03 05:40:03'),
('17','14','3','<p>asdfasdfasdf</p>','2014-09-03 05:40:18'),
('18','14','3','<p>asdfasdfasdf</p>','2014-09-03 05:41:13'),
('19','14','3','<p>asdfasdfasdf</p>','2014-09-03 05:41:55'),
('20','14','3','<p>asdfasdfasdf</p>','2014-09-03 05:42:24'),
('21','14','3','<p>asdfasdfasdf</p>','2014-09-03 05:42:35'),
('22','14','3','<p>asdfasdfasdf</p>','2014-09-03 05:42:56'),
('23','14','3','<p>asdfasdfasdf</p>','2014-09-03 05:43:06'),
('24','14','3','<p>asdfasdfasdf</p>','2014-09-03 05:43:14'),
('25','14','3','<p>asdfasdfasdf</p>','2014-09-03 05:43:54'),
('26','14','3','<p>asdfasdfasdf</p>','2014-09-03 05:44:02'),
('27','14','3','<p>asdfasdfasdf</p>','2014-09-03 05:44:54'),
('28','14','3','<p>asdfasdfasdf</p>','2014-09-03 05:46:01'),
('29','14','3','<p>asdfasdf</p>\r\n\r\n<ul>\r\n	<li>asdfasdf</li>\r\n	<li>asd fasdf as</li>\r\n</ul>\r\n\r\n<p>df</p>\r\n\r\n<p>asdfasdflkjas;ldfkjasdf</p>','2014-09-03 05:46:38'),
('30','7','3','<p>asdfasdfasdfasdf</p>','2014-09-08 04:27:06'),
('31','16','3','Assigned To: Sergey Kharchishin, Olga, werwer developer','2014-09-12 09:54:14'),
('32','7','3','Assigned To: Kym, Olga, werwer, werwer developer','2014-09-13 06:22:56');

CREATE TABLE IF NOT EXISTS `projects_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `display_on_home` tinyint(1) DEFAULT NULL,
  `projects_id` text,
  `projects_type_id` text,
  `projects_status_id` text,
  `in_team` int(11) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `display_in_menu` tinyint(1) DEFAULT NULL,
  `visible_on_home` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `users_id` (`users_id`),
  CONSTRAINT `projects_reports_ibfk_1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT IGNORE INTO projects_reports VALUES
('1','3','All Projects','1',NULL,NULL,NULL,'0',NULL,'1',NULL),
('2','3','My Projects','0',NULL,NULL,NULL,'3',NULL,'1',NULL);

CREATE TABLE IF NOT EXISTS `projects_phases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projects_id` int(11) NOT NULL DEFAULT '0',
  `phases_status_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `due_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_projects_phases_projects` (`projects_id`),
  KEY `fk_projects_phases_phases_status` (`phases_status_id`),
  CONSTRAINT `projects_phases_ibfk_1` FOREIGN KEY (`projects_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `projects_phases_ibfk_2` FOREIGN KEY (`phases_status_id`) REFERENCES `phases_status` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT IGNORE INTO projects_phases VALUES
('1','7','1','Phase1','2014-07-16'),
('2','7','1','Phase2',NULL);

CREATE TABLE IF NOT EXISTS `versions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projects_id` int(11) NOT NULL DEFAULT '0',
  `versions_status_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `due_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_versions_versions_status` (`versions_status_id`),
  KEY `fk_versions_projects` (`projects_id`),
  CONSTRAINT `versions_ibfk_1` FOREIGN KEY (`projects_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `versions_ibfk_2` FOREIGN KEY (`versions_status_id`) REFERENCES `versions_status` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT IGNORE INTO versions VALUES
('1','7','1','version1',NULL,NULL),
('2','7','1','version2',NULL,'2014-07-30');

CREATE TABLE IF NOT EXISTS `tasks_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projects_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `fk_tasks_groups_projects` (`projects_id`),
  CONSTRAINT `tasks_groups_ibfk_1` FOREIGN KEY (`projects_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT IGNORE INTO tasks_groups VALUES
('1','7','group1'),
('2','7','group2');

CREATE TABLE IF NOT EXISTS `tickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `departments_id` int(11) DEFAULT NULL,
  `tickets_types_id` int(11) DEFAULT NULL,
  `tickets_status_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `users_id` int(11) NOT NULL DEFAULT '0',
  `projects_id` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tickets_users` (`users_id`),
  KEY `fk_tickets_tickets_status` (`tickets_status_id`),
  KEY `fk_tickets_tickets_types` (`tickets_types_id`),
  KEY `fk_tickets_projects` (`projects_id`),
  KEY `fk_tickets_departments` (`departments_id`),
  CONSTRAINT `fk_tickets_tickets_status` FOREIGN KEY (`tickets_status_id`) REFERENCES `tickets_status` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `fk_tickets_tickets_types` FOREIGN KEY (`tickets_types_id`) REFERENCES `tickets_types` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `fk_tickets_users` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`projects_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tickets_ibfk_2` FOREIGN KEY (`departments_id`) REFERENCES `departments` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

INSERT IGNORE INTO tickets VALUES
('1','1','1','1','New Bug','<p>Some Description here</p>','3','11','2014-07-11 03:15:42'),
('2','1','1','2','Ticket 1',NULL,'3','7','2014-07-11 03:15:52'),
('3','1','1','2','Ticket 2','<p>asdasdfasdfasdfa sdfasd fasdf asdfasdf asdf asdf asdf asdfas dfasd fasdf saf</p>','3','11','2014-07-11 03:16:04'),
('4','1','1','2','Ticket 3',NULL,'3','11','2014-07-11 03:16:31'),
('5','1','1','2','Ticket 4',NULL,'3','11','2014-07-11 03:16:44'),
('6','1','1','5','Test',NULL,'3','14','2014-09-03 06:25:15'),
('7','1','1','5','test ticket','<p>asdfasdfasfdasdf asdf&nbsp;</p>','3','14','2014-09-03 06:33:34'),
('8','1','1','1','test ticket','<p>asdfasdfasfdasdf asdf&nbsp;</p>','3','14','2014-09-03 06:34:03'),
('9','1','1','1','test ticket','<p>asdfasdfasfdasdf asdf&nbsp;</p>','3','14','2014-09-03 06:34:15'),
('10','1','1','1','Test','<p>asdfasdfsafd</p>','3','7','2014-09-08 04:28:09'),
('11','1','1','1','asdfasdfasdfas','<p>asdfasdfasdfasf</p>','3','7','2014-09-08 04:34:15'),
('12','1','1','1','test',NULL,'3','16','2014-09-12 10:31:13'),
('13','1','1','1','test',NULL,'3','16','2014-09-12 10:32:09'),
('14','1','1','1','test',NULL,'3','16','2014-09-12 10:35:06'),
('15','1','1','1','asdfasdasdf',NULL,'3','16','2014-09-12 10:41:09'),
('16','1','1','1','asdasdad',NULL,'3','16','2014-09-12 11:18:25'),
('17','1','1','1','test',NULL,'3','16','2014-09-12 11:27:49');

CREATE TABLE IF NOT EXISTS `tickets_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `tickets_id` int(11) NOT NULL DEFAULT '0',
  `users_id` int(11) DEFAULT NULL,
  `tickets_status_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tickets_comments_tickets` (`tickets_id`),
  KEY `fk_tickets_comments_users` (`users_id`),
  KEY `k_tickets_comments_status` (`tickets_status_id`),
  CONSTRAINT `fk_tickets_comments_tickets` FOREIGN KEY (`tickets_id`) REFERENCES `tickets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tickets_comments_users` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `tickets_comments_ibfk_1` FOREIGN KEY (`tickets_status_id`) REFERENCES `tickets_status` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

INSERT IGNORE INTO tickets_comments VALUES
('1',NULL,'2014-07-11 03:21:54','1','3','2'),
('2',NULL,'2014-07-11 03:21:54','2','3','2'),
('3',NULL,'2014-07-11 03:21:54','3','3','2'),
('4',NULL,'2014-07-11 03:21:54','4','3','2'),
('5',NULL,'2014-07-11 03:21:54','5','3','2'),
('8','<p>asdfasdf asdf</p>','2014-09-03 06:25:28','6','3','9'),
('9','<p>asdfasdfasdfasdf</p>','2014-09-03 06:25:56','6','3','5'),
('10','<p>asdasdasdasdasd</p>','2014-09-03 06:43:04','7','3','5'),
('11','<p>asdasdasdasdasdasd</p>','2014-09-03 06:43:15','7','3',NULL),
('12','<p>asdfasdf</p>','2014-09-08 04:30:49','10','3',NULL),
('13','<p>asdfasdfasdf</p>','2014-09-08 04:32:32','10','3',NULL),
('14','<p>asdfasdfasdfasdf asdfas df</p>','2014-09-12 10:35:30','12','3',NULL);

CREATE TABLE IF NOT EXISTS `tickets_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `display_on_home` tinyint(1) DEFAULT NULL,
  `projects_id` text,
  `projects_type_id` text,
  `projects_status_id` text,
  `departments_id` text,
  `tickets_types_id` text,
  `tickets_status_id` text,
  `sort_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `users_id` (`users_id`),
  CONSTRAINT `tickets_reports_ibfk_1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT IGNORE INTO tickets_reports VALUES
('2','3','All tickets','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL);

CREATE TABLE IF NOT EXISTS `tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projects_id` int(11) NOT NULL DEFAULT '0',
  `tasks_status_id` int(11) DEFAULT NULL,
  `tasks_priority_id` int(11) DEFAULT NULL,
  `tasks_type_id` int(11) DEFAULT NULL,
  `tasks_label_id` int(11) DEFAULT NULL,
  `tasks_groups_id` int(11) DEFAULT NULL,
  `projects_phases_id` int(11) DEFAULT NULL,
  `versions_id` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `assigned_to` varchar(255) DEFAULT NULL,
  `estimated_time` float DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `tickets_id` int(11) DEFAULT NULL,
  `closed_date` date DEFAULT NULL,
  `discussion_id` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `progress` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tasks_projects` (`projects_id`),
  KEY `fk_tasks_task_status` (`tasks_status_id`),
  KEY `fk_tasks_task_type` (`tasks_type_id`),
  KEY `fk_tasks_task_label` (`tasks_label_id`),
  KEY `fk_tasks_projects_phases` (`projects_phases_id`),
  KEY `fk_tasks_pople` (`created_by`),
  KEY `fk_tasks_tasks_groups` (`tasks_groups_id`),
  KEY `fk_tasks_versions` (`versions_id`),
  KEY `fk_tasks_tasks_priority` (`tasks_priority_id`),
  KEY `fk_tasks_tickets` (`tickets_id`),
  CONSTRAINT `tasks_ibfk_1` FOREIGN KEY (`projects_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tasks_ibfk_10` FOREIGN KEY (`tickets_id`) REFERENCES `tickets` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `tasks_ibfk_2` FOREIGN KEY (`tasks_status_id`) REFERENCES `tasks_status` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `tasks_ibfk_3` FOREIGN KEY (`tasks_priority_id`) REFERENCES `tasks_priority` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `tasks_ibfk_4` FOREIGN KEY (`tasks_type_id`) REFERENCES `tasks_types` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `tasks_ibfk_5` FOREIGN KEY (`tasks_label_id`) REFERENCES `tasks_labels` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `tasks_ibfk_6` FOREIGN KEY (`tasks_groups_id`) REFERENCES `tasks_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tasks_ibfk_7` FOREIGN KEY (`projects_phases_id`) REFERENCES `projects_phases` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tasks_ibfk_8` FOREIGN KEY (`versions_id`) REFERENCES `versions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tasks_ibfk_9` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

INSERT IGNORE INTO tasks VALUES
('1','11','6','3','1','1',NULL,NULL,NULL,'3','test',NULL,'7','10','2014-07-10','2014-07-09 10:31:01',NULL,'2014-09-02',NULL,'2014-07-10','10'),
('2','11','6','5','2','6',NULL,NULL,NULL,'3','Task 1','<p>&nbsp;asdfa sdfas dfasd fasdf asdf asdfas dfasd fsadf&nbsp;&nbsp;asdfa sdfas dfasd fasdf asdf asdfas dfasd fsadf&nbsp;&nbsp;asdfa sdfas dfasd fasdf asdf asdfas dfasd fsadf&nbsp;&nbsp;asdfa sdfas dfasd fasdf asdf asdfas dfasd fsadf&nbsp;&nbsp;asdfa sdfas dfasd fasdf asdf asdfas dfasd fsadf&nbsp;&nbsp;asdfa sdfas dfasd fasdf asdf asdfas dfasd fsadf&nbsp;&nbsp;asdfa sdfas dfasd fasdf asdf asdfas dfasd fsadf&nbsp;&nbsp;asdfa sdfas dfasd fasdf asdf asdfas dfasd fsadf&nbsp;</p>','7','10','2014-07-18','2014-07-10 01:44:23',NULL,'2014-09-02',NULL,NULL,'10'),
('3','7','1','1','1','1',NULL,NULL,NULL,'3','task 2',NULL,'7,8,3,9','10','2014-09-09','2014-07-10 01:44:27',NULL,NULL,NULL,NULL,'10'),
('4','11','6','2','1','1',NULL,NULL,NULL,'3','task3',NULL,'7','10','2014-07-19','2014-07-10 01:44:32',NULL,'2014-09-02',NULL,NULL,'10'),
('5','11','6','5','1','1',NULL,NULL,NULL,'3','related task 1','<p>test</p>',NULL,NULL,'2014-08-05','2014-07-11 04:05:38',NULL,'2014-09-02',NULL,'2014-08-01',NULL),
('6','11','6','5','1','1',NULL,NULL,NULL,'3','Ticket 2','<p>asdasdfasdfasdfa sdfasd fasdf asdfasdf asdf asdf asdf asdfas dfasd fasdf saf</p>',NULL,NULL,NULL,'2014-07-11 04:06:03',NULL,'2014-09-02',NULL,NULL,NULL),
('7','11','6','5','1','1',NULL,NULL,NULL,'3','related task 2',NULL,NULL,NULL,'2014-08-15','2014-07-11 04:15:45',NULL,'2014-09-02',NULL,'2014-08-05',NULL),
('8','11','6','5','1','1',NULL,NULL,NULL,'3','related task 3',NULL,NULL,NULL,'2014-08-22','2014-07-11 04:15:59',NULL,'2014-09-02',NULL,'2014-08-09',NULL),
('9','11','1','5','1','1',NULL,NULL,NULL,'3','Asdasdasasd',NULL,NULL,NULL,NULL,'2014-07-11 04:18:40',NULL,NULL,NULL,NULL,NULL),
('10','11','1','5','1','1',NULL,NULL,NULL,'3','asdasdasdasd',NULL,NULL,NULL,NULL,'2014-07-11 04:21:56','1',NULL,NULL,NULL,NULL),
('11','11','1','5','1','1',NULL,NULL,NULL,'3','asdasdasd','<p>asdasdasdasd</p>',NULL,NULL,NULL,'2014-07-11 12:54:32',NULL,NULL,NULL,NULL,NULL),
('12','16','6',NULL,'1',NULL,NULL,NULL,NULL,'3','﻿related task 1',NULL,NULL,NULL,NULL,'2014-09-03 00:51:03',NULL,NULL,NULL,NULL,NULL),
('13','16','6',NULL,'1',NULL,NULL,NULL,NULL,'3','﻿related task 2',NULL,NULL,NULL,NULL,'2014-09-03 00:51:03',NULL,NULL,NULL,NULL,NULL),
('14','16','6',NULL,'1',NULL,NULL,NULL,NULL,'3','﻿related task 3',NULL,NULL,NULL,NULL,'2014-09-03 00:51:03',NULL,NULL,NULL,NULL,NULL),
('16','14','1','5','1','1',NULL,NULL,NULL,'3','test','<p>asdasdasd</p>',NULL,NULL,NULL,'2014-09-03 06:18:44',NULL,NULL,NULL,NULL,NULL),
('17','14','3','5','1','1',NULL,NULL,NULL,'3','The test task','<p>asd fasdf asdf asdf</p>\r\n\r\n<p>as dfa</p>\r\n\r\n<p>sd fas</p>\r\n\r\n<p>df asd</p>\r\n\r\n<p>f&nbsp;</p>','3','11','2014-09-04','2014-09-03 06:19:21',NULL,NULL,NULL,'2014-09-03',NULL),
('18','14','1','5','1','1',NULL,NULL,NULL,'3','The test task','<p>asd fasdf asdf asdf</p>\r\n\r\n<p>as dfa</p>\r\n\r\n<p>sd fas</p>\r\n\r\n<p>df asd</p>\r\n\r\n<p>f&nbsp;</p>','3','11','2014-09-20','2014-09-03 06:20:52',NULL,NULL,NULL,'2014-09-03',NULL),
('19','7','1','5','1','1',NULL,NULL,NULL,'3','asdfasdfasdfasdf','<p>aasdfasdfasdf</p>',NULL,NULL,NULL,'2014-09-08 04:34:28',NULL,NULL,NULL,NULL,NULL),
('20','16','1','5','1','1',NULL,NULL,NULL,'3','Test',NULL,NULL,NULL,NULL,'2014-09-12 10:16:58',NULL,NULL,NULL,NULL,NULL),
('21','16','1','5','1','1',NULL,NULL,NULL,'3','asdasd',NULL,NULL,NULL,NULL,'2014-09-12 11:18:49',NULL,NULL,NULL,NULL,NULL),
('22','16','1','5','1','1',NULL,NULL,NULL,'3','tset',NULL,NULL,NULL,NULL,'2014-09-12 11:20:01',NULL,NULL,NULL,NULL,NULL),
('23','16','1','5','1','1',NULL,NULL,NULL,'3','test',NULL,'8,3,6',NULL,NULL,'2014-09-12 11:21:14',NULL,NULL,NULL,NULL,NULL),
('24','16','1','5','1','1',NULL,NULL,NULL,'3','asdfasdf',NULL,NULL,NULL,NULL,'2014-09-12 11:33:05',NULL,NULL,NULL,NULL,NULL),
('25','16','1','5','1','1',NULL,NULL,NULL,'3','asdfasdf',NULL,NULL,NULL,NULL,'2014-09-12 11:33:21',NULL,NULL,NULL,NULL,NULL),
('26','16','1','5','1','1',NULL,NULL,NULL,'3','asdfasdf','<p>asdfasdf</p>',NULL,NULL,NULL,'2014-09-12 11:34:31',NULL,NULL,NULL,NULL,NULL),
('27','16','1','5','1','1',NULL,NULL,NULL,'3','asdfasdf','<p>asdfasdf</p>',NULL,NULL,NULL,'2014-09-12 11:34:46',NULL,NULL,NULL,NULL,NULL),
('28','16','1','5','1','1',NULL,NULL,NULL,'3','asdfasdf','<p>asdfasdf</p>',NULL,NULL,NULL,'2014-09-12 11:35:27',NULL,NULL,NULL,NULL,NULL),
('29','8','1','5','1','1',NULL,NULL,NULL,'3','test email','<p>asdfasdfasdfasdf</p>',NULL,NULL,NULL,'2014-09-13 01:21:18',NULL,NULL,NULL,NULL,NULL),
('30','8','1','5','1','1',NULL,NULL,NULL,'3','test email','<p>asdfasdfasdfasdf</p>',NULL,NULL,NULL,'2014-09-13 01:23:26',NULL,NULL,NULL,NULL,NULL),
('31','8','1','5','1','1',NULL,NULL,NULL,'3','test email','<p>asdfasdfasdfasdf</p>',NULL,NULL,NULL,'2014-09-13 01:24:08',NULL,NULL,NULL,NULL,NULL),
('32','8','1','5','1','1',NULL,NULL,NULL,'3','test email','<p>asdfasdfasdfasdf</p>',NULL,NULL,NULL,'2014-09-13 01:26:32',NULL,NULL,NULL,NULL,NULL),
('33','8','1','5','1','1',NULL,NULL,NULL,'3','test email','<p>asdfasdfasdfasdf</p>',NULL,NULL,NULL,'2014-09-13 01:27:18',NULL,NULL,NULL,NULL,NULL),
('34','8','1','5','1','1',NULL,NULL,NULL,'3','test email','<p>asdfasdfasdfasdf</p>',NULL,NULL,NULL,'2014-09-13 01:35:12',NULL,NULL,NULL,NULL,NULL),
('35','8','1','5','1','1',NULL,NULL,NULL,'3','test email','<p>asdfasdfasdfasdf</p>',NULL,NULL,NULL,'2014-09-13 01:36:31',NULL,NULL,NULL,NULL,NULL),
('36','8','1','5','1','1',NULL,NULL,NULL,'3','test email','<p>asdfasdfasdfasdf</p>',NULL,NULL,NULL,'2014-09-13 01:50:05',NULL,NULL,NULL,NULL,NULL),
('37','7','1','5','1','1',NULL,NULL,NULL,'3','test','<p>asdfasdfas dfasd fasdf</p>',NULL,NULL,NULL,'2014-09-13 02:23:56',NULL,NULL,NULL,NULL,NULL),
('38','7','1','5','1','1',NULL,NULL,NULL,'3','test','<p>asdfasdfas dfasd fasdf</p>',NULL,NULL,NULL,'2014-09-13 02:24:50',NULL,NULL,NULL,NULL,NULL),
('39','7','1','5','1','1',NULL,NULL,NULL,'3','test','<p>asdfasdfas dfasd fasdf</p>',NULL,NULL,NULL,'2014-09-13 02:25:06',NULL,NULL,NULL,NULL,NULL),
('40','7','1','5','1','1',NULL,NULL,NULL,'3','test','<p>asdfasdfas dfasd fasdf</p>',NULL,NULL,NULL,'2014-09-13 02:27:57',NULL,NULL,NULL,NULL,NULL),
('41','7','1','5','1','1',NULL,NULL,NULL,'3','test','<p>asdfasdfas dfasd fasdf</p>',NULL,NULL,NULL,'2014-09-13 02:28:19',NULL,NULL,NULL,NULL,NULL),
('42','7','1','5','1','1',NULL,NULL,NULL,'3','test','<p>asdfasdfas dfasd fasdf</p>',NULL,NULL,NULL,'2014-09-13 02:28:58',NULL,NULL,NULL,NULL,NULL),
('43','7','1','5','1','1',NULL,NULL,NULL,'3','test','<p>asdfasdfas dfasd fasdf</p>',NULL,NULL,NULL,'2014-09-13 02:29:26',NULL,NULL,NULL,NULL,NULL),
('44','7','1','5','1','1',NULL,NULL,NULL,'3','test','<p>asdfasdfas dfasd fasdf</p>',NULL,NULL,NULL,'2014-09-13 02:32:48',NULL,NULL,NULL,NULL,NULL),
('45','7','1','5','1','1',NULL,NULL,NULL,'3','test','<p>asdfasdfas dfasd fasdf</p>',NULL,NULL,NULL,'2014-09-13 02:33:08',NULL,NULL,NULL,NULL,NULL),
('46','7','1','5','1','1',NULL,NULL,NULL,'3','test','<p>asdfasdfas dfasd fasdf</p>',NULL,NULL,NULL,'2014-09-13 02:33:59',NULL,NULL,NULL,NULL,NULL);

CREATE TABLE IF NOT EXISTS `tasks_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tasks_id` int(11) NOT NULL DEFAULT '0',
  `created_by` int(11) DEFAULT NULL,
  `tasks_status_id` int(11) DEFAULT NULL,
  `tasks_priority_id` int(11) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `worked_hours` float DEFAULT NULL,
  `description` text,
  `created_at` datetime DEFAULT NULL,
  `progress` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tasks_comments_pople` (`created_by`),
  KEY `fk_tasks_comments_tasks` (`tasks_id`),
  KEY `fk_tasks_comments_status` (`tasks_status_id`),
  KEY `fk_tasks_comments_priority` (`tasks_priority_id`),
  CONSTRAINT `tasks_comments_ibfk_1` FOREIGN KEY (`tasks_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tasks_comments_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `tasks_comments_ibfk_3` FOREIGN KEY (`tasks_status_id`) REFERENCES `tasks_status` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `tasks_comments_ibfk_4` FOREIGN KEY (`tasks_priority_id`) REFERENCES `tasks_priority` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;

INSERT IGNORE INTO tasks_comments VALUES
('1','2','3',NULL,NULL,NULL,NULL,'Назначен: Kym, Olga, Sergey Kharchishin','2014-07-10 02:36:49',NULL),
('2','2','3','4',NULL,NULL,NULL,'<p>tes comment</p>\r\n\r\n<p>asdasdasd</p>','2014-07-10 04:29:00',NULL),
('3','2','3',NULL,NULL,NULL,NULL,'<p>thsis the test 2</p>','2014-07-10 04:30:00',NULL),
('4','2','3','4','3','2014-07-18','5','<p>asdasdasdads</p>','2014-07-10 04:30:00',NULL),
('5','2','3',NULL,NULL,NULL,NULL,'<p>123123123123</p>','2014-07-10 04:33:00',NULL),
('6','1','3',NULL,NULL,NULL,NULL,'Назначен: Kym','2014-07-10 13:39:52',NULL),
('7','2','3',NULL,NULL,NULL,NULL,'Назначен: Kym','2014-07-10 13:39:53',NULL),
('8','3','3',NULL,NULL,NULL,NULL,'Назначен: Kym','2014-07-10 13:39:53',NULL),
('9','4','3',NULL,NULL,NULL,NULL,'Назначен: Kym','2014-07-10 13:39:53',NULL),
('10','2','3',NULL,NULL,NULL,'10',NULL,'2014-09-02 01:28:00',NULL),
('11','2','3',NULL,NULL,NULL,'20',NULL,'2014-09-02 01:28:00',NULL),
('12','6','3',NULL,NULL,NULL,'5',NULL,'2014-09-02 01:28:00',NULL),
('13','1','3',NULL,NULL,NULL,'25',NULL,'2014-09-02 01:28:00',NULL),
('14','5','3',NULL,NULL,NULL,'7',NULL,'2014-09-02 01:28:00',NULL),
('15','7','3',NULL,NULL,NULL,'8',NULL,'2014-09-02 01:29:00',NULL),
('16','8','3',NULL,NULL,NULL,'9',NULL,'2014-09-02 01:29:00',NULL),
('17','2','3','6',NULL,NULL,NULL,NULL,'2014-09-02 01:29:46',NULL),
('18','6','3','6',NULL,NULL,NULL,NULL,'2014-09-02 01:29:46',NULL),
('19','5','3','6',NULL,NULL,NULL,NULL,'2014-09-02 01:29:46',NULL),
('20','7','3','6',NULL,NULL,NULL,NULL,'2014-09-02 01:29:46',NULL),
('21','8','3','6',NULL,NULL,NULL,NULL,'2014-09-02 01:29:46',NULL),
('22','4','3','6',NULL,NULL,NULL,NULL,'2014-09-02 01:29:46',NULL),
('23','1','3','6',NULL,NULL,NULL,NULL,'2014-09-02 01:29:46',NULL),
('24','17','3','3',NULL,'2014-09-04',NULL,'<p>asdasdasdasd asdfasd fasdf asdf safd</p>','2014-09-03 06:28:00',NULL),
('25','3','3',NULL,NULL,NULL,NULL,'<p>asdasdasdasdasd</p>','2014-09-04 02:30:00',NULL),
('26','3','3',NULL,NULL,NULL,NULL,'<p>asdasdasd</p>','2014-09-04 02:30:00',NULL),
('27','3','3','1','1','2014-09-09',NULL,'<p>asdfasdfasdfasdf asdfas dfasdf asdf&nbsp;</p>','2014-09-08 03:45:00',NULL),
('28','3','3','1','1','2014-09-09',NULL,'<p>asdfasdfasdfasdf asdfas dfasdf asdf&nbsp;</p>','2014-09-08 03:45:00',NULL),
('29','3','3','1','1','2014-09-09',NULL,'<p>asdfasdfasdfasdf asdfas dfasdf asdf&nbsp;</p>','2014-09-08 03:45:00',NULL),
('30','3','3','1','1','2014-09-09',NULL,'<p>asdfasdfasdfasdf asdfas dfasdf asdf&nbsp;</p>','2014-09-08 03:45:00',NULL),
('31','3','3','1','1','2014-09-09',NULL,'<p>asdfasdfasdfasdf asdfas dfasdf asdf&nbsp;</p>','2014-09-08 03:45:00',NULL),
('32','3','3','1','1','2014-09-09',NULL,'<p>asdfasdfasdfasdf asdfas dfasdf asdf&nbsp;</p>','2014-09-08 03:45:00',NULL),
('33','3','3','1','1','2014-09-09',NULL,'<p>asdfasdfasdfasdf asdfas dfasdf asdf&nbsp;</p>','2014-09-08 03:45:00',NULL),
('34','3','3','1','1','2014-09-09',NULL,'<p>asdfasdfasdfasdf asdfas dfasdf asdf&nbsp;</p>','2014-09-08 03:45:00',NULL),
('35','3','3','1','1','2014-09-09',NULL,'<p>asdfasdfasdfasdf asdfas dfasdf asdf&nbsp;</p>','2014-09-08 03:45:00',NULL),
('36','3','3','1','1','2014-09-09',NULL,'<p>asdfasdfasdfasdf asdfas dfasdf asdf&nbsp;</p>','2014-09-08 03:45:00',NULL),
('37','3','3','1','1','2014-09-09',NULL,'<p>asdfasdfasdfasdf asdfas dfasdf asdf&nbsp;</p>','2014-09-08 03:45:00',NULL),
('38','3','3','1','1','2014-09-09',NULL,'<p>asdfasdfasdfasdf asdfas dfasdf asdf&nbsp;</p>','2014-09-08 03:45:00',NULL),
('39','3','3','1','1','2014-09-09',NULL,'<p>asdfasdfasdfasdf asdfas dfasdf asdf&nbsp;</p>','2014-09-08 03:45:00',NULL),
('40','3','3','1','1','2014-09-09',NULL,'<p>asdfasdfasdfasdf asdfas dfasdf asdf&nbsp;</p>','2014-09-08 03:45:00',NULL),
('41','3','3','1','1','2014-09-09',NULL,'<p>asdfasdfasdfasdf asdfas dfasdf asdf&nbsp;</p>','2014-09-08 03:45:00',NULL),
('42','3','3','1','1','2014-09-09',NULL,'<p>asdfasdfasdfasdf asdfas dfasdf asdf&nbsp;</p>','2014-09-08 03:45:00',NULL),
('43','3','3','1','1','2014-09-09',NULL,'<p>asdfasdfasdfasdf asdfas dfasdf asdf&nbsp;</p>','2014-09-08 03:45:00',NULL),
('44','3','3','1','1','2014-09-09',NULL,'<p>asdfasdfasdfasdf asdfas dfasdf asdf&nbsp;</p>','2014-09-08 03:45:00',NULL),
('45','3','3','1','1','2014-09-09',NULL,'<p>asdfasdfasdfasdf asdfas dfasdf asdf&nbsp;</p>','2014-09-08 03:45:00',NULL),
('46','3','3','1','1','2014-09-09',NULL,'<p>asdfasdfasdfasdf asdfas dfasdf asdf&nbsp;</p>','2014-09-08 03:45:00',NULL),
('50','3','3',NULL,NULL,NULL,NULL,'<p>asdasd</p>','2014-09-08 04:17:00',NULL),
('51','3','3',NULL,NULL,NULL,NULL,'<p>qweqweqweqwe</p>','2014-09-08 04:25:00',NULL),
('52','20','3',NULL,NULL,NULL,NULL,'<p>asdfasdfasdf</p>','2014-09-12 10:21:00',NULL),
('53','20','3',NULL,NULL,NULL,NULL,'<p>asdfasdfasdf</p>','2014-09-12 10:21:00',NULL),
('54','20','3',NULL,NULL,NULL,NULL,'<p>asdfasdfasdf</p>','2014-09-12 10:21:00',NULL),
('55','20','3',NULL,NULL,NULL,NULL,'<p>asdfasdfasdf</p>','2014-09-12 10:21:00',NULL),
('56','23','3',NULL,NULL,NULL,NULL,'<p>asdfasdf</p>','2014-09-12 11:22:00',NULL),
('57','23','3',NULL,NULL,NULL,NULL,'<p>asdfasdfasf</p>','2014-09-12 11:26:00',NULL),
('58','23','3',NULL,NULL,NULL,NULL,'<p>test</p>','2014-09-12 11:26:00',NULL),
('59','3','3',NULL,NULL,NULL,NULL,'Assigned To: Olga, Sergey Kharchishin, werwer','2014-09-13 06:36:56',NULL);

CREATE TABLE IF NOT EXISTS `user_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `display_on_home` tinyint(1) DEFAULT NULL,
  `projects_id` text,
  `projects_type_id` text,
  `projects_status_id` text,
  `assigned_to` text,
  `tasks_status_id` text,
  `tasks_type_id` text,
  `tasks_label_id` text,
  `due_date_from` date DEFAULT NULL,
  `due_date_to` date DEFAULT NULL,
  `created_from` date DEFAULT NULL,
  `created_to` date DEFAULT NULL,
  `closed_from` date DEFAULT NULL,
  `closed_to` date DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_reports_users` (`users_id`),
  CONSTRAINT `user_reports_ibfk_1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT IGNORE INTO user_reports VALUES
('1','3','My open tasks','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

CREATE TABLE IF NOT EXISTS `discussions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projects_id` int(11) NOT NULL DEFAULT '0',
  `users_id` int(11) DEFAULT NULL,
  `discussions_status_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `assigned_to` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `fk_discussions_projects` (`projects_id`),
  KEY `fk_discussions_users` (`users_id`),
  KEY `fk_discussions_discussions_status` (`discussions_status_id`),
  CONSTRAINT `discussions_ibfk_1` FOREIGN KEY (`projects_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `discussions_ibfk_2` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `discussions_ibfk_3` FOREIGN KEY (`discussions_status_id`) REFERENCES `discussions_status` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

INSERT IGNORE INTO discussions VALUES
('1','11','3','1','asdasd','<p>asdasdas</p>',''),
('2','11','3','1','qweqweq',NULL,''),
('3','8','3','1','Discussion 1',NULL,''),
('4','8','3','1','Discussion 2',NULL,''),
('5','14','3','1','test discussion','<p>asdfasdfasdasdfasdf</p>','3'),
('6','7','3','1','asdasdasd','<p>asdasdasd</p>','7,8,3,9'),
('7','7','3','1','asdasdasd',NULL,''),
('8','16','3','1','asdfasdfasdf',NULL,''),
('9','16','3','1','qweqwe',NULL,''),
('10','16','3','1','qweqwe111',NULL,''),
('11','16','3','1','asdfasdf',NULL,'8'),
('12','16','3','1','asdfasdasdf',NULL,'8'),
('13','16','3','1','test',NULL,'8'),
('14','16','3','1','test',NULL,'8'),
('15','16','3','1','asdfasdf',NULL,'8'),
('16','16','3','1','asdasdfasdf',NULL,'');

CREATE TABLE IF NOT EXISTS `discussions_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `discussions_id` int(11) NOT NULL DEFAULT '0',
  `users_id` int(11) DEFAULT NULL,
  `discussions_status_id` int(11) DEFAULT NULL,
  `description` text,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_discussions_comments_discussions` (`discussions_id`),
  KEY `fk_discussions_comments_users` (`users_id`),
  KEY `fk_discussions_status_id` (`discussions_status_id`),
  CONSTRAINT `discussions_comments_ibfk_1` FOREIGN KEY (`discussions_id`) REFERENCES `discussions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `discussions_comments_ibfk_2` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `discussions_comments_ibfk_3` FOREIGN KEY (`discussions_status_id`) REFERENCES `discussions_status` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

INSERT IGNORE INTO discussions_comments VALUES
('1','1','3','1','<p>asdfasdf</p>','2014-07-11 12:35:18'),
('2','1','3',NULL,'<p>asdasdasdasda</p>','2014-07-11 12:38:39'),
('3','1','3',NULL,NULL,'2014-07-11 12:41:14'),
('4','5','3','1','<p>asdfasdfasdf asdfas dfas dfasd fsafd</p>','2014-09-03 06:42:05'),
('5','3','3','2',NULL,'2014-09-03 07:00:16'),
('6','4','3','2',NULL,'2014-09-03 07:00:16'),
('7','3','3','1',NULL,'2014-09-03 08:20:38'),
('8','4','3','1',NULL,'2014-09-03 08:20:38'),
('9','6','3',NULL,'<p>asdfasdfasdasdf</p>','2014-09-08 04:31:23'),
('10','6','3',NULL,'<p>asdfasdfasdf</p>','2014-09-08 04:32:10'),
('11','9','3',NULL,'<p>asdfasdfasdf</p>','2014-09-12 10:41:30'),
('12','6','3',NULL,'Assigned To: Kym, Olga, Sergey Kharchishin, werwer','2014-09-13 06:55:49');

CREATE TABLE IF NOT EXISTS `discussions_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `display_on_home` tinyint(1) DEFAULT NULL,
  `projects_id` text,
  `projects_type_id` text,
  `projects_status_id` text,
  `discussions_status_id` text,
  `sort_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `users_id` (`users_id`),
  CONSTRAINT `discussions_reports_ibfk_1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT IGNORE INTO discussions_reports VALUES
('1','3','all','0','7',NULL,NULL,NULL,NULL);

