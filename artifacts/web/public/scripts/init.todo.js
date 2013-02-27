(function() {

  if (typeof example === "undefined" || example === null) example = {};

  if (example.todo == null) example.todo = {};

  example.todo.start = function() {
    example.todo.controller({
      views: {
        todoForm: calatrava.bridge.pages.pageNamed("todoForm")
      },
      changePage: calatrava.bridge.changePage,
      ajax: calatrava.bridge.request
    });
    return calatrava.bridge.changePage("todoForm");
  };

}).call(this);
