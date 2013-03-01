calatrava.pageView ?= {}

calatrava.pageView.todoForm = ->

	$page = $('#todoForm')
	$p = (sel)-> $(sel, $page)

	todoOutputElement = (data) ->
		div_new_todo = document.createElement 'div'
		div_new_todo.id = "todo_" + data.id

		new_todo = document.createElement 'span'
		new_todo.textContent = data.content
		div_new_todo.appendChild(new_todo)

		checkbox_new_todo = document.createElement 'input'
		checkbox_new_todo.type = "checkbox"
		checkbox_new_todo.id = "todo_checkbox" + data.id
		div_new_todo.appendChild(checkbox_new_todo)
		div_new_todo
		

	addTodoOutput = (data) ->
		$p("#todo_outputs").append todoOutputElement(data)

	disableTask = (data) ->
		$p("#todo_" + data.id).css("text-decoration", "line-through")

	enableTask = (data) ->
		$p("#todo_" + data.id).css("text-decoration", "none")

	renderSection = (key, data)->
		console.log('rendering section ', key)
		console.log('rendering data ', data)
		switch key
			when 'todo_outputs' then addTodoOutput data
			when 'disable_task' then disableTask data
			when 'enable_task' then enableTask data
	
	bind: (event, handler) ->
		console.log "event: ", event
		if event == 'add_todo'
			console.log "add todo handler"
			$p("#" + event).off('click').on 'click', handler
		else
			$p("#" + event).off('change').on 'change', handler

	render: (message) ->
		console.log('rendering...', message)
		renderSection(section, data) for own section,data of message

	get: (field) ->
		console.log('getting...', field)
		if field.match(/todo_checkbox/)
			checked = $page.find("#" + field).prop('checked')
			console.log "checked? ", checked
			checked
		else
			$page.find("#" + field).val()

	show: -> console.log('showing...')
	hide: -> console.log('hiding...')
