<html>
<head>
<link href="PLUGINS_ROOT/org.robotframework.ide.eclipse.main.plugin.doc.user/help/style.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<a href="RED/../../../../help/index.html">RED - Robot Editor User Guide</a> &gt; <a href="RED/../../../../help/user_guide/user_guide.html">User guide</a> &gt; <a href="RED/../../../../help/user_guide/launching.html">Launching Tests</a> &gt; 
	<h2>RED Agent</h2>
<p>RED Tests Runner Agent is something of which you should be aware if you're planning 
	to <a href="remote_launch.html">launch tests using remote configuration</a> or if you're 
	<a href="local_launch_scripting.html">writing own script</a> which will run the tests in 
	local configuration. The agent is a python script which should be attached to test execution as a listener (see 
	<a class="external" href="http://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#listener-interface" target="_blank">
	Listener interface
	</a> topic in RF User Guide).
	</p>
<p>Agent is responsible for listening to execution events happening in running tests, so without agent
	both <b>Message Log</b> and <b>Execution</b> views will not work. The script is also responsible for
	stopping/resuming tests on breakpoints, so RED debugging capabilities also only work when agent 
	was injected into tests execution.
	</p>
<h3>Obtaining agent script</h3>
<p>You can always obtain agent script from RED within Preferences dialog
	(at <code><a class="command" href="javascript:executeCommand('org.eclipse.ui.window.preferences(preferencePageId=org.robotframework.ide.eclipse.main.plugin.preferences.launch.default)')">
	Window -> Preferences -> Robot Framework -> Default Launch Configurations
	</a></code>, use <b>Export Client Script</b> button). Additionally the file may be saved
	straight from launch configuration dialog.
	</p>
<dl class="warning">
<dt>Warning</dt>
<dd>Agent script is a subject of changes, so it may happen that script exported from RED version
	   <code>x</code> is not able to work properly with RED version <code>y</code> and 
	   vice versa. From version <code>0.7.6</code> onwards both script and RED are checking and handling
	   this when establishing connection, so you will be notified. <b>Important</b>: script taken from RED older than 
	   <code>0.7.6</code> will not work with newer RED and vice-versa without notifying you
	   (possibly even hanging infinitely).
	   </dd>
</dl>
<h3 id="command_line_usage">Taking agent into Robot Tests execution</h3>
<p>Agent script have to be injected into Robot tests using 
	<a class="external" href="http://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#listener-interface" target="_blank">
	listeners mechanism</a>. When starting Robot execution pass the listener as follows:
	</p>
<div class="code"><code>
<i>robot</i> --listener /path/to/script/TestRunnerAgent.py:ARG1:ARG2:ARG3 <i>other_arguments</i>
</code></div>
<p>Agent script can take up to 3 arguments which are added to script path after colon (<b>:</b>) separator, 
	the arguments themselves are also separated with a colon (<b>:</b>). The arguments are:
	</p>
<ul>
<li><b>HOST</b> - IP number of a server to which agent should connect and send execution data,
		<li><b>PORT</b> - port number of a server,
		<li><b>TIMEOUT</b> - when connecting to server agent will try to connect as long as the timeout is reached
		(in seconds)  
		</li>
</li></li></ul>
<ul>
<li>
			When script is used with only one parameter it has to be the <b>PORT</b> number:
			<div class="code"><code>
<i>robot</i> --listener /path/to/script/TestRunnerAgent.py:12345 <i>other_arguments</i>
</code></div>
			in this case <code>HOST=localhost</code>, <code>PORT=12345</code> and <code>TIMEOUT=30</code><p></p>
</li>
<li>
			When script is used with two parameters it has to be the <b>HOST</b> and <b>PORT</b>
			number (in this order):
			<div class="code"><code>
<i>robot</i> --listener /path/to/script/TestRunnerAgent.py:192.168.0.5:54321 <i>other_arguments</i>
</code></div>
			in this case <code>HOST=192.168.0.5</code>, <code>PORT=54321</code> and <code>TIMEOUT=30</code><p></p>
</li>
<li>
			When script is used with three parameters it all of them has to be defined (in <b>HOST</b>, <b>PORT</b>, 
			<b>TIMEOUT</b> order):
			<div class="code"><code>
<i>robot</i> --listener /path/to/script/TestRunnerAgent.py:192.168.0.7:12321:60 <i>other_arguments</i>
</code></div>
			in this case <code>HOST=192.168.0.7</code>, <code>PORT=12321</code> and <code>TIMEOUT=60</code>
</li>
</ul>
<br/>
<br/>
</body>
</html>