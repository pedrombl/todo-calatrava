(function() {

  if (typeof example === "undefined" || example === null) example = {};

  if (example.todo == null) example.todo = {};

  example.todo.controller = function(_arg) {
    var addTodo, ajax, changePage, views;
    views = _arg.views, changePage = _arg.changePage, ajax = _arg.ajax;
    addTodo = function() {
      return views.todoForm.get('todo_input', function(todoInput) {
        return views.todoForm.render({
          todo_output: todoInput
        });
      });
    };
    views.todoForm.bind('add_todo', addTodo);
    return views.todoForm.render({
      todo_output: "nothing..."
    });
  };

}).call(this);
