#### ATTENTION: You do not need to run or use this file!  The install.php script does everything for you!
#### Install script for MySQL 4.0.18+

#
# Table structure for table `admin_info_files`
#

$db_table->db_create_table('{db_prefix}admin_info_files',
	array(
		array('name' => 'id_file',    'type' => 'tinyint', 'size' => 4, 'unsigned' => true, 'auto' => true),
		array('name' => 'filename',   'type' => 'varchar', 'default' => '', 'size' => 255),
		array('name' => 'path',       'type' => 'varchar', 'default' => '', 'size' => 255),
		array('name' => 'parameters', 'type' => 'varchar', 'default' => '', 'size' => 255),
		array('name' => 'data',       'type' => 'text'),
		array('name' => 'filetype',   'type' => 'varchar', 'default' => '', 'size' => 255),
	),
	array(
		array('name' => 'id_file',  'columns' => array('id_file'), 'type' => 'primary'),
		array('name' => 'filename', 'columns' => array('filename(30)'), 'type' => 'key'),
	),
	array(),
	'ignore'
);

#
# Table structure for table `antispam_questions`
#

$db_table->db_create_table('{db_prefix}antispam_questions',
	array(
		array('name' => 'id_question', 'type' => 'tinyint', 'size' => 4, 'unsigned' => true, 'auto' => true),
		array('name' => 'question',    'type' => 'text'),
		array('name' => 'answer',      'type' => 'text'),
		array('name' => 'language',    'type' => 'varchar', 'default' => '', 'size' => 50),
	),
	array(
		array('name' => 'id_question', 'columns' => array('id_question'), 'type' => 'primary'),
		array('name' => 'language',    'columns' => array('language(30)'), 'type' => 'key'),
	),
	array(),
	'ignore'
);

#
# Table structure for table `approval_queue`
#

$db_table->db_create_table('{db_prefix}approval_queue',
	array(
		array('name' => 'id_msg',    'type' => 'int', 'size' => 10, 'unsigned' => true, 'default' => 0),
		array('name' => 'id_attach', 'type' => 'int', 'size' => 10, 'unsigned' => true, 'default' => 0),
		array('name' => 'id_event',  'type' => 'smallint', 'size' => 5, 'unsigned' => true, 'default' => 0),
	),
	array(),
	array(),
	'ignore'
);

#
# Table structure for table `attachments`
#

$db_table->db_create_table('{db_prefix}attachments',
	array(
		array('name' => 'id_attach',       'type' => 'int', 'size' => 10, 'unsigned' => true, 'auto' => true),
		array('name' => 'id_thumb',        'type' => 'int', 'size' => 10, 'unsigned' => true, 'default' => 0),
		array('name' => 'id_msg',          'type' => 'int', 'size' => 10, 'unsigned' => true, 'default' => 0),
		array('name' => 'id_member',       'type' => 'mediumint', 'size' => 8, 'unsigned' => true, 'default' => 0),
		array('name' => 'id_folder',       'type' => 'tinyint', 'size' => 3, 'unsigned' => true, 'default' => 0),
		array('name' => 'attachment_type', 'type' => 'tinyint', 'size' => 3, 'unsigned' => true, 'default' => 0),
		array('name' => 'filename',        'type' => 'varchar', 'default' => '', 'size' => 255),
		array('name' => 'file_hash',       'type' => 'varchar', 'default' => '', 'size' => 40),
		array('name' => 'fileext',         'type' => 'varchar', 'default' => '', 'size' => 8),
		array('name' => 'size',            'type' => 'int', 'size' => 10, 'unsigned' => true, 'default' => 0),
		array('name' => 'downloads',       'type' => 'mediumint', 'size' => 8, 'unsigned' => true, 'default' => 0),
		array('name' => 'width',           'type' => 'mediumint', 'size' => 8, 'unsigned' => true, 'default' => 0),
		array('name' => 'height',          'type' => 'mediumint', 'size' => 8, 'unsigned' => true, 'default' => 0),
		array('name' => 'mime_type',       'type' => 'varchar', 'default' => '', 'size' => 20),
		array('name' => 'approved',        'type' => 'tinyint', 'size' => 3, 'unsigned' => true, 'default' => 1),
	),
	array(
		array('name' => 'id_attach',       'columns' => array('id_attach'), 'type' => 'primary'),
		array('name' => 'id_member',       'columns' => array('id_member', 'id_attach'), 'type' => 'unique'),
		array('name' => 'id_msg',          'columns' => array('id_msg'), 'type' => 'key'),
		array('name' => 'attachment_type', 'columns' => array('attachment_type'), 'type' => 'key'),
		array('name' => 'id_thumb',        'columns' => array('id_thumb'), 'type' => 'key'),
	),
	array(),
	'ignore'
);

#
# Table structure for table `ban_groups`
#

$db_table->db_create_table('{db_prefix}ban_groups',
	array(
		array('name' => 'id_ban_group',    'type' => 'mediumint', 'size' => 8, 'unsigned' => true, 'auto' => true),
		array('name' => 'name',            'type' => 'varchar', 'default' => '', 'size' => 20),
		array('name' => 'ban_time',        'type' => 'int', 'size' => 10, 'unsigned' => true, 'default' => 0),
		array('name' => 'expire_time',     'type' => 'in', 'size' => 10, 'unsigned' => true, 'default' => 0),
		array('name' => 'cannot_access',   'type' => 'tinyint', 'size' => 3, 'unsigned' => true, 'default' => 0),
		array('name' => 'cannot_register', 'type' => 'tinyint', 'size' => 3, 'unsigned' => true, 'default' => 0),
		array('name' => 'cannot_post',     'type' => 'tinyint', 'size' => 3, 'unsigned' => true, 'default' => 0),
		array('name' => 'cannot_login',    'type' => 'tinyint', 'size' => 3, 'unsigned' => true, 'default' => 0),
		array('name' => 'reason',          'type' => 'varchar', 'default' => '', 'size' => 255),
		array('name' => 'notes',           'type' => 'text'),
	),
	array(
		array('name' => 'id_ban_group', 'columns' => array('id_ban_group'), 'type' => 'primary'),
	),
	array(),
	'ignore'
);

#
# Table structure for table `ban_items`
#

$db_table->db_create_table('{db_prefix}ban_items',
	array(
		array('name' => 'id_ban',        'type' => 'mediumint', 'size' => 8, 'unsigned' => true, 'auto' => true),
		array('name' => 'id_ban_group',  'type' => 'smallint', 'size' => 5, 'unsigned' => true, 'default' => 0),
		array('name' => 'ip_low1',       'type' => 'smallint', 'size' => 5, 'unsigned' => true, 'default' => 0),
		array('name' => 'ip_high1',      'type' => 'smallint', 'size' => 5, 'unsigned' => true, 'default' => 0),
		array('name' => 'ip_low2',       'type' => 'smallint', 'size' => 5, 'unsigned' => true, 'default' => 0),
		array('name' => 'ip_high2',      'type' => 'smallint', 'size' => 5, 'unsigned' => true, 'default' => 0),
		array('name' => 'ip_low3',       'type' => 'smallint', 'size' => 5, 'unsigned' => true, 'default' => 0),
		array('name' => 'ip_high3',      'type' => 'smallint', 'size' => 5, 'unsigned' => true, 'default' => 0),
		array('name' => 'ip_low4',       'type' => 'smallint', 'size' => 5, 'unsigned' => true, 'default' => 0),
		array('name' => 'ip_high4',      'type' => 'smallint', 'size' => 5, 'unsigned' => true, 'default' => 0),
		array('name' => 'ip_low5',       'type' => 'smallint', 'size' => 5, 'unsigned' => true, 'default' => 0),
		array('name' => 'ip_high5',      'type' => 'smallint', 'size' => 5, 'unsigned' => true, 'default' => 0),
		array('name' => 'ip_low6',       'type' => 'smallint', 'size' => 5, 'unsigned' => true, 'default' => 0),
		array('name' => 'ip_high6',      'type' => 'smallint', 'size' => 5, 'unsigned' => true, 'default' => 0),
		array('name' => 'ip_low7',       'type' => 'smallint', 'size' => 5, 'unsigned' => true, 'default' => 0),
		array('name' => 'ip_high7',      'type' => 'smallint', 'size' => 5, 'unsigned' => true, 'default' => 0),
		array('name' => 'ip_low8',       'type' => 'smallint', 'size' => 5, 'unsigned' => true, 'default' => 0),
		array('name' => 'ip_high8',      'type' => 'smallint', 'size' => 5, 'unsigned' => true, 'default' => 0),
		array('name' => 'hostname',      'type' => 'varchar', 'default' => '', 'size' => 255),
		array('name' => 'email_address', 'type' => 'varchar', 'default' => '', 'size' => 255),
		array('name' => 'id_member',     'type' => 'mediumint', 'size' => 8, 'unsigned' => true, 'default' => 0),
		array('name' => 'hits',          'type' => 'mediumint', 'size' => 8, 'unsigned' => true, 'default' => 0),
	),
	array(
		array('name' => 'id_ban',       'columns' => array('id_ban'), 'type' => 'primary'),
		array('name' => 'id_ban_group', 'columns' => array('id_ban_group'), 'type' => 'key'),
	),
	array(),
	'ignore'
);

#
# Table structure for table `board_permissions`
#

$db_table->db_create_table('{db_prefix}board_permissions',
	array(
		array('name' => 'id_group',   'type' => 'smallint', 'size' => 5, 'unsigned' => true, 'auto' => true),
		array('name' => 'id_profile', 'type' => 'smallint', 'size' => 5, 'unsigned' => true, 'default' => 0),
		array('name' => 'permission', 'type' => 'varchar', 'default' => '', 'size' => 30),
		array('name' => 'add_deny',   'type' => 'tinyint', 'size' => 4, 'unsigned' => true, 'default' => 1),
		array('name' => 'hits',       'type' => 'mediumint', 'size' => 8, 'unsigned' => true, 'default' => 0),
	),
	array(
		array('name' => 'id_group', 'columns' => array('id_group', 'id_profile', 'permission'), 'type' => 'primary'),
	),
	array(),
	'ignore'
);

#
# Dumping data for table `board_permissions`
#

