import {
  error,
  info,
  verbose,
  warn,
  log,
  debug,
  trace
} from '../res/Logger.bs.js';

function testPriority(name) {
  console.log('-------------------------------');
  console.log(`Priority - ${name}`);
  console.log('-------------------------------');
}

testPriority('DEFAULT');
error('test error');
info('test info');
verbose('test verbose');
warn('test warn');
info('test log');
debug('test debug');
trace('test trace');
