(function() {
  var __hasProp = Object.prototype.hasOwnProperty;

  if (calatrava.pageView == null) calatrava.pageView = {};

  calatrava.pageView.todoForm = function() {
    var $p, $page, addTodoOutput, disableTask, enableTask, renderSection, todoOutputElement;
    $page = $('#todoForm');
    $p = function(sel) {
      return $(sel, $page);
    };
    todoOutputElement = function(data) {
      var checkbox_new_todo, div_new_todo, new_todo;
      div_new_todo = document.createElement('div');
      div_new_todo.id = "todo_" + data.id;
      new_todo = document.createElement('span');
      new_todo.textContent = data.content;
      div_new_todo.appendChild(new_todo);
      checkbox_new_todo = document.createElement('input');
      checkbox_new_todo.type = "checkbox";
      checkbox_new_todo.id = "todo_checkbox" + data.id;
      div_new_todo.appendChild(checkbox_new_todo);
      return div_new_todo;
    };
    addTodoOutput = function(data) {
      return $p("#todo_outputs").append(todoOutputElement(data));
    };
    disableTask = function(data) {
      return $p("#todo_" + data.id).css("text-decoration", "line-through");
    };
    enableTask = function(data) {
      return $p("#todo_" + data.id).css("text-decoration", "none");
    };
    renderSection = function(key, data) {
      console.log('rendering section ', key);
      console.log('rendering data ', data);
      switch (key) {
        case 'todo_outputs':
          return addTodoOutput(data);
        case 'disable_task':
          return disableTask(data);
        case 'enable_task':
          return enableTask(data);
      }
    };
    return {
      bind: function(event, handler) {
        console.log("event: ", event);
        if (event === 'add_todo') {
          console.log("add todo handler");
          return $p("#" + event).off('click').on('click', handler);
        } else {
          return $p("#" + event).off('change').on('change', handler);
        }
      },
      render: function(message) {
        var data, section, _results;
        console.log('rendering...', message);
        _results = [];
        for (section in message) {
          if (!__hasProp.call(message, section)) continue;
          data = message[section];
          _results.push(renderSection(section, data));
        }
        return _results;
      },
      get: function(field) {
        var checked;
        console.log('getting...', field);
        if (field.match(/todo_checkbox/)) {
          checked = $page.find("#" + field).prop('checked');
          console.log("checked? ", checked);
          return checked;
        } else {
          return $page.find("#" + field).val();
        }
      },
      show: function() {
        return console.log('showing...');
      },
      hide: function() {
        return console.log('hiding...');
      }
    };
  };

}).call(this);