$db->insert('ignore',
	'{db_prefix}board_permissions',
	array('id_group' => 'int', 'id_profile' => 'int', 'permission' => 'string-30'),
	array(
		(-1, 1, 'poll_view'),
		(0, 1, 'remove_own'),
		(0, 1, 'lock_own'),
		(0, 1, 'mark_any_notify'),
		(0, 1, 'mark_notify'),
		(0, 1, 'modify_own'),
		(0, 1, 'poll_add_own'),
		(0, 1, 'poll_edit_own'),
		(0, 1, 'poll_lock_own'),
		(0, 1, 'poll_post'),
		(0, 1, 'poll_view'),
		(0, 1, 'poll_vote'),
		(0, 1, 'post_attachment'),
		(0, 1, 'post_new'),
		(0, 1, 'post_draft'),
		(0, 1, 'postby_email'),
		(0, 1, 'post_autosave_draft'),
		(0, 1, 'post_reply_any'),
		(0, 1, 'post_reply_own'),
		(0, 1, 'post_unapproved_topics'),
		(0, 1, 'post_unapproved_replies_any'),
		(0, 1, 'post_unapproved_replies_own'),
		(0, 1, 'post_unapproved_attachments'),
		(0, 1, 'delete_own'),
		(0, 1, 'report_any'),
		(0, 1, 'send_topic'),
		(0, 1, 'view_attachments'),
		(2, 1, 'moderate_board'),
		(2, 1, 'post_new'),
		(2, 1, 'post_draft'),
		(2, 1, 'post_autosave_draft'),
		(2, 1, 'post_reply_own'),
		(2, 1, 'post_reply_any'),
		(2, 1, 'post_unapproved_topics'),
		(2, 1, 'post_unapproved_replies_any'),
		(2, 1, 'post_unapproved_replies_own'),
		(2, 1, 'post_unapproved_attachments'),
		(2, 1, 'poll_post'),
		(2, 1, 'poll_add_any'),
		(2, 1, 'poll_remove_any'),
		(2, 1, 'poll_view'),
		(2, 1, 'poll_vote'),
		(2, 1, 'poll_lock_any'),
		(2, 1, 'poll_edit_any'),
		(2, 1, 'report_any'),
		(2, 1, 'lock_own'),
		(2, 1, 'send_topic'),
		(2, 1, 'mark_any_notify'),
		(2, 1, 'mark_notify'),
		(2, 1, 'delete_own'),
		(2, 1, 'modify_own'),
		(2, 1, 'make_sticky'),
		(2, 1, 'lock_any'),
		(2, 1, 'remove_any'),
		(2, 1, 'move_any'),
		(2, 1, 'merge_any'),
		(2, 1, 'split_any'),
		(2, 1, 'delete_any'),
		(2, 1, 'modify_any'),
		(2, 1, 'approve_posts'),
		(2, 1, 'post_attachment'),
		(2, 1, 'view_attachments'),
		(3, 1, 'moderate_board'),
		(3, 1, 'post_new'),
		(3, 1, 'post_draft'),
		(3, 1, 'post_autosave_draft'),
		(3, 1, 'post_reply_own'),
		(3, 1, 'post_reply_any'),
		(3, 1, 'post_unapproved_topics'),
		(3, 1, 'post_unapproved_replies_any'),
		(3, 1, 'post_unapproved_replies_own'),
		(3, 1, 'post_unapproved_attachments'),
		(3, 1, 'poll_post'),
		(3, 1, 'poll_add_any'),
		(3, 1, 'poll_remove_any'),
		(3, 1, 'poll_view'),
		(3, 1, 'poll_vote'),
		(3, 1, 'poll_lock_any'),
		(3, 1, 'poll_edit_any'),
		(3, 1, 'report_any'),
		(3, 1, 'lock_own'),
		(3, 1, 'send_topic'),
		(3, 1, 'mark_any_notify'),
		(3, 1, 'mark_notify'),
		(3, 1, 'delete_own'),
		(3, 1, 'modify_own'),
		(3, 1, 'make_sticky'),
		(3, 1, 'lock_any'),
		(3, 1, 'remove_any'),
		(3, 1, 'move_any'),
		(3, 1, 'merge_any'),
		(3, 1, 'split_any'),
		(3, 1, 'delete_any'),
		(3, 1, 'modify_any'),
		(3, 1, 'approve_posts'),
		(3, 1, 'post_attachment'),
		(3, 1, 'view_attachments'),
		(-1, 2, 'poll_view'),
		(0, 2, 'remove_own'),
		(0, 2, 'lock_own'),
		(0, 2, 'mark_any_notify'),
		(0, 2, 'mark_notify'),
		(0, 2, 'modify_own'),
		(0, 2, 'poll_view'),
		(0, 2, 'poll_vote'),
		(0, 2, 'post_attachment'),
		(0, 2, 'post_new'),
		(0, 2, 'postby_email'),
		(0, 2, 'post_draft'),
		(0, 2, 'post_autosave_draft'),
		(0, 2, 'post_reply_any'),
		(0, 2, 'post_reply_own'),
		(0, 2, 'post_unapproved_topics'),
		(0, 2, 'post_unapproved_replies_any'),
		(0, 2, 'post_unapproved_replies_own'),
		(0, 2, 'post_unapproved_attachments'),
		(0, 2, 'delete_own'),
		(0, 2, 'report_any'),
		(0, 2, 'send_topic'),
		(0, 2, 'view_attachments'),
		(2, 2, 'moderate_board'),
		(2, 2, 'post_new'),
		(2, 2, 'post_draft'),
		(2, 2, 'post_autosave_draft'),
		(2, 2, 'post_reply_own'),
		(2, 2, 'post_reply_any'),
		(2, 2, 'post_unapproved_topics'),
		(2, 2, 'post_unapproved_replies_any'),
		(2, 2, 'post_unapproved_replies_own'),
		(2, 2, 'post_unapproved_attachments'),
		(2, 2, 'poll_post'),
		(2, 2, 'poll_add_any'),
		(2, 2, 'poll_remove_any'),
		(2, 2, 'poll_view'),
		(2, 2, 'poll_vote'),
		(2, 2, 'poll_lock_any'),
		(2, 2, 'poll_edit_any'),
		(2, 2, 'report_any'),
		(2, 2, 'lock_own'),
		(2, 2, 'send_topic'),
		(2, 2, 'mark_any_notify'),
		(2, 2, 'mark_notify'),
		(2, 2, 'delete_own'),
		(2, 2, 'modify_own'),
		(2, 2, 'make_sticky'),
		(2, 2, 'lock_any'),
		(2, 2, 'remove_any'),
		(2, 2, 'move_any'),
		(2, 2, 'merge_any'),
		(2, 2, 'split_any'),
		(2, 2, 'delete_any'),
		(2, 2, 'modify_any'),
		(2, 2, 'approve_posts'),
		(2, 2, 'post_attachment'),
		(2, 2, 'view_attachments'),
		(3, 2, 'moderate_board'),
		(3, 2, 'post_new'),
		(3, 2, 'post_draft'),
		(3, 2, 'post_autosave_draft'),
		(3, 2, 'post_reply_own'),
		(3, 2, 'post_reply_any'),
		(3, 2, 'post_unapproved_topics'),
		(3, 2, 'post_unapproved_replies_any'),
		(3, 2, 'post_unapproved_replies_own'),
		(3, 2, 'post_unapproved_attachments'),
		(3, 2, 'poll_post'),
		(3, 2, 'poll_add_any'),
		(3, 2, 'poll_remove_any'),
		(3, 2, 'poll_view'),
		(3, 2, 'poll_vote'),
		(3, 2, 'poll_lock_any'),
		(3, 2, 'poll_edit_any'),
		(3, 2, 'report_any'),
		(3, 2, 'lock_own'),
		(3, 2, 'send_topic'),
		(3, 2, 'mark_any_notify'),
		(3, 2, 'mark_notify'),
		(3, 2, 'delete_own'),
		(3, 2, 'modify_own'),
		(3, 2, 'make_sticky'),
		(3, 2, 'lock_any'),
		(3, 2, 'remove_any'),
		(3, 2, 'move_any'),
		(3, 2, 'merge_any'),
		(3, 2, 'split_any'),
		(3, 2, 'delete_any'),
		(3, 2, 'modify_any'),
		(3, 2, 'approve_posts'),
		(3, 2, 'post_attachment'),
		(3, 2, 'view_attachments'),
		(-1, 3, 'poll_view'),
		(0, 3, 'remove_own'),
		(0, 3, 'lock_own'),
		(0, 3, 'mark_any_notify'),
		(0, 3, 'mark_notify'),
		(0, 3, 'modify_own'),
		(0, 3, 'poll_view'),
		(0, 3, 'poll_vote'),
		(0, 3, 'post_attachment'),
		(0, 3, 'post_reply_any'),
		(0, 3, 'post_reply_own'),
		(0, 3, 'post_unapproved_replies_any'),
		(0, 3, 'post_unapproved_replies_own'),
		(0, 3, 'post_unapproved_attachments'),
		(0, 3, 'delete_own'),
		(0, 3, 'report_any'),
		(0, 3, 'send_topic'),
		(0, 3, 'view_attachments'),
		(2, 3, 'moderate_board'),
		(2, 3, 'post_new'),
		(2, 3, 'post_draft'),
		(2, 3, 'post_autosave_draft'),
		(2, 3, 'post_reply_own'),
		(2, 3, 'post_reply_any'),
		(2, 3, 'post_unapproved_topics'),
		(2, 3, 'post_unapproved_replies_any'),
		(2, 3, 'post_unapproved_replies_own'),
		(2, 3, 'post_unapproved_attachments'),
		(2, 3, 'poll_post'),
		(2, 3, 'poll_add_any'),
		(2, 3, 'poll_remove_any'),
		(2, 3, 'poll_view'),
		(2, 3, 'poll_vote'),
		(2, 3, 'poll_lock_any'),
		(2, 3, 'poll_edit_any'),
		(2, 3, 'report_any'),
		(2, 3, 'lock_own'),
		(2, 3, 'send_topic'),
		(2, 3, 'mark_any_notify'),
		(2, 3, 'mark_notify'),
		(2, 3, 'delete_own'),
		(2, 3, 'modify_own'),
		(2, 3, 'make_sticky'),
		(2, 3, 'lock_any'),
		(2, 3, 'remove_any'),
		(2, 3, 'move_any'),
		(2, 3, 'merge_any'),
		(2, 3, 'split_any'),
		(2, 3, 'delete_any'),
		(2, 3, 'modify_any'),
		(2, 3, 'approve_posts'),
		(2, 3, 'post_attachment'),
		(2, 3, 'view_attachments'),
		(3, 3, 'moderate_board'),
		(3, 3, 'post_new'),
		(3, 3, 'post_draft'),
		(3, 3, 'post_autosave_draft'),
		(3, 3, 'post_reply_own'),
		(3, 3, 'post_reply_any'),
		(3, 3, 'post_unapproved_topics'),
		(3, 3, 'post_unapproved_replies_any'),
		(3, 3, 'post_unapproved_replies_own'),
		(3, 3, 'post_unapproved_attachments'),
		(3, 3, 'poll_post'),
		(3, 3, 'poll_add_any'),
		(3, 3, 'poll_remove_any'),
		(3, 3, 'poll_view'),
		(3, 3, 'poll_vote'),
		(3, 3, 'poll_lock_any'),
		(3, 3, 'poll_edit_any'),
		(3, 3, 'report_any'),
		(3, 3, 'lock_own'),
		(3, 3, 'send_topic'),
		(3, 3, 'mark_any_notify'),
		(3, 3, 'mark_notify'),
		(3, 3, 'delete_own'),
		(3, 3, 'modify_own'),
		(3, 3, 'make_sticky'),
		(3, 3, 'lock_any'),
		(3, 3, 'remove_any'),
		(3, 3, 'move_any'),
		(3, 3, 'merge_any'),
		(3, 3, 'split_any'),
		(3, 3, 'delete_any'),
		(3, 3, 'modify_any'),
		(3, 3, 'approve_posts'),
		(3, 3, 'post_attachment'),
		(3, 3, 'view_attachments'),
		(-1, 4, 'poll_view'),
		(0, 4, 'mark_any_notify'),
		(0, 4, 'mark_notify'),
		(0, 4, 'poll_view'),
		(0, 4, 'poll_vote'),
		(0, 4, 'report_any'),
		(0, 4, 'send_topic'),
		(0, 4, 'view_attachments'),
		(2, 4, 'moderate_board'),
		(2, 4, 'post_new'),
		(2, 4, 'post_draft'),
		(2, 4, 'post_autosave_draft'),
		(2, 4, 'post_reply_own'),
		(2, 4, 'post_reply_any'),
		(2, 4, 'post_unapproved_topics'),
		(2, 4, 'post_unapproved_replies_any'),
		(2, 4, 'post_unapproved_replies_own'),
		(2, 4, 'post_unapproved_attachments'),
		(2, 4, 'poll_post'),
		(2, 4, 'poll_add_any'),
		(2, 4, 'poll_remove_any'),
		(2, 4, 'poll_view'),
		(2, 4, 'poll_vote'),
		(2, 4, 'poll_lock_any'),
		(2, 4, 'poll_edit_any'),
		(2, 4, 'report_any'),
		(2, 4, 'lock_own'),
		(2, 4, 'send_topic'),
		(2, 4, 'mark_any_notify'),
		(2, 4, 'mark_notify'),
		(2, 4, 'delete_own'),
		(2, 4, 'modify_own'),
		(2, 4, 'make_sticky'),
		(2, 4, 'lock_any'),
		(2, 4, 'remove_any'),
		(2, 4, 'move_any'),
		(2, 4, 'merge_any'),
		(2, 4, 'split_any'),
		(2, 4, 'delete_any'),
		(2, 4, 'modify_any'),
		(2, 4, 'approve_posts'),
		(2, 4, 'post_attachment'),
		(2, 4, 'view_attachments'),
		(3, 4, 'moderate_board'),
		(3, 4, 'post_new'),
		(3, 4, 'post_draft'),
		(3, 4, 'post_autosave_draft'),
		(3, 4, 'post_reply_own'),
		(3, 4, 'post_reply_any'),
		(3, 4, 'post_unapproved_topics'),
		(3, 4, 'post_unapproved_replies_any'),
		(3, 4, 'post_unapproved_replies_own'),
		(3, 4, 'post_unapproved_attachments'),
		(3, 4, 'poll_post'),
		(3, 4, 'poll_add_any'),
		(3, 4, 'poll_remove_any'),
		(3, 4, 'poll_view'),
		(3, 4, 'poll_vote'),
		(3, 4, 'poll_lock_any'),
		(3, 4, 'poll_edit_any'),
		(3, 4, 'report_any'),
		(3, 4, 'lock_own'),
		(3, 4, 'send_topic'),
		(3, 4, 'mark_any_notify'),
		(3, 4, 'mark_notify'),
		(3, 4, 'delete_own'),
		(3, 4, 'modify_own'),
		(3, 4, 'make_sticky'),
		(3, 4, 'lock_any'),
		(3, 4, 'remove_any'),
		(3, 4, 'move_any'),
		(3, 4, 'merge_any'),
		(3, 4, 'split_any'),
		(3, 4, 'delete_any'),
		(3, 4, 'modify_any'),
		(3, 4, 'approve_posts'),
		(3, 4, 'post_attachment'),
		(3, 4, 'view_attachments')
	),
	array('id_group', 'id_profile', 'permission'),
);
# --------------------------------------------------------

#
# Table structure for table `boards`
#

$db_table->db_create_table('{db_prefix}boards',
	array(
		array('name' => 'id_board',           'type' => 'smallint', 'size' => 5, 'unsigned' => true, 'auto' => true),
		array('name' => 'id_cat',             'type' => 'tinyint', 'size' => 4, 'unsigned' => true, 'default' => 0),
		array('name' => 'child_level',        'type' => 'tinyint', 'size' => 4, 'unsigned' => true, 'default' => 0),
		array('name' => 'id_parent',          'type' => 'smallint', 'size' => 5, 'unsigned' => true, 'default' => 0),
		array('name' => 'board_order',        'type' => 'smallint', 'size' => 5, 'unsigned' => true, 'default' => 0),
		array('name' => 'id_last_msg',        'type' => 'int', 'size' => 10, 'unsigned' => true, 'default' => 0),
		array('name' => 'id_msg_updated',     'type' => 'int', 'size' => 10, 'unsigned' => true, 'default' => 0),
		array('name' => 'member_groups',      'type' => 'varchar', 'default' => '-1,0', 'size' => 255),
		array('name' => 'id_profile',         'type' => 'smallint', 'size' => 5, 'unsigned' => true, 'default' => 1),
		array('name' => 'name',               'type' => 'varchar', 'default' => '', 'size' => 255),
		array('name' => 'description',        'type' => 'text'),
		array('name' => 'num_topics',         'type' => 'mediumint', 'size' => 8, 'unsigned' => true, 'default' => 0),
		array('name' => 'num_posts',          'type' => 'mediumint', 'size' => 8, 'unsigned' => true, 'default' => 0),
		array('name' => 'count_posts',        'type' => 'tinyint', 'size' => 4, 'unsigned' => true, 'default' => 0),
		array('name' => 'id_theme',           'type' => 'tinyint', 'size' => 4, 'unsigned' => true, 'default' => 0),
		array('name' => 'override_theme',     'type' => 'tinyint', 'size' => 4, 'unsigned' => true, 'default' => 0),
		array('name' => 'unapproved_posts',   'type' => 'smallint', 'size' => 5, 'unsigned' => true, 'default' => 0),
		array('name' => 'unapproved_topics',  'type' => 'smallint', 'size' => 5, 'unsigned' => true, 'default' => 0),
		array('name' => 'redirect',           'type' => 'varchar', 'default' => '', 'size' => 255),
		array('name' => 'deny_member_groups', 'type' => 'varchar', 'default' => '', 'size' => 255),
	),
	array(
		array('name' => 'id_board', 'columns' => array('id_board'), 'type' => 'primary'),
		array('name' => 'categories', 'columns' => array('id_cat', 'id_board'), 'type' => 'unique'),
		array('name' => 'id_parent', 'columns' => array('id_parent'), 'type' => 'key'),
		array('name' => 'id_msg_updated', 'columns' => array('id_msg_updated'), 'type' => 'key'),
		array('name' => 'member_groups', 'columns' => array('member_groups(48)'), 'type' => 'key'),
	),
	array(),
	'ignore'
);

