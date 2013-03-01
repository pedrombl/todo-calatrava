example ?= {}
example.todo ?= {}

example.todo.controller = ({views, changePage, ajax}) ->

	todos = []
	count = 0

	addTodoToArray = (todoInput) ->
		todos[count] = todoInput
		calatrava.bridge.log "adding todo with input " + count
		calatrava.bridge.log "todos array: " + todos
		count++

	todoDone = (id) ->
		calatrava.bridge.log "done " + id

	addTodo = ->
		views.todoForm.get 'todo_input', (todoInput) ->
			id = addTodoToArray(todoInput)
			calatrava.bridge.log "todo id added: " + id
			views.todoForm.render
				todo_outputs: {
					content: todoInput,
					id: id
				}
			views.todoForm.bind 'todo_checkbox' + id, () ->
				todoDone(id)
				views.todoForm.get 'todo_checkbox' + id, (checkBox) ->
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
					


	views.todoForm.bind 'add_todo', addTodo
