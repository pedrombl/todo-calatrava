calatrava.pageView ?= {}

calatrava.pageView.todoForm = ->

	$page = $('#todoForm')
	$p = (sel)-> $(sel, $page)

	taskElement = (task) ->
		new_task_div = document.createElement 'div'
		new_task_div.id = "task_" + task.id

		new_task_text = document.createElement 'span'
		new_task_text.textContent = task.content
		new_task_div.appendChild(new_task_text)

		new_task_checkbox = document.createElement 'input'
		new_task_checkbox.type = "checkbox"
		new_task_checkbox.id = "task_checkbox_" + task.id
		new_task_div.appendChild(new_task_checkbox)
		new_task_div
		

	addTask = (data) ->
		$p("#tasks").append taskElement(data)

	disableTask = (data) ->
		$p("#task_" + data.id).css("text-decoration", "line-through")

	enableTask = (data) ->
		$p("#task_" + data.id).css("text-decoration", "none")

	renderSection = (key, data)->
		console.log('rendering section ', key)
		console.log('rendering data ', data)
		switch key
			when 'new_task' then addTask data
			when 'disable_task' then disableTask data
			when 'enable_task' then enableTask data
	
	bind: (event, handler) ->
		console.log "event: ", event
		if event == 'add_task'
			$p("#" + event).off('click').on 'click', handler
		else
			$p("#" + event).off('change').on 'change', handler

	render: (message) ->
		console.log('rendering...', message)
		renderSection(section, data) for own section,data of message

	get: (field) ->
		console.log('getting...', field)
		if field.match(/task_checkbox_/)
			$page.find("#" + field).prop('checked')
		else
			$page.find("#" + field).val()

	show: -> console.log('showing...')
	hide: -> console.log('hiding...')
