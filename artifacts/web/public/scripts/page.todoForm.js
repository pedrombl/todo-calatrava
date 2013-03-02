(function() {
  var __hasProp = Object.prototype.hasOwnProperty;

  if (calatrava.pageView == null) calatrava.pageView = {};

  calatrava.pageView.todoForm = function() {
    var $p, $page, addTask, disableTask, enableTask, renderSection, taskElement;
    $page = $('#todoForm');
    $p = function(sel) {
      return $(sel, $page);
    };
    taskElement = function(task) {
      var new_task_checkbox, new_task_div, new_task_text;
      new_task_div = document.createElement('div');
      new_task_div.id = "task_" + task.id;
      new_task_text = document.createElement('span');
      new_task_text.textContent = task.content;
      new_task_div.appendChild(new_task_text);
      new_task_checkbox = document.createElement('input');
      new_task_checkbox.type = "checkbox";
      new_task_checkbox.id = "task_checkbox_" + task.id;
      new_task_div.appendChild(new_task_checkbox);
      return new_task_div;
    };
    addTask = function(data) {
      return $p("#tasks").append(taskElement(data));
    };
    disableTask = function(data) {
      return $p("#task_" + data.id).css("text-decoration", "line-through");
    };
    enableTask = function(data) {
      return $p("#task_" + data.id).css("text-decoration", "none");
    };
    renderSection = function(key, data) {
      console.log('rendering section ', key);
      console.log('rendering data ', data);
      switch (key) {
        case 'new_task':
          return addTask(data);
        case 'disable_task':
          return disableTask(data);
        case 'enable_task':
          return enableTask(data);
      }
    };
    return {
      bind: function(event, handler) {
        console.log("event: ", event);
        if (event === 'add_task') {
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
        console.log('getting...', field);
        if (field.match(/task_checkbox_/)) {
          return $page.find("#" + field).prop('checked');
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
