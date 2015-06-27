var message = {
  debug: true,
  message: 'TEST'
};

var Q = require('q');
(new Q.Promise(function(resolve, reject) {
  var context = {
    succeed: function(msg) { resolve(msg); },
    fail: function(err) { reject(err); },
    done: function(msg, err) {
      if (err == null) { resolve(msg); } else { reject(err); }
    }
  };
  require('./build/main.js').handler(message, context);
})).then(function(msg) {
  console.info("INFO: Execution complete successfully.");
  console.info(msg);
}).fail(function(err) {
  console.error("ERROR: Failed to execute handler...");
  console.error(err);
});
