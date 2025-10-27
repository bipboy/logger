import {
  error,
  info,
  verbose,
  warn,
  log,
  debug,
  trace,
  make
} from '../../lib/index.js';

function separator(title) {
  console.log('\n========================================');
  console.log(`  ${title}`);
  console.log('========================================\n');
}

// 1. All log levels
separator('1. All log levels');
error('test error');
info('test info');
verbose('test verbose');
warn('test warn');
debug('test debug');
trace('test trace');
log('test log');

// 2. Different data types
separator('2. Different data types');
const obj = {key: 'value', nested: {num: 42}};
const arr = [1, 2, 3];
debug('Object:', obj);
debug('Array:', arr);
debug('Number:', 42);
debug('Boolean:', true, false);
debug('Mixed:', 'string', 123, obj);

// 3. Special values
separator('3. Special values');
debug(null);
debug(undefined);
error(null);
info(undefined);

// 4. Custom logger
separator('4. Custom logger');
const customLogger = make('MyApp', 'ERROR');
console.log('Logger instance:', customLogger);

// 5. Multiple arguments
separator('5. Multiple arguments');
info('Arg1', 'Arg2', 'Arg3');
error('Error:', 'Something went wrong', {code: 500});
warn('Warning:', {severity: 'high'}, 'Check this');

// 6. Objects and nested structures
separator('6. Complex objects');
const complexObj = {
  user: {
    id: 1,
    name: 'John',
    tags: ['admin', 'user']
  },
  timestamp: new Date().toISOString()
};
debug('Complex object:', complexObj);
info('API Response:', {status: 200, data: complexObj});

// 7. Different combinations
separator('7. Combinations');
debug('String + Object:', 'User data', complexObj);
warn('Number + String:', 404, 'Not Found');
error('Error code:', 500, 'Internal Server Error', {stack: 'at...'});

console.log('\n✅ All tests completed!\n');
