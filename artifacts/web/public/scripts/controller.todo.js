(function() {

  if (typeof example === "undefined" || example === null) example = {};

  if (example.todo == null) example.todo = {};

  example.todo.controller = function(_arg) {
    var addTodo, addTodoToArray, ajax, changePage, count, todoDone, todos, views;
    views = _arg.views, changePage = _arg.changePage, ajax = _arg.ajax;
    todos = [];
    count = 0;
    addTodoToArray = function(todoInput) {
      todos[count] = todoInput;
      calatrava.bridge.log("adding todo with input " + count);
      calatrava.bridge.log("todos array: " + todos);
      return count++;
    };
    todoDone = function(id) {
      return calatrava.bridge.log("done " + id);
    };
    addTodo = function() {
      return views.todoForm.get('todo_input', function(todoInput) {
        var id;
        id = addTodoToArray(todoInput);
        calatrava.bridge.log("todo id added: " + id);
        views.todoForm.render({
          todo_outputs: {
            content: todoInput,
            id: id
          }
        });
        return views.todoForm.bind('todo_checkbox' + id, function() {
          todoDone(id);
          return views.todoForm.get('todo_checkbox' + id, function(checkBox) {
            if (checkBox === "true") {
              return views.todoForm.render({
                disable_task: {
                  id: id
                }
              });
            } else {
              return views.todoForm.render({
                enable_task: {
                  id: id
                }
              });
            }
          });
        });
      });
    };
    return views.todoForm.bind('add_todo', addTodo);
  };

}).call(this);
