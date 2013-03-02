(function() {

  if (typeof example === "undefined" || example === null) example = {};

  if (example.todo == null) example.todo = {};

  example.todo.controller = function(_arg) {
    var addTaskToArray, addTodo, ajax, changePage, changeTaskAppearance, count, renderNewTask, taskDone, taskHandler, tasks, views;
    views = _arg.views, changePage = _arg.changePage, ajax = _arg.ajax;
    tasks = [];
    count = 0;
    addTaskToArray = function(taskText) {
      tasks[count] = taskText;
      calatrava.bridge.log("adding task with input " + count);
      calatrava.bridge.log("tasks array: " + tasks);
      return count++;
    };
    renderNewTask = function(taskText, id) {
      return views.todoForm.render({
        new_task: {
          content: taskText,
          id: id
        }
      });
    };
    taskDone = function(id) {
      return calatrava.bridge.log("done " + id);
    };
    changeTaskAppearance = function(id, checkBox) {
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
    };
    taskHandler = function(id) {
      taskDone(id);
      return views.todoForm.get('task_checkbox_' + id, function(checkBox) {
        return changeTaskAppearance(id, checkBox);
      });
    };
    addTodo = function() {
      return views.todoForm.get('task_input', function(taskText) {
        var id;
        id = addTaskToArray(taskText);
        calatrava.bridge.log("todo id added: " + id);
        renderNewTask(taskText, id);
        return views.todoForm.bind('task_checkbox_' + id, function() {
          return taskHandler(id);
        });
      });
    };
    return views.todoForm.bind('add_task', addTodo);
  };

}).call(this);