#
# Dumping data for table `boards`
#

$db->insert('ignore',
	'{db_prefix}boards',
	array('id_board' => 'int', 'id_cat' => 'int', 'board_order' => 'int', 'id_last_msg' => 'int', 'id_msg_updated' => 'int',
	'name' => 'string', 'description' => 'string', 'num_topics' => 'int', 'num_posts' => 'int', 'member_groups' => 'string'),
	array(1, 1, 1, 1, 1, '{$default_board_name}', '{$default_board_description}', 1, 1, '-1,0,2'),
	array('id_board')
);

# --------------------------------------------------------

#
# Table structure for table `calendar`
#

$db_table->db_create_table('{db_prefix}calendar',
	array(
		array('name' => 'id_event',   'type' => 'smallint', 'size' => 5, 'unsigned' => true, 'auto' => true),
		array('name' => 'start_date', 'type' => 'date', 'default' => '0001-01-01'),
		array('name' => 'end_date',   'type' => 'date', 'default' => '0001-01-01'),
		array('name' => 'id_board',   'type' => 'smallint', 'size' => 5, 'unsigned' => true, 'default' => 0),
		array('name' => 'id_topic',   'type' => 'mediumint', 'size' => 8, 'unsigned' => true, 'default' => 0),
		array('name' => 'title',      'type' => 'varchar', 'default' => '', 'size' => 255),
		array('name' => 'id_member',  'type' => 'mediumint', 'size' => 8, 'unsigned' => true, 'default' => 0),
	),
	array(
		array('name' => 'id_event',   'columns' => array('id_event'), 'type' => 'primary'),
		array('name' => 'start_date', 'columns' => array('start_date'), 'type' => 'key'),
		array('name' => 'end_date',   'columns' => array('end_date'), 'type' => 'key'),
		array('name' => 'topic',      'columns' => array('id_topic', 'id_member'), 'type' => 'key'),
	),
	array(),
	'ignore'
);

#
# Table structure for table `calendar_holidays`
#

$db_table->db_create_table('{db_prefix}calendar_holidays',
	array(
		array('name' => 'id_holiday',   'type' => 'smallint', 'size' => 5, 'unsigned' => true, 'auto' => true),
		array('name' => 'event_date', 'type' => 'date', 'default' => '0001-01-01'),
		array('name' => 'title', 'type' => 'varchar', 'default' => '', 'size' => 255),
	),
	array(
		array('name' => 'id_holiday', 'columns' => array('id_holiday'), 'type' => 'primary'),
		array('name' => 'event_date', 'columns' => array('event_date'), 'type' => 'key'),
	),
	array(),
	'ignore'
);

#
# Dumping data for table `calendar_holidays`
#

$db->insert('ignore',
	'{db_prefix}calendar_holidays',
	array('title' => 'string', 'event_date' => 'date'),
	array(
		('New Year\'s', '0004-01-01'),
		('Christmas', '0004-12-25'),
		('Valentine\'s Day', '0004-02-14'),
		('St. Patrick\'s Day', '0004-03-17'),
		('April Fools', '0004-04-01'),
		('Earth Day', '0004-04-22'),
		('United Nations Day', '0004-10-24'),
		('Halloween', '0004-10-31'),
		('Mother\'s Day', '2010-05-09'),
		('Mother\'s Day', '2011-05-08'),
		('Mother\'s Day', '2012-05-13'),
		('Mother\'s Day', '2013-05-12'),
		('Mother\'s Day', '2014-05-11'),
		('Mother\'s Day', '2015-05-10'),
		('Mother\'s Day', '2016-05-08'),
		('Mother\'s Day', '2017-05-14'),
		('Mother\'s Day', '2018-05-13'),
		('Mother\'s Day', '2019-05-12'),
		('Mother\'s Day', '2020-05-10'),
		('Father\'s Day', '2008-06-15'),
		('Father\'s Day', '2009-06-21'),
		('Father\'s Day', '2010-06-20'),
		('Father\'s Day', '2011-06-19'),
		('Father\'s Day', '2012-06-17'),
		('Father\'s Day', '2013-06-16'),
		('Father\'s Day', '2014-06-15'),
		('Father\'s Day', '2015-06-21'),
		('Father\'s Day', '2016-06-19'),
		('Father\'s Day', '2017-06-18'),
		('Father\'s Day', '2018-06-17'),
		('Father\'s Day', '2019-06-16'),
		('Father\'s Day', '2020-06-21'),
		('Summer Solstice', '2010-06-21'),
		('Summer Solstice', '2011-06-21'),
		('Summer Solstice', '2012-06-20'),
		('Summer Solstice', '2013-06-21'),
		('Summer Solstice', '2014-06-21'),
		('Summer Solstice', '2015-06-21'),
		('Summer Solstice', '2016-06-20'),
		('Summer Solstice', '2017-06-20'),
		('Summer Solstice', '2018-06-21'),
		('Summer Solstice', '2019-06-21'),
		('Summer Solstice', '2020-06-20'),
		('Vernal Equinox', '2010-03-20'),
		('Vernal Equinox', '2011-03-20'),
		('Vernal Equinox', '2012-03-20'),
		('Vernal Equinox', '2013-03-20'),
		('Vernal Equinox', '2014-03-20'),
		('Vernal Equinox', '2015-03-20'),
		('Vernal Equinox', '2016-03-19'),
		('Vernal Equinox', '2017-03-20'),
		('Vernal Equinox', '2018-03-20'),
		('Vernal Equinox', '2019-03-20'),
		('Vernal Equinox', '2020-03-19'),
		('Winter Solstice', '2010-12-21'),
		('Winter Solstice', '2011-12-22'),
		('Winter Solstice', '2012-12-21'),
		('Winter Solstice', '2013-12-21'),
		('Winter Solstice', '2014-12-21'),
		('Winter Solstice', '2015-12-21'),
		('Winter Solstice', '2016-12-21'),
		('Winter Solstice', '2017-12-21'),
		('Winter Solstice', '2018-12-21'),
		('Winter Solstice', '2019-12-21'),
		('Winter Solstice', '2020-12-21'),
		('Autumnal Equinox', '2010-09-22'),
		('Autumnal Equinox', '2011-09-23'),
		('Autumnal Equinox', '2012-09-22'),
		('Autumnal Equinox', '2013-09-22'),
		('Autumnal Equinox', '2014-09-22'),
		('Autumnal Equinox', '2015-09-23'),
		('Autumnal Equinox', '2016-09-22'),
		('Autumnal Equinox', '2017-09-22'),
		('Autumnal Equinox', '2018-09-22'),
		('Autumnal Equinox', '2019-09-23'),
		('Autumnal Equinox', '2020-09-22')
		('Independence Day', '0004-07-04'),
		('Cinco de Mayo', '0004-05-05'),
		('Flag Day', '0004-06-14'),
		('Veterans Day', '0004-11-11'),
		('Groundhog Day', '0004-02-02'),
		('Thanksgiving', '2010-11-25'),
		('Thanksgiving', '2011-11-24'),
		('Thanksgiving', '2012-11-22'),
		('Thanksgiving', '2013-11-28'),
		('Thanksgiving', '2014-11-27'),
		('Thanksgiving', '2015-11-26'),
		('Thanksgiving', '2016-11-24'),
		('Thanksgiving', '2017-11-23'),
		('Thanksgiving', '2018-11-22'),
		('Thanksgiving', '2019-11-28'),
		('Thanksgiving', '2020-11-26'),
		('Memorial Day', '2010-05-31'),
		('Memorial Day', '2011-05-30'),
		('Memorial Day', '2012-05-28'),
		('Memorial Day', '2013-05-27'),
		('Memorial Day', '2014-05-26'),
		('Memorial Day', '2015-05-25'),
		('Memorial Day', '2016-05-30'),
		('Memorial Day', '2017-05-29'),
		('Memorial Day', '2018-05-28'),
		('Memorial Day', '2019-05-27'),
		('Memorial Day', '2020-05-25'),
		('Labor Day', '2010-09-06'),
		('Labor Day', '2011-09-05'),
		('Labor Day', '2012-09-03'),
		('Labor Day', '2013-09-02'),
		('Labor Day', '2014-09-01'),
		('Labor Day', '2015-09-07'),
		('Labor Day', '2016-09-05'),
		('Labor Day', '2017-09-04'),
		('Labor Day', '2018-09-03'),
		('Labor Day', '2019-09-02'),
		('Labor Day', '2020-09-07'),
		('D-Day', '0004-06-06')
	),
	array('id_holiday')
);

# --------------------------------------------------------

#
# Table structure for table `categories`
#

$db_table->db_create_table('{db_prefix}categories',
	array(
		array('name' => 'id_cat',   'type' => 'tinyint', 'size' => 4, 'unsigned' => true, 'auto' => true),
		array('name' => 'cat_order',   'type' => 'tinyint', 'size' => 4, 'unsigned' => true, 'default' => 0),
		array('name' => 'name', 'type' => 'varchar', 'default' => '', 'size' => 255),
		array('name' => 'can_collapse',   'type' => 'tinyint', 'size' => 1, 'unsigned' => true, 'default' => 0),
	),
	array(
		array('name' => 'id_cat', 'columns' => array('id_cat'), 'type' => 'primary'),
	),
	array(),
	'ignore'
);

#
# Dumping data for table `categories`
#

$db->insert('ignore',
	'{db_prefix}categories',
	array('id_cat' => 'int', 'cat_order' => 'int', 'name' => 'string', 'can_collapse' => 'int'),
	array(1, 0, '{$default_category_name}', 1),
	array('id_cat')
);

# --------------------------------------------------------

#
# Table structure for table `collapsed_categories`
#

$db_table->db_create_table('{db_prefix}collapsed_categories',
	array(
		array('name' => 'id_cat',   'type' => 'tinyint', 'size' => 4, 'unsigned' => true, 'default' => 0),
		array('name' => 'id_member',   'type' => 'mediumint', 'size' => 8, 'unsigned' => true, 'default' => 0),
	),
	array(
		array('name' => 'id_cat', 'columns' => array('id_cat', 'id_member'), 'type' => 'primary'),
	),
	array(),
	'ignore'
);

#
# Table structure for table `custom_fields`
#

$db_table->db_create_table('{db_prefix}custom_fields',
	array(
		array('name' => 'id_field',        'type' => 'smallint', 'size' => 5, 'unsigned' => true, 'auto' => true),
		array('name' => 'col_name',        'type' => 'varchar', 'default' => '', 'size' => 12),
		array('name' => 'field_name',      'type' => 'varchar', 'default' => '', 'size' => 40),
		array('name' => 'field_desc',      'type' => 'varchar', 'default' => '', 'size' => 255),
		array('name' => 'field_type',      'type' => 'varchar', 'default' => 'text', 'size' => 8),
		array('name' => 'field_length',    'type' => 'smallint', 'size' => 5, 'unsigned' => true, 'default' => 255),
		array('name' => 'field_options',   'type' => 'text'),
		array('name' => 'mask',            'type' => 'varchar', 'default' => '', 'size' => 255),
		array('name' => 'show_reg',        'type' => 'tinyint', 'size' => 3, 'unsigned' => true, 'default' => 0),
		array('name' => 'show_display',    'type' => 'tinyint', 'size' => 3, 'unsigned' => true, 'default' => 0),
		array('name' => 'show_memberlist', 'type' => 'tinyint', 'size' => 3, 'unsigned' => true, 'default' => 0),
		array('name' => 'show_profile',    'type' => 'varchar', 'default' => 'forumprofile', 'size' => 20),
		array('name' => 'private',         'type' => 'tinyint', 'size' => 3, 'unsigned' => true, 'default' => 0),
		array('name' => 'active',          'type' => 'tinyint', 'size' => 3, 'unsigned' => true, 'default' => 1),
		array('name' => 'bbc',             'type' => 'tinyint', 'size' => 3, 'unsigned' => true, 'default' => 0),
		array('name' => 'can_search',      'type' => 'tinyint', 'size' => 3, 'unsigned' => true, 'default' => 0),
		array('name' => 'default_value',   'type' => 'varchar', 'default' => '', 'size' => 255),
		array('name' => 'enclose',         'type' => 'text'),
		array('name' => 'placement',       'type' => 'tinyint', 'size' => 3, 'unsigned' => true, 'default' => 0),
		array('name' => 'vieworder',       'type' => 'smallint', 'size' => 5, 'unsigned' => true, 'default' => 0),
	),
	array(
		array('name' => 'id_field', 'columns' => array('id_field'), 'type' => 'primary'),
		array('name' => 'col_name', 'columns' => array('col_name'), 'type' => 'unique'),
	),
	array(),
	'ignore'
);

