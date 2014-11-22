<?php

/**
 * Handle events in controller and classes
 *
 * @name      ElkArte Forum
 * @copyright ElkArte Forum contributors
 * @license   BSD http://opensource.org/licenses/BSD-3-Clause
 *
 * @version 1.1 alpha 1
 */

class Event_Manager
{
	/**
	 * An array of events, each entry is a different position.
	 * @var object[] Event
	 */
	protected $_registered_events = array();

	/**
	 * The current hook.
	 * @var string
	 */
	protected $_hook = '';

	/**
	 * All the declared classes present at the moment the Event_Manager
	 * is instantiated.
	 * @var string[]
	 */
	protected $_declared_classes = array();

	/**
	 * Instances of addons already loaded.
	 * @var object[]
	 */
	protected $_instances = array();

	/**
	 * List of classes already registered.
	 * @var string[]
	 */
	protected $_classes = array();

	/**
	 * To instantiate the class a "hook" must be specified.
	 *
	 * @param string $hook Usually is the first part of the name of the
	 *               controller, without "_Controller" and lowercase
	 */
	public function __construct($hook)
	{
		$this->_hook = $hook;
		$this->_declared_classes = get_declared_classes();
	}

	/**
	 * Allows to set the object that instantiated the Event_Manager.
	 * Necessary in order to be able to provide the dependencies later on
	 *
	 * @param object $source The controller that instantiated the Event_Manager
	 */
	public function setSource($source)
	{
		$this->_source = $source;
	}

	/**
	 * This is the function use to... trigger an event.
	 *
	 * @param string $position The "identifier" of the event.
	 * @param mixed[] $args The arguments passed to the methods registered
	 */
	public function trigger($position, $args = array())
	{
		if (!isset($this->_registered_events[$position]))
			return;

		if (!$this->_registered_events[$position]->hasEvents())
			return;

		foreach ($this->_registered_events[$position]->getEvents() as $event)
		{
			$class = $event[1];
			$class_name = $class[0];
			$method_name = $class[1];
			$deps = isset($event[2]) ? $event[2] : array();
			unset($dependencies);

			if (!class_exists($class_name))
				return;

			// Any dependecy you want? In any order you want!
			if (!empty($deps))
			{
				foreach ($deps as $dep)
				{
					if (array_key_exists($dep, $args))
						$dependencies[$dep] = &$args[$dep];
					else
						$this->_source->provideDependencies($dep, $dependencies);
				}
			}
			else
				$dependencies = &$args;

			$instance = $this->_getInstance($class_name);

			// Do what we know we should do... if we find it.
			if (method_exists($instance, $method_name))
			{
				if (empty($dependencies))
				{
					call_user_func(array($instance, $method_name));
				}
				else
				{
					call_user_func_array(array($instance, $method_name), $dependencies);
				}
			}
		}
	}

	/**
	 * Retrieves or creates the instance of an object.
	 * Objects are stored in oredr to be shared between different triggers
	 * in the same Event_Manager.
	 * If the object doesn't exist yet, it is created
	 *
	 * @param string $class_name The name of the class.
	 * @return An instance of the class requested.
	 */
	protected function _getInstance($class_name)
	{
		if (isset($this->_instances[$class_name]))
		{
			return $this->_instances[$class_name];
		}
		else
		{
			$instance = new $class_name();
			$this->_setInstance($class_name, $instance);

			return $instance;
		}
	}

	/**
	 * Stores the instance of a class created by _getInstance.
	 *
	 * @param string $class_name The name of the class.
	 * @param object $instance The object.
	 */
	protected function _setInstance($class_name, $instance)
	{
		if (!isset($this->_instances[$class_name]))
			$this->_instances[$class_name] = $instance;
	}

	/**
	 * Registers an event at a certain position with a defined priority.
	 *
	 * @param string $position The position at which the event will be triggered
	 * @param mixed[] $event An array describing the event we want to trigger:
	 *                   array(
	 *                     0 => string - the position at which the event will be triggered
	 *                     1 => string[] - the class and method we want to call:
	 *                         array(
	 *                           0 => string - name of the class to instantiate
	 *                           1 => string - name of the method to call
	 *                         )
	 *                     2 => null|string[] - an array of dependencies in the
	 *                                          form of strings representing the
	 *                                          name of the variables the method
	 *                                          requires.
	 *                                          The variables can be from:
	 *                                            - the default list of variables passed
	 *                                              to the trigger
	 *                                            - properties (private, protected,
	 *                                              or public) of the object that
	 *                                              instantiate the Event_Manager
	 *                                              (i.e. the controller)
	 *                                            - globals
	 *                   )
	 * @param int $priority Defines the order the method is called.
	 */
	public function register($position, $event, $priority = 0)
	{
		if (!isset($this->_registered_events[$position]))
			$this->_registered_events[$position] = new Event(new Priority());

		$this->_registered_events[$position]->add($event, $priority);
	}

	/**
	 * Loads addons and modules based on a pattern.
	 * The pattern defines the names of the classes that will be registered
	 * to this Event_Manager.
	 *
	 * @param string $pattern A regular expression that identifies the classes
	 *               that should be attached to the Event_Manager
	 */
	public function registerAddons($pattern)
	{
		$to_register = array();

		foreach ($this->_declared_classes as $class)
		{
			if (preg_match('/' . $pattern . '/', $class) !== 0 && !in_array($class, $this->_classes))
			{
				$to_register[] = $class;
				$this->_classes[] = $class;
			}
		}
		$this->_register_events($to_register);
	}

	/**
	 * Takes care of registering the classes/methods to the different positions
	 * of the Event_Manager.
	 * Each classes must have a static method hooks that will return an array
	 * defining where and how the class will interact with the object that
	 * started the Event_Manager.
	 *
	 * @param string[] $classes A list of class names.
	 */
	protected function _register_events($classes)
	{
		foreach ($classes as $class)
		{
			$events = $class::hooks();

			foreach ($events as $event)
			{
				$priority = isset($event[1][2]);
				$position = $event[0];

				$this->register($position, $event, $priority);
			}
		}
	}
}
