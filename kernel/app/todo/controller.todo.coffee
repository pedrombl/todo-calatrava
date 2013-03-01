example ?= {}
example.todo ?= {}

example.todo.controller = ({views, changePage, ajax}) ->

	tasks = []
	count = 0

	addTaskToArray = (taskText) ->
		tasks[count] = taskText
		calatrava.bridge.log "adding todo with input " + count
		calatrava.bridge.log "tasks array: " + tasks
		count++

	renderNewTask = (taskText, id) ->
		views.todoForm.render
			todo_outputs: {
				content: taskText,
				id: id
			}

	taskDone = (id) ->
		calatrava.bridge.log "done " + id

	changeTaskAppearance = (id, checkBox) ->
		if checkBox == "true"
			views.todoForm.render
				disable_task: {
					id: id
				}
		else
			views.todoForm.render
				enable_task: {
					id: id
				}

	taskHandler = (id) ->
		taskDone(id)
		views.todoForm.get 'todo_checkbox' + id, (checkBox) ->
			changeTaskAppearance(id, checkBox)

	addTodo = ->
		views.todoForm.get 'todo_input', (taskText) ->
			id = addTaskToArray(taskText)
			calatrava.bridge.log "todo id added: " + id
			renderNewTask(taskText, id)
			views.todoForm.bind 'todo_checkbox' + id, () -> taskHandler(id)
					


	views.todoForm.bind 'add_todo', addTodo