#
# Dumping data for table `custom_fields`
#

$db->insert('ignore',
	'{db_prefix}custom_fields',
	array('col_name' => 'string', 'field_name' => 'string', 'field_desc' => 'string', 'field_type' => 'string',
	'field_length' => 'int', 'field_options' => 'string', 'mask' => 'string', 'show_reg' => 'int',
	'show_display' => 'int', 'show_profile' => 'string', 'private' => 'int', 'active' => 'int', 'bbc' => 'int',
	'can_search' => 'int', 'default_value' => 'string', 'enclose' => 'string', 'placement' => 'string'),
	array(
		('cust_aim', 'AOL Instant Messenger', 'This is your AOL Instant Messenger nickname.', 'text', 50, '', 'regex~[a-z][0-9a-z.-]{1,31}~i', 0, 1, 'forumprofile', 0, 1, 0, 0, '', '<a class="aim" href="aim:goim?screenname={INPUT}&message=Hello!+Are+you+there?" target="_blank" title="AIM - {INPUT}"><img src="{IMAGES_URL}/profile/aim.png" alt="AIM - {INPUT}"></a>', 1),
		('cust_icq', 'ICQ', 'This is your ICQ number.', 'text', 12, '', 'regex~[1-9][0-9]{4,9}~i', 0, 1, 'forumprofile', 0, 1, 0, 0, '', '<a class="icq" href="http://www.icq.com/whitepages/about_me.php?uin={INPUT}" target="_blank" title="ICQ - {INPUT}"><img src="http://status.icq.com/online.gif?img=5&icq={INPUT}" alt="ICQ - {INPUT}" width="18" height="18"></a>', 1),
		('cust_skye', 'Skype', 'This is your Skype account name', 'text', 32, '', 'regex~[a-z][0-9a-z.-]{1,31}~i', 0, 1, 'forumprofile', 0, 1, 0, 0, '', '<a href="skype:{INPUT}?call"><img src="http://mystatus.skype.com/smallicon/{INPUT}" alt="Skype - {INPUT}" title="Skype - {INPUT}" /></a>', 1),
		('cust_fbook', 'Facebook Profile', 'Enter your Facebook username.', 'text', 50, '', 'regex~[a-z][0-9a-z.-]{1,31}~i', 0, 1, 'forumprofile', 0, 1, 0, 0, '', '<a target="_blank" href="https://www.facebook.com/{INPUT}"><img src="{DEFAULT_IMAGES_URL}/profile/facebook.png" alt="{INPUT}" /></a>', 1),
		('cust_twitt', 'Twitter Profile', 'Enter your Twitter username.', 'text', 50, '', 'regex~[a-z][0-9a-z.-]{1,31}~i', 0, 1, 'forumprofile', 0, 1, 0, 0, '', '<a target="_blank" href="https://www.twitter.com/{INPUT}"><img src="{DEFAULT_IMAGES_URL}/profile/twitter.png" alt="{INPUT}" /></a>', 1),
		('cust_linked', 'LinkedIn Profile', 'Set your LinkedIn Public profile link. You must set a Custom public url for this to work.', 'text', 255, '', 'nohtml', 0, 1, 'forumprofile', 0, 1, 0, 0, '', '<a target={INPUT}"><img src="{DEFAULT_IMAGES_URL}/profile/linkedin.png" alt="LinkedIn profile" /></a>', 1),
		('cust_gplus', 'Google+ Profile', 'This is your Google+ profile url.', 'text', 255, '', 'nohtml', 0, 1, 'forumprofile', 0, 1, 0, 0, '', '<a target="_blank" href="{INPUT}"><img src="{DEFAULT_IMAGES_URL}/profile/gplus.png" alt="G+ profile" /></a>', 1),
		('cust_yim', 'Yahoo! Messenger', 'This is your Yahoo! Instant Messenger nickname.', 'text', 50, '', 'email', 0, 1, 'forumprofile', 0, 1, 0, 0, '', '<a class="yim" href="http://edit.yahoo.com/config/send_webmesg?.target={INPUT}" target="_blank" title="Yahoo! Messenger - {INPUT}"><img src="http://opi.yahoo.com/online?m=g&t=0&u={INPUT}" alt="Yahoo! Messenger - {INPUT}"></a>', 1),
	),
	array('id_field')
);

# --------------------------------------------------------

#
# Table structure for table `custom_fields_data`
#

$db_table->db_create_table('{db_prefix}custom_fields_data',
	array(
		array('name' => 'id_member',    'type' => 'mediumint', 'size' => 8, 'unsigned' => true, 'default' => 0),
		array('name' => 'variable',     'type' => 'text'),
		array('name' => 'can_collapse', 'type' => 'tinyint', 'size' => 1, 'unsigned' => true, 'default' => 0),
	),
	array(
		array('name' => 'id_member', 'columns' => array('id_member', 'variable(30)'), 'type' => 'primary'),
		array('name' => 'id_member', 'columns' => array('id_member'), 'type' => 'key'),
	),
	array(),
	'ignore'
);

#
# Table structure for table `group_moderators`
#

$db_table->db_create_table('{db_prefix}group_moderators',
	array(
		array('name' => 'id_group',  'type' => 'smallint', 'size' => 4, 'unsigned' => true, 'default' => 0),
		array('name' => 'id_member', 'type' => 'mediumint', 'size' => 8, 'unsigned' => true, 'default' => 0),
	),
	array(
		array('name' => 'id_group', 'columns' => array('id_group', 'id_member'), 'type' => 'primary'),
	),
	array(),
	'ignore'
);

#
# Table structure for table `follow_ups`
#

$db_table->db_create_table('{db_prefix}follow_ups',
	array(
		array('name' => 'follow_up',    'type' => 'int', 'size' => 10, 'unsigned' => true, 'default' => 0),
		array('name' => 'derived_from', 'type' => 'int', 'size' => 10, 'unsigned' => true, 'default' => 0),
	),
	array(
		array('name' => 'id_group', 'columns' => array('follow_up', 'derived_from'), 'type' => 'key'),
	),
	array(),
	'ignore'
);

#
# Table structure for table `log_actions`
#

$db_table->db_create_table('{db_prefix}log_actions',
	array(
		array('name' => 'id_action', 'type' => 'int', 'size' => 10, 'unsigned' => true, 'auto' => true),
		array('name' => 'id_log',    'type' => 'tinyint', 'size' => 3, 'unsigned' => true, 'default' => 1),
		array('name' => 'log_time',  'type' => 'int', 'size' => 10, 'unsigned' => true, 'default' => 0),
		array('name' => 'id_member', 'type' => 'mediumint', 'size' => 8, 'unsigned' => true, 'default' => 0),
		array('name' => 'ip',        'type' => 'char(16)', 'default' => '                '),
		array('name' => 'action',    'type' => 'varcha', 'default' => ''),
		array('name' => 'id_board',  'type' => 'smallint', 'size' => 5, 'unsigned' => true, 'default' => 0),
		array('name' => 'id_topic',  'type' => 'mediumint', 'size' => 8, 'unsigned' => true, 'default' => 0),
		array('name' => 'extra',     'type' => 'text'),
	),
	array(
		array('name' => 'id_action', 'columns' => array('id_action'), 'type' => 'primary'),
		array('name' => 'id_log',    'columns' => array('id_log'), 'type' => 'key'),
		array('name' => 'log_time',  'columns' => array('log_time'), 'type' => 'key'),
		array('name' => 'id_member', 'columns' => array('id_member'), 'type' => 'key'),
		array('name' => 'id_board',  'columns' => array('id_board'), 'type' => 'key'),
		array('name' => 'id_msg',    'columns' => array('id_msg'), 'type' => 'key'),
	),
	array(),
	'ignore'
);

#
# Table structure for table `log_activity`
#

$db_table->db_create_table('{db_prefix}log_activity',
	array(
		array('name' => 'date',      'type' => 'date', 'default' => '0001-01-01'),
		array('name' => 'hits',      'type' => 'mediumint', 'size' => 8, 'unsigned' => true, 'default' => 0),
		array('name' => 'topics',    'type' => 'smallint', 'size' => 5, 'unsigned' => true, 'default' => 0),
		array('name' => 'posts',     'type' => 'smallint', 'size' => 5, 'unsigned' => true, 'default' => 0),
		array('name' => 'registers', 'type' => 'smallint', 'size' => 5, 'unsigned' => true, 'default' => 0),
		array('name' => 'most_on',   'type' => 'smallint', 'size' => 5, 'unsigned' => true, 'default' => 0),
		array('name' => 'pm',        'type' => 'smallint', 'size' => 5, 'unsigned' => true, 'default' => 0),
		array('name' => 'email',     'type' => 'smallint', 'size' => 5, 'unsigned' => true, 'default' => 0),
	),
	array(
		array('name' => 'date',    'columns' => array('date'), 'type' => 'primary'),
		array('name' => 'most_on', 'columns' => array('most_on'), 'type' => 'key'),
	),
	array(),
	'ignore'
);

#
# Table structure for table `log_badbehavior`
#

$db_table->db_create_table('{db_prefix}log_badbehavior',
	array(
		array('name' => 'id',              'type' => 'int', 'size' => 10, 'auto' => true),
		array('name' => 'ip',              'type' => 'char', 'size' => 19),
		array('name' => 'date',            'type' => 'int', 'size' => 10, 'default' => 0),
		array('name' => 'request_method',  'type' => 'varchar', 'size' => 255),
		array('name' => 'request_uri',     'type' => 'varchar', 'size' => 255),
		array('name' => 'server_protocol', 'type' => 'varchar', 'size' => 255),
		array('name' => 'http_headers',    'type' => 'text'),
		array('name' => 'user_agent',      'type' => 'varchar', 'size' => 255),
		array('name' => 'request_entity',  'type' => 'varchar', 'size' => 255),
		array('name' => 'valid',           'type' => 'varchar', 'size' => 255),
		array('name' => 'id_member',       'type' => 'mediumint', 'size' => 8, 'unsigned' => true),
		array('name' => 'session',         'type' => 'char', 'size' => 64),
	),
	array(
		array('name' => 'id',         'columns' => array('id'), 'type' => 'primary'),
		array('name' => 'ip',         'columns' => array('ip'), 'type' => 'index'),
		array('name' => 'user_agent', 'columns' => array('user_agent'), 'type' => 'index'),
	),
	array(),
	'ignore'
);

#
# Table structure for table `log_banned`
#

$db_table->db_create_table('{db_prefix}log_banned',
	array(
		array('name' => 'id_ban_log',      'type' => 'mediumint', 'size' => 8, 'auto' => true),
		array('name' => 'id_member',       'type' => 'mediumint', 'size' => 8, 'unsigned' => true, 'default' => 0),
		array('name' => 'ip',              'type' => 'char', 'size' => 16, 'default' => '                '),
		array('name' => 'email',           'type' => 'varchar', 'size' => 255),
		array('name' => 'log_time',        'type' => 'int', 'size' => 10, 'unsigned' => true, 'default' => 0),
		array('name' => 'request_uri',     'type' => 'varchar', 'size' => 255),
		array('name' => 'server_protocol', 'type' => 'varchar', 'size' => 255),
		array('name' => 'http_headers',    'type' => 'text'),
		array('name' => 'user_agent',      'type' => 'varchar', 'size' => 255),
		array('name' => 'request_entity',  'type' => 'varchar', 'size' => 255),
		array('name' => 'valid',           'type' => 'varchar', 'size' => 255),
		array('name' => 'session',         'type' => 'char', 'size' => 64),
	),
	array(
		array('name' => 'id_ban_log', 'columns' => array('id_ban_log'), 'type' => 'primary'),
		array('name' => 'log_time',   'columns' => array('log_time'), 'type' => 'key'),
	),
	array(),
	'ignore'
);

#
# Table structure for table `log_boards`
#

$db_table->db_create_table('{db_prefix}log_boards',
	array(
		array('name' => 'id_member', 'type' => 'mediumint', 'size' => 8, 'unsigned' => true, 'default' => 0),
		array('name' => 'id_board',  'type' => 'smallint', 'size' => 5, 'unsigned' => true, 'default' => 0),
		array('name' => 'id_msg',    'type' => 'int', 'size' => 10, 'unsigned' => true, 'default' => 0),
	),
	array(
		array('name' => 'id_member', 'columns' => array('id_member', 'id_board'), 'type' => 'primary'),
	),
	array(),
	'ignore'
);

#
# Table structure for table `log_comments`
#

CREATE TABLE {$db_prefix}log_comments (
  id_comment mediumint(8) unsigned NOT NULL auto_increment,
  id_member mediumint(8) unsigned NOT NULL default '0',
  member_name varchar(80) NOT NULL default '',
  comment_type varchar(8) NOT NULL default 'warning',
  id_recipient mediumint(8) unsigned NOT NULL default '0',
  recipient_name varchar(255) NOT NULL default '',
  log_time int(10) NOT NULL default '0',
  id_notice mediumint(8) unsigned NOT NULL default '0',
  counter tinyint(3) NOT NULL default '0',
  body text NOT NULL,
  PRIMARY KEY (id_comment),
  KEY id_recipient (id_recipient),
  KEY log_time (log_time),
  KEY comment_type (comment_type(8))
) ENGINE=MyISAM;

#
# Table structure for table `log_digest`
#

CREATE TABLE {$db_prefix}log_digest (
  id_topic mediumint(8) unsigned NOT NULL default '0',
  id_msg int(10) unsigned NOT NULL default '0',
  note_type varchar(10) NOT NULL default 'post',
  daily tinyint(3) unsigned NOT NULL default '0',
  exclude mediumint(8) unsigned NOT NULL default '0'
) ENGINE=MyISAM;

