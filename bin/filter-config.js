var fs = require('fs');
var _ = require('underscore')

var config = JSON.parse(fs.readFileSync(process.argv[2], { encoding: 'utf8' }));
if (process.argv.length > 3) {
  config = _.pick.apply(_, [config].concat(process.argv.slice(3)));
}
console.log(JSON.stringify(config));
