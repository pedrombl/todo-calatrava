example ?= {}
example.todo ?= {}

example.todo.controller = ({views, changePage, ajax}) ->
	addTodo = ->
		views.todoForm.get 'todo_input', (todoInput) ->
			views.todoForm.render
				todo_output: todoInput

	views.todoForm.bind 'add_todo', addTodo

	views.todoForm.render
		todo_output: "nothing..."