#
# Table structure for table `log_errors`
#

CREATE TABLE {$db_prefix}log_errors (
  id_error mediumint(8) unsigned NOT NULL auto_increment,
  log_time int(10) unsigned NOT NULL default '0',
  id_member mediumint(8) unsigned NOT NULL default '0',
  ip char(16) NOT NULL default '                ',
  url text NOT NULL,
  message text NOT NULL,
  session char(64) NOT NULL default '                                                                ',
  error_type char(15) NOT NULL default 'general',
  file varchar(255) NOT NULL default '',
  line mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY (id_error),
  KEY log_time (log_time),
  KEY id_member (id_member),
  KEY ip (ip(16))
) ENGINE=MyISAM;

#
# Table structure for table `log_floodcontrol`
#

CREATE TABLE {$db_prefix}log_floodcontrol (
  ip char(16) NOT NULL default '                ',
  log_time int(10) unsigned NOT NULL default '0',
  log_type varchar(10) NOT NULL default 'post',
  PRIMARY KEY (ip(16), log_type(10))
) ENGINE=MyISAM;

#
# Table structure for table `log_group_requests`
#

CREATE TABLE {$db_prefix}log_group_requests (
  id_request mediumint(8) unsigned NOT NULL auto_increment,
  id_member mediumint(8) unsigned NOT NULL default '0',
  id_group smallint(5) unsigned NOT NULL default '0',
  time_applied int(10) unsigned NOT NULL default '0',
  reason text NOT NULL,
  PRIMARY KEY (id_request),
  UNIQUE id_member (id_member, id_group)
) ENGINE=MyISAM;

#
# Table structure for table `log_karma`
#

CREATE TABLE {$db_prefix}log_karma (
  id_target mediumint(8) unsigned NOT NULL default '0',
  id_executor mediumint(8) unsigned NOT NULL default '0',
  log_time int(10) unsigned NOT NULL default '0',
  action tinyint(4) NOT NULL default '0',
  PRIMARY KEY (id_target, id_executor),
  KEY log_time (log_time)
) ENGINE=MyISAM;

#
# Table structure for table `log_likes`
#

CREATE TABLE {$db_prefix}log_likes (
  action char(1) NOT NULL default '0',
  id_target mediumint(8) unsigned NOT NULL default '0',
  id_member mediumint(8) unsigned NOT NULL default '0',
  log_time int(10) unsigned NOT NULL default '0',
  PRIMARY KEY (id_target, id_member),
  KEY log_time (log_time)
) ENGINE=MyISAM;

#
# Table structure for table `log_mark_read`
#

CREATE TABLE {$db_prefix}log_mark_read (
  id_member mediumint(8) unsigned NOT NULL default '0',
  id_board smallint(5) unsigned NOT NULL default '0',
  id_msg int(10) unsigned NOT NULL default '0',
  PRIMARY KEY (id_member, id_board)
) ENGINE=MyISAM;

#
# Table structure for table `log_member_notices`
#

CREATE TABLE {$db_prefix}log_member_notices (
  id_notice mediumint(8) unsigned NOT NULL auto_increment,
  subject varchar(255) NOT NULL default '',
  body text NOT NULL,
  PRIMARY KEY (id_notice)
) ENGINE=MyISAM;

#
# Table structure for table `log_mentions`
#

CREATE TABLE {$db_prefix}log_mentions (
  id_mention int(10) unsigned NOT NULL auto_increment,
  id_member mediumint(8) unsigned NOT NULL DEFAULT '0',
  id_msg int(10) unsigned NOT NULL DEFAULT '0',
  status tinyint(1) NOT NULL DEFAULT '0',
  id_member_from mediumint(8) unsigned NOT NULL DEFAULT '0',
  log_time int(10) unsigned NOT NULL DEFAULT '0',
  mention_type varchar(5) NOT NULL DEFAULT '',
  PRIMARY KEY (id_mention),
  KEY id_member (id_member,status)
) ENGINE=MyISAM;

#
# Table structure for table `log_notify`
#

CREATE TABLE {$db_prefix}log_notify (
  id_member mediumint(8) unsigned NOT NULL default '0',
  id_topic mediumint(8) unsigned NOT NULL default '0',
  id_board smallint(5) unsigned NOT NULL default '0',
  sent tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY (id_member, id_topic, id_board),
  KEY id_topic (id_topic, id_member)
) ENGINE=MyISAM;

#
# Table structure for table `log_online`
#

CREATE TABLE {$db_prefix}log_online (
  session varchar(64) NOT NULL default '',
  log_time int(10) NOT NULL default '0',
  id_member mediumint(8) unsigned NOT NULL default '0',
  id_spider smallint(5) unsigned NOT NULL default '0',
  ip int(10) unsigned NOT NULL default '0',
  url text NOT NULL,
  PRIMARY KEY (session),
  KEY log_time (log_time),
  KEY id_member (id_member)
) ENGINE=MyISAM;

#
# Table structure for table `log_packages`
#

CREATE TABLE {$db_prefix}log_packages (
  id_install int(10) NOT NULL auto_increment,
  filename varchar(255) NOT NULL default '',
  package_id varchar(255) NOT NULL default '',
  name varchar(255) NOT NULL default '',
  version varchar(255) NOT NULL default '',
  id_member_installed mediumint(8) unsigned NOT NULL default '0',
  member_installed varchar(255) NOT NULL default '',
  time_installed int(10) NOT NULL default '0',
  id_member_removed mediumint(8) unsigned NOT NULL default '0',
  member_removed varchar(255) NOT NULL default '',
  time_removed int(10) NOT NULL default '0',
  install_state tinyint(3) NOT NULL default '1',
  failed_steps text NOT NULL,
  themes_installed varchar(255) NOT NULL default '',
  db_changes text NOT NULL,
  credits varchar(255) NOT NULL default '',
  PRIMARY KEY (id_install),
  KEY filename (filename(15))
) ENGINE=MyISAM;

#
# Table structure for table `log_polls`
#

CREATE TABLE {$db_prefix}log_polls (
  id_poll mediumint(8) unsigned NOT NULL default '0',
  id_member mediumint(8) unsigned NOT NULL default '0',
  id_choice tinyint(3) unsigned NOT NULL default '0',
  KEY id_poll (id_poll, id_member, id_choice)
) ENGINE=MyISAM;

#
# Table structure for table `log_reported`
#

CREATE TABLE {$db_prefix}log_reported (
  id_report mediumint(8) unsigned NOT NULL auto_increment,
  id_msg int(10) unsigned NOT NULL default '0',
  id_topic mediumint(8) unsigned NOT NULL default '0',
  id_board smallint(5) unsigned NOT NULL default '0',
  id_member mediumint(8) unsigned NOT NULL default '0',
  membername varchar(255) NOT NULL default '',
  subject varchar(255) NOT NULL default '',
  body mediumtext NOT NULL,
  time_started int(10) NOT NULL default '0',
  time_updated int(10) NOT NULL default '0',
  num_reports mediumint(6) NOT NULL default '0',
  closed tinyint(3) NOT NULL default '0',
  ignore_all tinyint(3) NOT NULL default '0',
  PRIMARY KEY (id_report),
  KEY id_member (id_member),
  KEY id_topic (id_topic),
  KEY closed (closed),
  KEY time_started (time_started),
  KEY id_msg (id_msg)
) ENGINE=MyISAM;

#
# Table structure for table `log_reported_comments`
#

CREATE TABLE {$db_prefix}log_reported_comments (
  id_comment mediumint(8) unsigned NOT NULL auto_increment,
  id_report mediumint(8) NOT NULL default '0',
  id_member mediumint(8) unsigned NOT NULL default '0',
  membername varchar(255) NOT NULL default '',
  email_address varchar(255) NOT NULL default '',
  member_ip varchar(255) NOT NULL default '',
  comment varchar(255) NOT NULL default '',
  time_sent int(10) NOT NULL default '0',
  PRIMARY KEY (id_comment),
  KEY id_report (id_report),
  KEY id_member (id_member),
  KEY time_sent (time_sent)
) ENGINE=MyISAM;

#
# Table structure for table `log_scheduled_tasks`
#

CREATE TABLE {$db_prefix}log_scheduled_tasks (
  id_log mediumint(8) NOT NULL auto_increment,
  id_task smallint(5) NOT NULL default '0',
  time_run int(10) NOT NULL default '0',
  time_taken float NOT NULL default '0',
  PRIMARY KEY (id_log)
) ENGINE=MyISAM;

#
# Table structure for table `log_search_messages`
#

CREATE TABLE {$db_prefix}log_search_messages (
  id_search tinyint(3) unsigned NOT NULL default '0',
  id_msg int(10) unsigned NOT NULL default '0',
  PRIMARY KEY (id_search, id_msg)
) ENGINE=MyISAM;

#
# Table structure for table `log_search_results`
#

CREATE TABLE {$db_prefix}log_search_results (
  id_search tinyint(3) unsigned NOT NULL default '0',
  id_topic mediumint(8) unsigned NOT NULL default '0',
  id_msg int(10) unsigned NOT NULL default '0',
  relevance smallint(5) unsigned NOT NULL default '0',
  num_matches smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY (id_search, id_topic)
) ENGINE=MyISAM;

#
# Table structure for table `log_search_subjects`
#

CREATE TABLE {$db_prefix}log_search_subjects (
  word varchar(20) NOT NULL default '',
  id_topic mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY (word, id_topic),
  KEY id_topic (id_topic)
) ENGINE=MyISAM;

#
# Table structure for table `log_search_topics`
#

CREATE TABLE {$db_prefix}log_search_topics (
  id_search tinyint(3) unsigned NOT NULL default '0',
  id_topic mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY (id_search, id_topic)
) ENGINE=MyISAM;

#
# Table structure for table `log_spider_hits`
#

CREATE TABLE {$db_prefix}log_spider_hits (
  id_hit int(10) unsigned NOT NULL auto_increment,
  id_spider smallint(5) unsigned NOT NULL default '0',
  log_time int(10) unsigned NOT NULL default '0',
  url varchar(255) NOT NULL default '',
  processed tinyint(3) NOT NULL default '0',
  PRIMARY KEY (id_hit),
  KEY id_spider(id_spider),
  KEY log_time(log_time),
  KEY processed (processed)
) ENGINE=MyISAM;

#
# Table structure for table `log_spider_stats`
#

CREATE TABLE {$db_prefix}log_spider_stats (
  id_spider smallint(5) unsigned NOT NULL default '0',
  page_hits smallint(5) unsigned NOT NULL default '0',
  last_seen int(10) unsigned NOT NULL default '0',
  stat_date date NOT NULL default '0001-01-01',
  PRIMARY KEY (stat_date, id_spider)
) ENGINE=MyISAM;

#
# Table structure for table `log_subscribed`
#

CREATE TABLE {$db_prefix}log_subscribed (
  id_sublog int(10) unsigned NOT NULL auto_increment,
  id_subscribe mediumint(8) unsigned NOT NULL default '0',
  id_member int(10) NOT NULL default '0',
  old_id_group smallint(5) NOT NULL default '0',
  start_time int(10) NOT NULL default '0',
  end_time int(10) NOT NULL default '0',
  status tinyint(3) NOT NULL default '0',
  payments_pending tinyint(3) NOT NULL default '0',
  pending_details text NOT NULL,
  reminder_sent tinyint(3) NOT NULL default '0',
  vendor_ref varchar(255) NOT NULL default '',
  PRIMARY KEY (id_sublog),
  UNIQUE KEY id_subscribe (id_subscribe, id_member),
  KEY end_time (end_time),
  KEY reminder_sent (reminder_sent),
  KEY payments_pending (payments_pending),
  KEY status (status),
  KEY id_member (id_member)
) ENGINE=MyISAM;

#
# Table structure for table `log_topics`
#

CREATE TABLE {$db_prefix}log_topics (
  id_member mediumint(8) unsigned NOT NULL default '0',
  id_topic mediumint(8) unsigned NOT NULL default '0',
  id_msg int(10) unsigned NOT NULL default '0',
  unwatched tinyint(3) NOT NULL default '0',
  PRIMARY KEY (id_member, id_topic),
  KEY id_topic (id_topic)
) ENGINE=MyISAM;

#
# Table structure for table `mail_queue`
#

CREATE TABLE {$db_prefix}mail_queue (
  id_mail int(10) unsigned NOT NULL auto_increment,
  time_sent int(10) NOT NULL default '0',
  recipient varchar(255) NOT NULL default '',
  body mediumtext NOT NULL,
  subject varchar(255) NOT NULL default '',
  headers text NOT NULL,
  send_html tinyint(3) NOT NULL default '0',
  priority tinyint(3) NOT NULL default '1',
  private tinyint(1) NOT NULL default '0',
  message_id varchar(12) NOT NULL default '',
  PRIMARY KEY (id_mail),
  KEY time_sent (time_sent),
  KEY mail_priority (priority, id_mail)
) ENGINE=MyISAM;

#
# Table structure for table `membergroups`
#

CREATE TABLE {$db_prefix}membergroups (
  id_group smallint(5) unsigned NOT NULL auto_increment,
  group_name varchar(80) NOT NULL default '',
  description text NOT NULL,
  online_color varchar(20) NOT NULL default '',
  min_posts mediumint(9) NOT NULL default '-1',
  max_messages smallint(5) unsigned NOT NULL default '0',
  icons varchar(255) NOT NULL default '',
  group_type tinyint(3) NOT NULL default '0',
  hidden tinyint(3) NOT NULL default '0',
  id_parent smallint(5) NOT NULL default '-2',
  PRIMARY KEY (id_group),
  KEY min_posts (min_posts)
) ENGINE=MyISAM;

