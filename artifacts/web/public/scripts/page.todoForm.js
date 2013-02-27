(function() {
  var __hasProp = Object.prototype.hasOwnProperty;

  if (calatrava.pageView == null) calatrava.pageView = {};

  calatrava.pageView.todoForm = function() {
    var $p, $page, renderSection;
    $page = $('#todoForm');
    $p = function(sel) {
      return $(sel, $page);
    };
    renderSection = function(key, data) {
      console.log('rendering section ', key);
      console.log('rendering data ', data);
      return $p("#" + key).text(data);
    };
    return {
      bind: function(event, handler) {
        console.log("event: " + event);
        return $p("#" + event).off('click').on('click', handler);
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
        return $page.find("#" + field).val();
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
