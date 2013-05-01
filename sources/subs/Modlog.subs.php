<?php

/**
 * @name      ElkArte Forum
 * @copyright ElkArte Forum contributors
 * @license   BSD http://opensource.org/licenses/BSD-3-Clause
 *
 * This software is a derived product, based on:
 *
 * Simple Machines Forum (SMF)
 * copyright:	2011 Simple Machines (http://www.simplemachines.org)
 * license:  	BSD, See included LICENSE.TXT for terms and conditions.
 *
 * @version 1.0 Alpha
 *
 * Moderation helper functions.
 *
 */

if (!defined('ELKARTE'))
	die('No access...');

/**
 * Get the number of mod log entries.
 * Callback for createList() in action_modlog().
 *
 * @param $query_string
 * @param $query_params
 * @param $log_type
 */
function list_getModLogEntryCount($query_string = '', $query_params = array(), $log_type = 1)
{
	global $smcFunc, $user_info;

	$modlog_query = allowedTo('admin_forum') || $user_info['mod_cache']['bq'] == '1=1' ? '1=1' : ($user_info['mod_cache']['bq'] == '0=1' ? 'lm.id_board = 0 AND lm.id_topic = 0' : (strtr($user_info['mod_cache']['bq'], array('id_board' => 'b.id_board')) . ' AND ' . strtr($user_info['mod_cache']['bq'], array('id_board' => 't.id_board'))));

	$result = $smcFunc['db_query']('', '
		SELECT COUNT(*)
		FROM {db_prefix}log_actions AS lm
			LEFT JOIN {db_prefix}members AS mem ON (mem.id_member = lm.id_member)
			LEFT JOIN {db_prefix}membergroups AS mg ON (mg.id_group = CASE WHEN mem.id_group = {int:reg_group_id} THEN mem.id_post_group ELSE mem.id_group END)
			LEFT JOIN {db_prefix}boards AS b ON (b.id_board = lm.id_board)
			LEFT JOIN {db_prefix}topics AS t ON (t.id_topic = lm.id_topic)
		WHERE id_log = {int:log_type}
			AND {raw:modlog_query}'
			. (!empty($query_string) ? '
				AND ' . $query_string : ''),
		array_merge($query_params, array(
			'reg_group_id' => 0,
			'log_type' => $log_type,
			'modlog_query' => $modlog_query,
		))
	);
	list ($entry_count) = $smcFunc['db_fetch_row']($result);
	$smcFunc['db_free_result']($result);

	return $entry_count;
}

/**
 * Gets the moderation log entries that match the specified parameters.
 * Callback for createList() in action_modlog().
 *
 * @param $start
 * @param $items_per_page
 * @param $sort
 * @param $query_string
 * @param $query_params
 * @param $log_type
 */
function list_getModLogEntries($start, $items_per_page, $sort, $query_string = '', $query_params = array(), $log_type = 1)
{
	global $context, $scripturl, $txt, $smcFunc, $user_info;

	$modlog_query = allowedTo('admin_forum') || $user_info['mod_cache']['bq'] == '1=1' ? '1=1' : ($user_info['mod_cache']['bq'] == '0=1' ? 'lm.id_board = 0 AND lm.id_topic = 0' : (strtr($user_info['mod_cache']['bq'], array('id_board' => 'b.id_board')) . ' AND ' . strtr($user_info['mod_cache']['bq'], array('id_board' => 't.id_board'))));

	// Do a little bit of self protection.
	if (!isset($context['hoursdisable']))
		$context['hoursdisable'] = 24;

	// Can they see the IP address?
	$seeIP = allowedTo('moderate_forum');

	// Here we have the query getting the log details.
	$result = $smcFunc['db_query']('', '
		SELECT
			lm.id_action, lm.id_member, lm.ip, lm.log_time, lm.action, lm.id_board, lm.id_topic, lm.id_msg, lm.extra,
			mem.real_name, mg.group_name
		FROM {db_prefix}log_actions AS lm
			LEFT JOIN {db_prefix}members AS mem ON (mem.id_member = lm.id_member)
			LEFT JOIN {db_prefix}membergroups AS mg ON (mg.id_group = CASE WHEN mem.id_group = {int:reg_group_id} THEN mem.id_post_group ELSE mem.id_group END)
			LEFT JOIN {db_prefix}boards AS b ON (b.id_board = lm.id_board)
			LEFT JOIN {db_prefix}topics AS t ON (t.id_topic = lm.id_topic)
			WHERE id_log = {int:log_type}
				AND {raw:modlog_query}'
			. (!empty($query_string) ? '
				AND ' . $query_string : '') . '
		ORDER BY ' . $sort . '
		LIMIT ' . $start . ', ' . $items_per_page,
		array_merge($query_params, array(
			'reg_group_id' => 0,
			'log_type' => $log_type,
			'modlog_query' => $modlog_query,
		))
	);

	// Arrays for decoding objects into.
	$topics = array();
	$boards = array();
	$members = array();
	$messages = array();
	$entries = array();
	while ($row = $smcFunc['db_fetch_assoc']($result))
	{
		$row['extra'] = @unserialize($row['extra']);

		// Corrupt?
		$row['extra'] = is_array($row['extra']) ? $row['extra'] : array();

		// Add on some of the column stuff info
		if (!empty($row['id_board']))
		{
			if ($row['action'] == 'move')
				$row['extra']['board_to'] = $row['id_board'];
			else
				$row['extra']['board'] = $row['id_board'];
		}

		if (!empty($row['id_topic']))
			$row['extra']['topic'] = $row['id_topic'];
		if (!empty($row['id_msg']))
			$row['extra']['message'] = $row['id_msg'];

		// Is this associated with a topic?
		if (isset($row['extra']['topic']))
			$topics[(int) $row['extra']['topic']][] = $row['id_action'];
		if (isset($row['extra']['new_topic']))
			$topics[(int) $row['extra']['new_topic']][] = $row['id_action'];

		// How about a member?
		if (isset($row['extra']['member']))
		{
			// Guests don't have names!
			if (empty($row['extra']['member']))
				$row['extra']['member'] = $txt['modlog_parameter_guest'];
			else
			{
				// Try to find it...
				$members[(int) $row['extra']['member']][] = $row['id_action'];
			}
		}

		// Associated with a board?
		if (isset($row['extra']['board_to']))
			$boards[(int) $row['extra']['board_to']][] = $row['id_action'];
		if (isset($row['extra']['board_from']))
			$boards[(int) $row['extra']['board_from']][] = $row['id_action'];
		if (isset($row['extra']['board']))
			$boards[(int) $row['extra']['board']][] = $row['id_action'];

		// A message?
		if (isset($row['extra']['message']))
			$messages[(int) $row['extra']['message']][] = $row['id_action'];

		// IP Info?
		if (isset($row['extra']['ip_range']))
			if ($seeIP)
				$row['extra']['ip_range'] = '<a href="' . $scripturl . '?action=trackip;searchip=' . $row['extra']['ip_range'] . '">' . $row['extra']['ip_range'] . '</a>';
			else
				$row['extra']['ip_range'] = $txt['logged'];

		// Email?
		if (isset($row['extra']['email']))
			$row['extra']['email'] = '<a href="mailto:' . $row['extra']['email'] . '">' . $row['extra']['email'] . '</a>';

		// Bans are complex.
		if ($row['action'] == 'ban')
		{
			$row['action_text'] = $txt['modlog_ac_ban'];
			foreach (array('member', 'email', 'ip_range', 'hostname') as $type)
				if (isset($row['extra'][$type]))
					$row['action_text'] .= $txt['modlog_ac_ban_trigger_' . $type];
		}

		// The array to go to the template. Note here that action is set to a "default" value of the action doesn't match anything in the descriptions. Allows easy adding of logging events with basic details.
		$entries[$row['id_action']] = array(
			'id' => $row['id_action'],
			'ip' => $seeIP ? $row['ip'] : $txt['logged'],
			'position' => empty($row['real_name']) && empty($row['group_name']) ? $txt['guest'] : $row['group_name'],
			'moderator_link' => $row['id_member'] ? '<a href="' . $scripturl . '?action=profile;u=' . $row['id_member'] . '">' . $row['real_name'] . '</a>' : (empty($row['real_name']) ? ($txt['guest'] . (!empty($row['extra']['member_acted']) ? ' (' . $row['extra']['member_acted'] . ')' : '')) : $row['real_name']),
			'time' => standardTime($row['log_time']),
			'timestamp' => forum_time(true, $row['log_time']),
			'editable' => time() > $row['log_time'] + $context['hoursdisable'] * 3600,
			'extra' => $row['extra'],
			'action' => $row['action'],
			'action_text' => isset($row['action_text']) ? $row['action_text'] : '',
		);
	}
	$smcFunc['db_free_result']($result);

	if (!empty($boards))
	{
		$request = $smcFunc['db_query']('', '
			SELECT id_board, name
			FROM {db_prefix}boards
			WHERE id_board IN ({array_int:board_list})
			LIMIT ' . count(array_keys($boards)),
			array(
				'board_list' => array_keys($boards),
			)
		);
		while ($row = $smcFunc['db_fetch_assoc']($request))
		{
			foreach ($boards[$row['id_board']] as $action)
			{
				// Make the board number into a link - dealing with moving too.
				if (isset($entries[$action]['extra']['board_to']) && $entries[$action]['extra']['board_to'] == $row['id_board'])
					$entries[$action]['extra']['board_to'] = '<a href="' . $scripturl . '?board=' . $row['id_board'] . '.0">' . $row['name'] . '</a>';
				elseif (isset($entries[$action]['extra']['board_from']) && $entries[$action]['extra']['board_from'] == $row['id_board'])
					$entries[$action]['extra']['board_from'] = '<a href="' . $scripturl . '?board=' . $row['id_board'] . '.0">' . $row['name'] . '</a>';
				elseif (isset($entries[$action]['extra']['board']) && $entries[$action]['extra']['board'] == $row['id_board'])
					$entries[$action]['extra']['board'] = '<a href="' . $scripturl . '?board=' . $row['id_board'] . '.0">' . $row['name'] . '</a>';
			}
		}
		$smcFunc['db_free_result']($request);
	}

	if (!empty($topics))
	{
		$request = $smcFunc['db_query']('', '
			SELECT ms.subject, t.id_topic
			FROM {db_prefix}topics AS t
				INNER JOIN {db_prefix}messages AS ms ON (ms.id_msg = t.id_first_msg)
			WHERE t.id_topic IN ({array_int:topic_list})
			LIMIT ' . count(array_keys($topics)),
			array(
				'topic_list' => array_keys($topics),
			)
		);
		while ($row = $smcFunc['db_fetch_assoc']($request))
		{
			foreach ($topics[$row['id_topic']] as $action)
			{
				$this_action = &$entries[$action];

				// This isn't used in the current theme.
				$this_action['topic'] = array(
					'id' => $row['id_topic'],
					'subject' => $row['subject'],
					'href' => $scripturl . '?topic=' . $row['id_topic'] . '.0',
					'link' => '<a href="' . $scripturl . '?topic=' . $row['id_topic'] . '.0">' . $row['subject'] . '</a>'
				);

				// Make the topic number into a link - dealing with splitting too.
				if (isset($this_action['extra']['topic']) && $this_action['extra']['topic'] == $row['id_topic'])
					$this_action['extra']['topic'] = '<a href="' . $scripturl . '?topic=' . $row['id_topic'] . '.' . (isset($this_action['extra']['message']) ? 'msg' . $this_action['extra']['message'] . '#msg' . $this_action['extra']['message'] : '0') . '">' . $row['subject'] . '</a>';
				elseif (isset($this_action['extra']['new_topic']) && $this_action['extra']['new_topic'] == $row['id_topic'])
					$this_action['extra']['new_topic'] = '<a href="' . $scripturl . '?topic=' . $row['id_topic'] . '.' . (isset($this_action['extra']['message']) ? 'msg' . $this_action['extra']['message'] . '#msg' . $this_action['extra']['message'] : '0') . '">' . $row['subject'] . '</a>';
			}
		}
		$smcFunc['db_free_result']($request);
	}

	if (!empty($messages))
	{
		$request = $smcFunc['db_query']('', '
			SELECT id_msg, subject
			FROM {db_prefix}messages
			WHERE id_msg IN ({array_int:message_list})
			LIMIT ' . count(array_keys($messages)),
			array(
				'message_list' => array_keys($messages),
			)
		);
		while ($row = $smcFunc['db_fetch_assoc']($request))
		{
			foreach ($messages[$row['id_msg']] as $action)
			{
				$this_action = &$entries[$action];

				// This isn't used in the current theme.
				$this_action['message'] = array(
					'id' => $row['id_msg'],
					'subject' => $row['subject'],
					'href' => $scripturl . '?msg=' . $row['id_msg'],
					'link' => '<a href="' . $scripturl . '?msg=' . $row['id_msg'] . '">' . $row['subject'] . '</a>',
				);

				// Make the message number into a link.
				if (isset($this_action['extra']['message']) && $this_action['extra']['message'] == $row['id_msg'])
					$this_action['extra']['message'] = '<a href="' . $scripturl . '?msg=' . $row['id_msg'] . '">' . $row['subject'] . '</a>';
			}
		}
		$smcFunc['db_free_result']($request);
	}

	if (!empty($members))
	{
		require_once(SUBSDIR . '/Members.subs.php');
		// Get the latest activated member's display name.
		$result = getBasicMemberData(array_keys($members));
		foreach ($result as $row)
		{
			foreach ($members[$row['id_member']] as $action)
			{
				// Not used currently.
				$entries[$action]['member'] = array(
					'id' => $row['id_member'],
					'name' => $row['real_name'],
					'href' => $scripturl . '?action=profile;u=' . $row['id_member'],
					'link' => '<a href="' . $scripturl . '?action=profile;u=' . $row['id_member'] . '">' . $row['real_name'] . '</a>'
				);
				// Make the member number into a name.
				$entries[$action]['extra']['member'] = '<a href="' . $scripturl . '?action=profile;u=' . $row['id_member'] . '">' . $row['real_name'] . '</a>';
			}
		}
	}

	// Do some formatting of the action string.
	foreach ($entries as $k => $entry)
	{
		// Make any message info links so its easier to go find that message.
		if (isset($entry['extra']['message']) && (empty($entry['message']) || empty($entry['message']['id'])))
			$entries[$k]['extra']['message'] = '<a href="' . $scripturl . '?msg=' . $entry['extra']['message'] . '">' . $entry['extra']['message'] . '</a>';

		// Mark up any deleted members, topics and boards.
		foreach (array('board', 'board_from', 'board_to', 'member', 'topic', 'new_topic') as $type)
			if (!empty($entry['extra'][$type]) && is_numeric($entry['extra'][$type]))
				$entries[$k]['extra'][$type] = sprintf($txt['modlog_id'], $entry['extra'][$type]);

		if (empty($entries[$k]['action_text']))
			$entries[$k]['action_text'] = isset($txt['modlog_ac_' . $entry['action']]) ? $txt['modlog_ac_' . $entry['action']] : $entry['action'];
		$entries[$k]['action_text'] = preg_replace('~\{([A-Za-z\d_]+)\}~ie', 'isset($entries[$k][\'extra\'][\'$1\']) ? $entries[$k][\'extra\'][\'$1\'] : \'\'', $entries[$k]['action_text']);
	}

	// Back we go!
	return $entries;
}

/**
 * Delete logged actions.
 *
 * @param int $type
 * @param int $time
 * @param array $delete
 */
function deleteLogAction($id_log, $time, $delete = null)
{
	global $smcFunc;

	$smcFunc['db_query']('', '
		DELETE FROM {db_prefix}log_actions
		WHERE id_log = {int:moderate_log}
			' . isset($delete) ? 'AND id_action IN ({array_string:delete_actions})' : '' . '
			AND log_time < {int:twenty_four_hours_wait}',
		array(
			'twenty_four_hours_wait' => time() - $time * 3600,
			'delete_actions' => array_unique($delete),
			'moderate_log' => $id_log,
		)
	);
}