#
# Dumping data for table `membergroups`
#

$db->insert('ignore',
	'{db_prefix}membergroups',
	array('id_group' => 'int', 'group_name' => 'string', 'description' => 'string', 'online_color' => 'string',
	'min_posts' => 'int', 'group_type' => 'int'),
	array(
		(1, '{$default_administrator_group}', '', '#CD0000', -1, '5#iconadmin.png', 1),
		(2, '{$default_global_moderator_group}', '', '#0066FF', -1, '5#icongmod.png', 0),
		(3, '{$default_moderator_group}', '', '', -1, '5#iconmod.png', 0),
		(4, '{$default_newbie_group}', '', '', 0, '1#icon.png', 0),
		(5, '{$default_junior_group}', '', '', 50, '2#icon.png', 0),
		(6, '{$default_full_group}', '', '', 100, '3#icon.png', 0),
		(7, '{$default_senior_group}', '', '', 250, '4#icon.png', 0),
		(8, '{$default_hero_group}', '', '', 500, '5#icon.png', 0)
	),
	array('id_group')
);

# --------------------------------------------------------

#
# Table structure for table `members`
#

CREATE TABLE {$db_prefix}members (
  id_member mediumint(8) unsigned NOT NULL auto_increment,
  member_name varchar(80) NOT NULL default '',
  date_registered int(10) unsigned NOT NULL default '0',
  posts mediumint(8) unsigned NOT NULL default '0',
  id_group smallint(5) unsigned NOT NULL default '0',
  lngfile varchar(255) NOT NULL default '',
  last_login int(10) unsigned NOT NULL default '0',
  real_name varchar(255) NOT NULL default '',
  personal_messages smallint(5) NOT NULL default '0',
  mentions smallint(5) NOT NULL default '0',
  unread_messages smallint(5) NOT NULL default '0',
  new_pm tinyint(3) unsigned NOT NULL default '0',
  buddy_list text NOT NULL,
  pm_ignore_list varchar(255) NOT NULL default '',
  pm_prefs mediumint(8) NOT NULL default '2',
  mod_prefs varchar(20) NOT NULL default '',
  message_labels text NOT NULL,
  passwd varchar(64) NOT NULL default '',
  openid_uri text NOT NULL,
  email_address varchar(255) NOT NULL default '',
  personal_text varchar(255) NOT NULL default '',
  gender tinyint(4) unsigned NOT NULL default '0',
  birthdate date NOT NULL default '0001-01-01',
  website_title varchar(255) NOT NULL default '',
  website_url varchar(255) NOT NULL default '',
  location varchar(255) NOT NULL default '',
  hide_email tinyint(4) NOT NULL default '0',
  show_online tinyint(4) NOT NULL default '1',
  time_format varchar(80) NOT NULL default '',
  signature text NOT NULL,
  time_offset float NOT NULL default '0',
  avatar varchar(255) NOT NULL default '',
  pm_email_notify tinyint(4) NOT NULL default '0',
  karma_bad smallint(5) unsigned NOT NULL default '0',
  karma_good smallint(5) unsigned NOT NULL default '0',
  likes_given mediumint(5) unsigned NOT NULL default '0',
  likes_received mediumint(5) unsigned NOT NULL default '0',
  usertitle varchar(255) NOT NULL default '',
  notify_announcements tinyint(4) NOT NULL default '1',
  notify_regularity tinyint(4) NOT NULL default '1',
  notify_send_body tinyint(4) NOT NULL default '0',
  notify_types tinyint(4) NOT NULL default '2',
  member_ip varchar(255) NOT NULL default '',
  member_ip2 varchar(255) NOT NULL default '',
  secret_question varchar(255) NOT NULL default '',
  secret_answer varchar(64) NOT NULL default '',
  id_theme tinyint(4) unsigned NOT NULL default '0',
  is_activated tinyint(3) unsigned NOT NULL default '1',
  validation_code varchar(10) NOT NULL default '',
  id_msg_last_visit int(10) unsigned NOT NULL default '0',
  additional_groups varchar(255) NOT NULL default '',
  smiley_set varchar(48) NOT NULL default '',
  id_post_group smallint(5) unsigned NOT NULL default '0',
  total_time_logged_in int(10) unsigned NOT NULL default '0',
  password_salt varchar(255) NOT NULL default '',
  ignore_boards text NOT NULL,
  warning tinyint(4) NOT NULL default '0',
  passwd_flood varchar(12) NOT NULL default '',
  receive_from tinyint(4) unsigned NOT NULL default '1',
  PRIMARY KEY (id_member),
  KEY member_name (member_name),
  KEY real_name (real_name),
  KEY date_registered (date_registered),
  KEY id_group (id_group),
  KEY birthdate (birthdate),
  KEY posts (posts),
  KEY last_login (last_login),
  KEY lngfile (lngfile(30)),
  KEY id_post_group (id_post_group),
  KEY warning (warning),
  KEY total_time_logged_in (total_time_logged_in),
  KEY id_theme (id_theme)
) ENGINE=MyISAM;

#
# Table structure for table `member_logins`
#

CREATE TABLE {$db_prefix}member_logins (
  id_login int(10) NOT NULL auto_increment,
  id_member mediumint(8) unsigned NOT NULL default '0',
  time int(10) NOT NULL default '0',
  ip varchar(255) NOT NULL default '0',
  ip2 varchar(255) NOT NULL default '0',
  PRIMARY KEY (id_login),
  KEY id_member (id_member),
  KEY time (time)
) ENGINE=MyISAM;

#
# Table structure for table `message_icons`
#

CREATE TABLE {$db_prefix}message_icons (
  id_icon smallint(5) unsigned NOT NULL auto_increment,
  title varchar(80) NOT NULL default '',
  filename varchar(80) NOT NULL default '',
  id_board smallint(5) unsigned NOT NULL default '0',
  icon_order smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY (id_icon),
  KEY id_board (id_board)
) ENGINE=MyISAM;

#
# Dumping data for table `message_icons`
#

# // @todo i18n
$db->insert('ignore',
	'{db_prefix}message_icons',
	array('filename' => 'string', 'title' => 'string', 'icon_order' => 'int'),
	array(
		('xx', 'Standard', '0'),
		('thumbup', 'Thumb Up', '1'),
		('thumbdown', 'Thumb Down', '2'),
		('exclamation', 'Exclamation point', '3'),
		('question', 'Question mark', '4'),
		('lamp', 'Lamp', '5'),
		('smiley', 'Smiley', '6'),
		('angry', 'Angry', '7'),
		('cheesy', 'Cheesy', '8'),
		('grin', 'Grin', '9'),
		('sad', 'Sad', '10'),
		('wink', 'Wink', '11'),
		('poll', 'Poll', '12'),
	),
	array('id_icon')
);

# --------------------------------------------------------

#
# Table structure for table `message_likes`
#

CREATE TABLE {$db_prefix}message_likes (
  id_member mediumint(8) unsigned NOT NULL default '0',
  id_msg mediumint(8) unsigned NOT NULL default '0',
  id_poster mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY (id_msg, id_member),
  KEY id_member (id_member),
  KEY id_poster (id_poster)
) ENGINE=MyISAM;

#
# Table structure for table `messages`
#

CREATE TABLE {$db_prefix}messages (
  id_msg int(10) unsigned NOT NULL auto_increment,
  id_topic mediumint(8) unsigned NOT NULL default '0',
  id_board smallint(5) unsigned NOT NULL default '0',
  poster_time int(10) unsigned NOT NULL default '0',
  id_member mediumint(8) unsigned NOT NULL default '0',
  id_msg_modified int(10) unsigned NOT NULL default '0',
  subject varchar(255) NOT NULL default '',
  poster_name varchar(255) NOT NULL default '',
  poster_email varchar(255) NOT NULL default '',
  poster_ip varchar(255) NOT NULL default '',
  smileys_enabled tinyint(4) NOT NULL default '1',
  modified_time int(10) unsigned NOT NULL default '0',
  modified_name varchar(255) NOT NULL default '',
  body text NOT NULL,
  icon varchar(16) NOT NULL default 'xx',
  approved tinyint(3) NOT NULL default '1',
  PRIMARY KEY (id_msg),
  UNIQUE topic (id_topic, id_msg),
  UNIQUE id_board (id_board, id_msg),
  UNIQUE id_member (id_member, id_msg),
  KEY approved (approved),
  KEY ip_index (poster_ip(15), id_topic),
  KEY participation (id_member, id_topic),
  KEY show_posts (id_member, id_board),
  KEY id_topic (id_topic),
  KEY id_member_msg (id_member, approved, id_msg),
  KEY current_topic (id_topic, id_msg, id_member, approved),
  KEY related_ip (id_member, poster_ip, id_msg)
) ENGINE=MyISAM;

#
# Dumping data for table `messages`
#

$db->insert('ignore',
	'{db_prefix}messages',
	array('id_msg' => 'int', 'id_msg_modified' => 'int', 'id_topic' => 'int', 'id_board' => 'int', 'poster_time' => 'int',
	'subject' => 'string', 'poster_name' => 'string', 'poster_email' => 'string', 'poster_ip' => 'string',
	'modified_name' => 'string', 'body' => 'string', 'icon' => 'string')
	array(
		(1, 1, 1, 1, UNIX_TIMESTAMP(), '{$default_topic_subject}', 'Elkarte', 'info@elkarte.net', '127.0.0.1', '', '{$default_topic_message}', 'xx')
	),
	array('id_msg')
);

# --------------------------------------------------------

#
# Table structure for table `moderators`
#

CREATE TABLE {$db_prefix}moderators (
  id_board smallint(5) unsigned NOT NULL default '0',
  id_member mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY (id_board, id_member)
) ENGINE=MyISAM;

#
# Table structure for table `openid_assoc`
#

CREATE TABLE {$db_prefix}openid_assoc (
  server_url text NOT NULL,
  handle varchar(255) NOT NULL default '',
  secret text NOT NULL,
  issued int(10) NOT NULL default '0',
  expires int(10) NOT NULL default '0',
  assoc_type varchar(64) NOT NULL default '',
  PRIMARY KEY (server_url(125), handle(125)),
  KEY expires (expires)
) ENGINE=MyISAM;

#
# Table structure for table `package_servers`
#

CREATE TABLE {$db_prefix}package_servers (
  id_server smallint(5) unsigned NOT NULL auto_increment,
  name varchar(255) NOT NULL default '',
  url varchar(255) NOT NULL default '',
  PRIMARY KEY (id_server)
) ENGINE=MyISAM;

#
# Dumping data for table `package_servers`
#

$db->insert('ignore',
	'{db_prefix}package_servers',
	array('name' => 'string', 'url' => 'string')
	array(
		('ElkArte Third-party Add-ons Site', 'https://github.com/elkarte/addons/tree/master/packages')
	),
	array('id_server')
);

# --------------------------------------------------------

#
# Table structure for table `permission_profiles`
#

CREATE TABLE {$db_prefix}permission_profiles (
  id_profile smallint(5) NOT NULL auto_increment,
  profile_name varchar(255) NOT NULL default '',
  PRIMARY KEY (id_profile)
) ENGINE=MyISAM;

#
# Dumping data for table `permission_profiles`
#

$db->insert('ignore',
	'{db_prefix}permission_profiles',
	array('id_profile' => 'int', 'profile_name' => 'string')
	array(
		(1, 'default'),
		(2, 'no_polls'),
		(3, 'reply_only'),
		(4, 'read_only')
	),
	array('id_group')
);

# --------------------------------------------------------

#
# Table structure for table `permissions`
#

CREATE TABLE {$db_prefix}permissions (
  id_group smallint(5) NOT NULL default '0',
  permission varchar(30) NOT NULL default '',
  add_deny tinyint(4) NOT NULL default '1',
  PRIMARY KEY (id_group, permission)
) ENGINE=MyISAM;

#
# Dumping data for table `permissions`
#

$db->insert('ignore',
	'{db_prefix}permissions',
	array('id_group' => 'int', 'permission' => 'string')
	array(
		(-1, 'search_posts'),
		(-1, 'calendar_view'),
		(-1, 'view_stats'),
		(-1, 'profile_view_any'),
		(0, 'view_mlist'),
		(0, 'search_posts'),
		(0, 'profile_view_own'),
		(0, 'profile_view_any'),
		(0, 'pm_read'),
		(0, 'pm_send'),
		(0, 'calendar_view'),
		(0, 'view_stats'),
		(0, 'who_view'),
		(0, 'profile_identity_own'),
		(0, 'profile_extra_own'),
		(0, 'profile_remove_own'),
		(0, 'profile_server_avatar'),
		(0, 'profile_upload_avatar'),
		(0, 'profile_remote_avatar'),
		(0, 'profile_gravatar'),
		(0, 'send_email_to_members'),
		(0, 'karma_edit'),
		(2, 'view_mlist'),
		(2, 'search_posts'),
		(2, 'profile_view_own'),
		(2, 'profile_view_any'),
		(2, 'pm_read'),
		(2, 'pm_send'),
		(2, 'pm_draft'),
		(2, 'pm_autosave_draft'),
		(2, 'calendar_view'),
		(2, 'view_stats'),
		(2, 'who_view'),
		(2, 'profile_identity_own'),
		(2, 'profile_extra_own'),
		(2, 'profile_remove_own'),
		(2, 'profile_server_avatar'),
		(2, 'profile_upload_avatar'),
		(2, 'profile_remote_avatar'),
		(2, 'profile_gravatar'),
		(2, 'send_email_to_members'),
		(2, 'profile_title_own'),
		(2, 'calendar_post'),
		(2, 'calendar_edit_any'),
		(2, 'karma_edit'),
		(2, 'access_mod_center')
	),
	array('id_group', 'permission')
);

# --------------------------------------------------------

#
# Table structure for table `personal_messages`
#

CREATE TABLE {$db_prefix}personal_messages (
  id_pm int(10) unsigned NOT NULL auto_increment,
  id_pm_head int(10) unsigned NOT NULL default '0',
  id_member_from mediumint(8) unsigned NOT NULL default '0',
  deleted_by_sender tinyint(3) unsigned NOT NULL default '0',
  from_name varchar(255) NOT NULL default '',
  msgtime int(10) unsigned NOT NULL default '0',
  subject varchar(255) NOT NULL default '',
  body text NOT NULL,
  PRIMARY KEY (id_pm),
  KEY id_member (id_member_from, deleted_by_sender),
  KEY msgtime (msgtime),
  KEY id_pm_head (id_pm_head)
) ENGINE=MyISAM;

#
# Table structure for table `pm_recipients`
#

CREATE TABLE {$db_prefix}pm_recipients (
  id_pm int(10) unsigned NOT NULL default '0',
  id_member mediumint(8) unsigned NOT NULL default '0',
  labels varchar(60) NOT NULL default '-1',
  bcc tinyint(3) unsigned NOT NULL default '0',
  is_read tinyint(3) unsigned NOT NULL default '0',
  is_new tinyint(3) unsigned NOT NULL default '0',
  deleted tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY (id_pm, id_member),
  UNIQUE id_member (id_member, deleted, id_pm)
) ENGINE=MyISAM;

#
# Table structure for table `pm_rules`
#

CREATE TABLE {$db_prefix}pm_rules (
  id_rule int(10) unsigned NOT NULL auto_increment,
  id_member int(10) unsigned NOT NULL default '0',
  rule_name varchar(60) NOT NULL default '',
  criteria text NOT NULL,
  actions text NOT NULL,
  delete_pm tinyint(3) unsigned NOT NULL default '0',
  is_or tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY (id_rule),
  KEY id_member (id_member),
  KEY delete_pm (delete_pm)
) ENGINE=MyISAM;

#
# Table structure for table `polls`
#

CREATE TABLE {$db_prefix}polls (
  id_poll mediumint(8) unsigned NOT NULL auto_increment,
  question varchar(255) NOT NULL default '',
  voting_locked tinyint(1) NOT NULL default '0',
  max_votes tinyint(3) unsigned NOT NULL default '1',
  expire_time int(10) unsigned NOT NULL default '0',
  hide_results tinyint(3) unsigned NOT NULL default '0',
  change_vote tinyint(3) unsigned NOT NULL default '0',
  guest_vote tinyint(3) unsigned NOT NULL default '0',
  num_guest_voters int(10) unsigned NOT NULL default '0',
  reset_poll int(10) unsigned NOT NULL default '0',
  id_member mediumint(8) unsigned NOT NULL default '0',
  poster_name varchar(255) NOT NULL default '',
  PRIMARY KEY (id_poll)
) ENGINE=MyISAM;

#
# Table structure for table `poll_choices`
#

CREATE TABLE {$db_prefix}poll_choices (
  id_poll mediumint(8) unsigned NOT NULL default '0',
  id_choice tinyint(3) unsigned NOT NULL default '0',
  label varchar(255) NOT NULL default '',
  votes smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY (id_poll, id_choice)
) ENGINE=MyISAM;

#
# Table structure for table `postby_emails`
#

CREATE TABLE {$db_prefix}postby_emails (
  id_email varchar(50) NOT NULL default '',
  time_sent int(10) NOT NULL default '0',
  email_to varchar(50) NOT NULL default '',
  PRIMARY KEY (id_email)
) ENGINE=MyISAM;

#
# Table structure for table `postby_emails_error`
#

CREATE TABLE {$db_prefix}postby_emails_error (
  id_email int(10) NOT NULL auto_increment,
  error varchar(255) NOT NULL default '',
  data_id varchar(255) NOT NULL default '0',
  subject varchar(255) NOT NULL default '',
  id_message int(10) NOT NULL default '0',
  id_board smallint(5) NOT NULL default '0',
  email_from varchar(50) NOT NULL default '',
  message_type char(10) NOT NULL default '',
  message mediumtext NOT NULL,
  PRIMARY KEY (id_email)
) ENGINE=MyISAM;

#
# Table structure for table `postby_emails_filters`
#

CREATE TABLE {$db_prefix}postby_emails_filters (
  id_filter int(10) NOT NULL auto_increment,
  filter_style char(5) NOT NULL default '',
  filter_type varchar(255) NOT NULL default '',
  filter_to varchar(255) NOT NULL default '',
  filter_from varchar(255) NOT NULL default '',
  filter_name varchar(255) NOT NULL default '',
  filter_order int(10) NOT NULL default '0',
  PRIMARY KEY (id_filter)
) ENGINE=MyISAM;

#
# Table structure for table `scheduled_tasks`
#

CREATE TABLE {$db_prefix}scheduled_tasks (
  id_task smallint(5) NOT NULL auto_increment,
  next_time int(10) NOT NULL default '0',
  time_offset int(10) NOT NULL default '0',
  time_regularity smallint(5) NOT NULL default '0',
  time_unit varchar(1) NOT NULL default 'h',
  disabled tinyint(3) NOT NULL default '0',
  task varchar(24) NOT NULL default '',
  PRIMARY KEY (id_task),
  KEY next_time (next_time),
  KEY disabled (disabled),
  UNIQUE task (task)
) ENGINE=MyISAM;

#
# Dumping data for table `scheduled_tasks`
#

$db->insert('ignore',
	'{db_prefix}scheduled_tasks',
	array('id_task' => 'int', 'next_time' => 'int', 'time_offset => 'int', 'time_regularity' => 'int',
	'time_unit' => 'string', 'disabled' => 'int', 'task' => 'string')
	array(
		(1, 0, 0, 2, 'h', 0, 'approval_notification'),
		(2, 0, 0, 7, 'd', 0, 'auto_optimize'),
		(3, 0, 60, 1, 'd', 0, 'daily_maintenance'),
		(4, 0, 0, 1, 'd', 0, 'daily_digest'),
		(5, 0, 0, 1, 'w', 0, 'weekly_digest'),
		(6, 0, 0, 1, 'd', 1, 'birthdayemails'),
		(7, 0, 0, 1, 'w', 0, 'weekly_maintenance'),
		(8, 0, 120, 1, 'd', 1, 'paid_subscriptions'),
		(9, 0, 120, 1, 'd', 0, 'remove_temp_attachments'),
		(10, 0, 180, 1, 'd', 0, 'remove_topic_redirect'),
		(11, 0, 240, 1, 'd', 0, 'remove_old_drafts'),
		(12, 0, 0, 6, 'h', 0, 'remove_old_followups'),
		(13, 0, 360, 10, 'm', 1, 'maillist_fetch_IMAP'),
		(14, 0, 30, 1, 'h', 0, 'user_access_mentions')
	),
	array('id_task')
);

# --------------------------------------------------------

#
# Table structure for table `settings`
#

CREATE TABLE {$db_prefix}settings (
  variable varchar(255) NOT NULL default '',
  value text NOT NULL,
  PRIMARY KEY (variable(30))
) ENGINE=MyISAM;

#
# Dumping data for table `settings`
#

$db->insert('ignore',
	'{db_prefix}settings',
	array('variable' => 'string', 'value' => 'string')
	array(
		('elkVersion', '{$current_version}'),
		('news', '{$default_news}'),
		('detailed-version.js', 'https://elkarte.github.io/Elkarte/site/detailed-version.js'),
		('compactTopicPagesContiguous', '5'),
		('compactTopicPagesEnable', '1'),
		('enableStickyTopics', '1'),
		('todayMod', '1'),
		('likes_enabled', '1'),
		('likeDisplayLimit', '5'),
		('likeMinPosts', '5'),
		('karmaMode', '0'),
		('karmaTimeRestrictAdmins', '1'),
		('enablePreviousNext', '1'),
		('pollMode', '1'),
		('enableVBStyleLogin', '1'),
		('enableCompressedOutput', '{$enableCompressedOutput}'),
		('karmaWaitTime', '1'),
		('karmaMinPosts', '0'),
		('karmaLabel', '{$default_karmaLabel}'),
		('karmaSmiteLabel', '{$default_karmaSmiteLabel}'),
		('karmaApplaudLabel', '{$default_karmaApplaudLabel}'),
		('attachmentSizeLimit', '128'),
		('attachmentPostLimit', '192'),
		('attachmentNumPerPostLimit', '4'),
		('attachmentDirSizeLimit', '10240'),
		('attachmentDirFileLimit', '1000'),
		('attachmentUploadDir', '{BOARDDIR}/attachments'),
		('attachmentExtensions', 'doc,gif,jpg,mpg,pdf,png,txt,zip'),
		('attachmentCheckExtensions', '0'),
		('attachmentShowImages', '1'),
		('attachmentEnable', '1'),
		('attachmentEncryptFilenames', '1'),
		('attachmentThumbnails', '1'),
		('attachmentThumbWidth', '150'),
		('attachmentThumbHeight', '150'),
		('use_subdirectories_for_attachments', '1'),
		('censorIgnoreCase', '1'),
		('mostOnline', '1'),
		('mostOnlineToday', '1'),
		('mostDate', UNIX_TIMESTAMP()),
		('allow_disableAnnounce', '1'),
		('trackStats', '1'),
		('userLanguage', '1'),
		('titlesEnable', '1'),
		('topicSummaryPosts', '15'),
		('enableErrorLogging', '1'),
		('max_image_width', '0'),
		('max_image_height', '0'),
		('onlineEnable', '0'),
		('cal_enabled', '0'),
		('cal_maxyear', '2020'),
		('cal_minyear', '2008'),
		('cal_daysaslink', '0'),
		('cal_defaultboard', ''),
		('cal_showholidays', '1'),
		('cal_showbdays', '1'),
		('cal_showevents', '1'),
		('cal_showweeknum', '0'),
		('cal_maxspan', '7'),
		('smtp_host', ''),
		('smtp_port', '25'),
		('smtp_username', ''),
		('smtp_password', ''),
		('mail_type', '0'),
		('timeLoadPageEnable', '0'),
		('totalMembers', '0'),
		('totalTopics', '1'),
		('totalMessages', '1'),
		('censor_vulgar', ''),
		('censor_proper', ''),
		('enablePostHTML', '0'),
		('theme_allow', '1'),
		('theme_default', '1'),
		('theme_guests', '1'),
		('xmlnews_enable', '1'),
		('xmlnews_limit', '5'),
		('xmlnews_maxlen', '255'),
		('hotTopicPosts', '15'),
		('hotTopicVeryPosts', '25'),
		('registration_method', '0'),
		('send_validation_onChange', '0'),
		('send_welcomeEmail', '1'),
		('allow_editDisplayName', '1'),
		('admin_session_lifetime', '10'),
		('allow_hideOnline', '1'),
		('spamWaitTime', '5'),
		('pm_spam_settings', '10,5,20'),
		('reserveWord', '0'),
		('reserveCase', '1'),
		('reserveUser', '1'),
		('reserveName', '1'),
		('reserveNames', '{$default_reserved_names}'),
		('autoLinkUrls', '1'),
		('banLastUpdated', '0'),
		('smileys_dir', '{BOARDDIR}/smileys'),
		('smileys_url', '{$boardurl}/smileys'),
		('avatar_default', '0'),
		('avatar_directory', '{BOARDDIR}/avatars'),
		('avatar_url', '{$boardurl}/avatars'),
		('avatar_max_height_external', '65'),
		('avatar_max_width_external', '65'),
		('avatar_action_too_large', 'option_html_resize'),
		('avatar_max_height_upload', '65'),
		('avatar_max_width_upload', '65'),
		('avatar_resize_upload', '1'),
		('avatar_download_png', '1'),
		('gravatar_rating', 'g'),
		('failed_login_threshold', '3'),
		('oldTopicDays', '120'),
		('edit_wait_time', '90'),
		('edit_disable_time', '0'),
		('autoFixDatabase', '1'),
		('allow_guestAccess', '1'),
		('time_format', '{$default_time_format}'),
		('number_format', '1234.00'),
		('enableBBC', '1'),
		('max_messageLength', '20000'),
		('signature_settings', '1,300,0,0,0,0,0,0:'),
		('autoOptMaxOnline', '0'),
		('defaultMaxMessages', '15'),
		('defaultMaxTopics', '20'),
		('defaultMaxMembers', '30'),
		('enableParticipation', '1'),
		('enableFollowup', '1'),
		('recycle_enable', '0'),
		('recycle_board', '0'),
		('maxMsgID', '1'),
		('enableAllMessages', '0'),
		('fixLongWords', '0'),
		('knownThemes', '1,2,3'),
		('who_enabled', '1'),
		('time_offset', '0'),
		('cookieTime', '60'),
		('jquery_source', 'local'),
		('lastActive', '15'),
		('smiley_sets_known', 'default'),
		('smiley_sets_names', '{$default_smileyset_name}'),
		('smiley_sets_default', 'default'),
		('cal_days_for_index', '7'),
		('requireAgreement', '1'),
		('unapprovedMembers', '0'),
		('default_personal_text', ''),
		('package_make_backups', '1'),
		('databaseSession_enable', '{$databaseSession_enable}'),
		('databaseSession_loose', '1'),
		('databaseSession_lifetime', '2880'),
		('search_cache_size', '50'),
		('search_results_per_page', '30'),
		('search_weight_frequency', '30'),
		('search_weight_age', '25'),
		('search_weight_length', '20'),
		('search_weight_subject', '15'),
		('search_weight_first_message', '10'),
		('search_max_results', '1200'),
		('search_floodcontrol_time', '5'),
		('permission_enable_deny', '0'),
		('permission_enable_postgroups', '0'),
		('mail_next_send', '0'),
		('mail_recent', '0000000000|0'),
		('settings_updated', '0'),
		('next_task_time', '1'),
		('warning_settings', '1,20,0'),
		('warning_watch', '10'),
		('warning_moderate', '35'),
		('warning_mute', '60'),
		('admin_features', ''),
		('last_mod_report_action', '0'),
		('pruningOptions', '30,180,180,180,30,7,0'),
		('cache_enable', '1'),
		('reg_verification', '1'),
		('visual_verification_type', '3'),
		('visual_verification_num_chars', '6'),
		('enable_buddylist', '1'),
		('birthday_email', 'happy_birthday'),
		('dont_repeat_theme_core', '1'),
		('dont_repeat_smileys_20', '1'),
		('dont_repeat_buddylists', '1'),
		('attachment_image_reencode', '1'),
		('attachment_image_paranoid', '0'),
		('attachment_thumb_png', '1'),
		('avatar_reencode', '1'),
		('avatar_paranoid', '0'),
		('enable_unwatch', '0'),
		('mentions_enabled', '1'),
		('mentions_buddy', '0'),
		('mentions_dont_notify_rlike', '0'),
		('badbehavior_enabled', '0'),
		('badbehavior_logging', '1'),
		('badbehavior_ip_wl', 'a:3:{i:2;s:10:"10.0.0.0/8";i:5;s:13:"172.16.0.0/12";i:6;s:14:"192.168.0.0/16";}'),
		('badbehavior_ip_wl_desc', 'a:3:{i:2;s:18:"RFC 1918 addresses";i:5;s:18:"RFC 1918 addresses";i:6;s:18:"RFC 1918 addresses";}'),
		('badbehavior_url_wl', 'a:1:{i:0;s:18:"/subscriptions.php";}'),
		('badbehavior_url_wl_desc', 'a:1:{i:0;s:15:"Payment Gateway";}')
	),
	array('variable')
);

# --------------------------------------------------------

#
# Table structure for table `sessions`
#

CREATE TABLE {$db_prefix}sessions (
  session_id char(64) NOT NULL,
  last_update int(10) unsigned NOT NULL,
  data text NOT NULL,
  PRIMARY KEY (session_id)
) ENGINE=MyISAM;

#
# Table structure for table `smileys`
#

CREATE TABLE {$db_prefix}smileys (
  id_smiley smallint(5) unsigned NOT NULL auto_increment,
  code varchar(30) NOT NULL default '',
  filename varchar(48) NOT NULL default '',
  description varchar(80) NOT NULL default '',
  smiley_row tinyint(4) unsigned NOT NULL default '0',
  smiley_order smallint(5) unsigned NOT NULL default '0',
  hidden tinyint(4) unsigned NOT NULL default '0',
  PRIMARY KEY (id_smiley)
) ENGINE=MyISAM;

#
# Dumping data for table `smileys`
#

$db->insert('ignore',
	'{db_prefix}smileys',
	array('code' => 'string', 'filename' => 'string', 'description => 'string',
	'smiley_order' => 'int', 'hidden' => 'int')
	array(
		(':)', 'smiley.gif', '{$default_smiley_smiley}', 0, 0),
		(';)', 'wink.gif', '{$default_wink_smiley}', 1, 0),
		(':D', 'cheesy.gif', '{$default_cheesy_smiley}', 2, 0),
		(';D', 'grin.gif', '{$default_grin_smiley}', 3, 0),
		('>:(', 'angry.gif', '{$default_angry_smiley}', 4, 0),
		(':(', 'sad.gif', '{$default_sad_smiley}', 5, 0),
		(':o', 'shocked.gif', '{$default_shocked_smiley}', 6, 0),
		('8)', 'cool.gif', '{$default_cool_smiley}', 7, 0),
		('???', 'huh.gif', '{$default_huh_smiley}', 8, 0),
		('::)', 'rolleyes.gif', '{$default_roll_eyes_smiley}', 9, 0),
		(':P', 'tongue.gif', '{$default_tongue_smiley}', 10, 0),
		(':-[', 'embarrassed.gif', '{$default_embarrassed_smiley}', 11, 0),
		(':-X', 'lipsrsealed.gif', '{$default_lips_sealed_smiley}', 12, 0),
		(':-\\', 'undecided.gif', '{$default_undecided_smiley}', 13, 0),
		(':-*', 'kiss.gif', '{$default_kiss_smiley}', 14, 0),
		(':\'(', 'cry.gif', '{$default_cry_smiley}', 15, 0),
		('>:D', 'evil.gif', '{$default_evil_smiley}', 16, 1),
		('^-^', 'azn.gif', '{$default_azn_smiley}', 17, 1),
		('O0', 'afro.gif', '{$default_afro_smiley}', 18, 1),
		(':))', 'laugh.gif', '{$default_laugh_smiley}', 19, 1),
		('C:-)', 'police.gif', '{$default_police_smiley}', 20, 1),
		('O:)', 'angel.gif', '{$default_angel_smiley}', 21, 1)
	),
	array('id_smiley')
);

# --------------------------------------------------------

#
# Table structure for table `spiders`
#

CREATE TABLE {$db_prefix}spiders (
  id_spider smallint(5) unsigned NOT NULL auto_increment,
  spider_name varchar(255) NOT NULL default '',
  user_agent varchar(255) NOT NULL default '',
  ip_info varchar(255) NOT NULL default '',
  PRIMARY KEY id_spider(id_spider)
) ENGINE=MyISAM;

#
# Dumping data for table `spiders`
#

$db->insert('ignore',
	'{db_prefix}spiders',
	array('id_spider' => 'int', 'spider_name' => 'string', 'user_agent => 'string', 'ip_info' => 'string')
	array(
		(1, 'Google', 'googlebot', ''),
		(2, 'Yahoo!', 'Yahoo! Slurp', ''),
		(3, 'MSN', 'msnbot', ''),
		(4, 'Bing', 'bingbot', ''),
		(5, 'Google (Mobile)', 'Googlebot-Mobile', ''),
		(6, 'Google (Image)', 'Googlebot-Image', ''),
		(7, 'Google (AdSense)', 'Mediapartners-Google', ''),
		(8, 'Google (Adwords)', 'AdsBot-Google', ''),
		(9, 'Yahoo! (Mobile)', 'YahooSeeker/M1A1-R2D2', ''),
		(10, 'Yahoo! (Image)', 'Yahoo-MMCrawler', ''),
		(11, 'Yahoo! (Blogs)', 'Yahoo-Blogs', ''),
		(12, 'Yahoo! (Feeds)', 'YahooFeedSeeker', ''),
		(13, 'MSN (Mobile)', 'MSNBOT_Mobile', ''),
		(14, 'MSN (Media)', 'msnbot-media', ''),
		(15, 'Cuil', 'twiceler', ''),
		(16, 'Ask', 'Teoma', ''),
		(17, 'Baidu', 'Baiduspider', ''),
		(18, 'Gigablast', 'Gigabot', ''),
		(19, 'InternetArchive', 'ia_archiver-web.archive.org', ''),
		(20, 'Alexa', 'ia_archiver', ''),
		(21, 'Omgili', 'omgilibot', ''),
		(22, 'EntireWeb', 'Speedy Spider', ''),
		(23, 'Yandex', 'YandexBot', ''),
		(24, 'Yandex (Images)', 'YandexImages', ''),
		(25, 'Yandex (Video)', 'YandexVideo', ''),
		(26, 'Yandex (Blogs)', 'YandexBlogs', ''),
		(27, 'Yandex (Media)', 'YandexMedia', '')
	),
	array('id_spider')
);

# --------------------------------------------------------

#
# Table structure for table `subscriptions`
#

CREATE TABLE {$db_prefix}subscriptions(
  id_subscribe mediumint(8) unsigned NOT NULL auto_increment,
  name varchar(60) NOT NULL default '',
  description varchar(255) NOT NULL default '',
  cost text NOT NULL,
  length varchar(6) NOT NULL default '',
  id_group smallint(5) NOT NULL default '0',
  add_groups varchar(40) NOT NULL default '',
  active tinyint(3) NOT NULL default '1',
  repeatable tinyint(3) NOT NULL default '0',
  allow_partial tinyint(3) NOT NULL default '0',
  reminder tinyint(3) NOT NULL default '0',
  email_complete text NOT NULL,
  PRIMARY KEY (id_subscribe),
  KEY active (active)
) ENGINE=MyISAM;

#
# Table structure for table `themes`
#

# this may look inconsistent, but id_member is *not* unsigned

CREATE TABLE {$db_prefix}themes (
  id_member mediumint(8) NOT NULL default '0',
  id_theme tinyint(4) unsigned NOT NULL default '1',
  variable varchar(255) NOT NULL default '',
  value text NOT NULL,
  PRIMARY KEY (id_theme, id_member, variable(30)),
  KEY id_member (id_member)
) ENGINE=MyISAM;

#
# Dumping data for table `themes`
#

$db->insert('ignore',
	'{db_prefix}themes',
	array('id_theme' => 'int', 'variable' => 'string', 'value => 'string')
	array(
		(1, 'name', '{$default_theme_name}'),
		(1, 'theme_url', '{$boardurl}/themes/default'),
		(1, 'images_url', '{$boardurl}/themes/default/images'),
		(1, 'theme_dir', '{BOARDDIR}/themes/default'),
		(1, 'show_bbc', '1'),
		(1, 'show_latest_member', '1'),
		(1, 'show_modify', '1'),
		(1, 'show_user_images', '1'),
		(1, 'show_blurb', '1'),
		(1, 'show_gender', '0'),
		(1, 'number_recent_posts', '0'),
		(1, 'show_member_bar', '1'),
		(1, 'linktree_link', '1'),
		(1, 'show_profile_buttons', '1'),
		(1, 'show_mark_read', '1'),
		(1, 'show_stats_index', '1'),
		(1, 'newsfader_time', '5000'),
		(1, 'allow_no_censored', '0'),
		(1, 'additional_options_collapsable', '1'),
		(1, 'use_image_buttons', '1'),
		(1, 'enable_news', '1'),
		(1, 'forum_width', '90%')
	),
	array('id_theme', 'id_member', 'variable')
);

$db->insert('ignore',
	'{db_prefix}themes',
	array('id_member' => 'int', 'id_theme' => 'int', 'variable' => 'string', 'value => 'string')
	array(
		(-1, 1, 'display_quick_reply', '2'),
		(-1, 1, 'drafts_autosave_enabled', '1')
	),
	array('id_theme', 'id_member', 'variable')
);

# --------------------------------------------------------

#
# Table structure for table `topics`
#

CREATE TABLE {$db_prefix}topics (
  id_topic mediumint(8) unsigned NOT NULL auto_increment,
  is_sticky tinyint(4) NOT NULL default '0',
  id_board smallint(5) unsigned NOT NULL default '0',
  id_first_msg int(10) unsigned NOT NULL default '0',
  id_last_msg int(10) unsigned NOT NULL default '0',
  id_member_started mediumint(8) unsigned NOT NULL default '0',
  id_member_updated mediumint(8) unsigned NOT NULL default '0',
  id_poll mediumint(8) unsigned NOT NULL default '0',
  id_previous_board smallint(5) NOT NULL default '0',
  id_previous_topic mediumint(8) NOT NULL default '0',
  num_replies int(10) unsigned NOT NULL default '0',
  num_views int(10) unsigned NOT NULL default '0',
  num_likes int(10) unsigned NOT NULL default '0',
  locked tinyint(4) NOT NULL default '0',
  redirect_expires int(10) unsigned NOT NULL default '0',
  id_redirect_topic mediumint(8) unsigned NOT NULL default '0',
  unapproved_posts smallint(5) NOT NULL default '0',
  approved tinyint(3) NOT NULL default '1',
  PRIMARY KEY (id_topic),
  UNIQUE last_message (id_last_msg, id_board),
  UNIQUE first_message (id_first_msg, id_board),
  UNIQUE poll (id_poll, id_topic),
  KEY is_sticky (is_sticky),
  KEY approved (approved),
  KEY id_board (id_board),
  KEY member_started (id_member_started, id_board),
  KEY last_message_sticky (id_board, is_sticky, id_last_msg),
  KEY board_news (id_board, id_first_msg)
) ENGINE=MyISAM;

#
# Dumping data for table `topics`
#

$db->insert('ignore',
	'{db_prefix}topics',
	array('id_topic' => 'int', 'id_board' => 'int', 'id_first_msg' => 'int',
	'id_last_msg' => 'int', 'id_member_started' => 'int', 'id_member_updated' => 'int')
	array(
		(1, 1, 1, 1, 0, 0)
	),
	array('id_topic')
);

# --------------------------------------------------------

#
# Table structure for table `user_drafts`
#

CREATE TABLE {$db_prefix}user_drafts (
  id_draft int(10) unsigned NOT NULL auto_increment,
  id_topic mediumint(8) unsigned NOT NULL default '0',
  id_board smallint(5) unsigned NOT NULL default '0',
  id_reply int(10) unsigned NOT NULL default '0',
  type tinyint(4) NOT NULL default '0',
  poster_time int(10) unsigned NOT NULL default '0',
  id_member mediumint(8) unsigned NOT NULL default '0',
  subject varchar(255) NOT NULL default '',
  smileys_enabled tinyint(4) NOT NULL default '1',
  body mediumtext NOT NULL,
  icon varchar(16) NOT NULL default 'xx',
  locked tinyint(4) NOT NULL default '0',
  is_sticky tinyint(4) NOT NULL default '0',
  to_list varchar(255) NOT NULL default '',
  PRIMARY KEY (id_draft),
  UNIQUE id_member (id_member, id_draft, type)
) ENGINE=MyISAM;
