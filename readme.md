<div align="center">
<h1>Logger</h1>

<p>Lightweight Typescript logger using part of the ReScript code with priority levels</p>
</div>

---

<!-- prettier-ignore-start -->
![ts](https://badgen.net/badge/Built%20With/TypeScript/blue)
![rs](https://badgen.net/badge/Built%20With/ReScript/red)
![license](https://badgen.net/badge/license/MIT/blue)
![release](https://badgen.net//badge/release/0.0.9/orange)


<!-- prettier-ignore-end -->

> Abstraction over using console.log with priority levels

## Installation

This module is distributed via [github npm registry (GitHub Packages)](npm) which is bundled with [node](node) and
should be installed as one of your project's `dependencies`. See more about work with [Github Packages](https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-npm-registry) and [installing a package](https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-npm-registry#installing-a-package):

```
npm install @bipboys/logger
```

## Usage

### Simple Usage (Default Logger)

You can use logger functions directly without creating an instance. By default, all log levels are enabled:

```js
import {error, info, warn, debug, verbose, log, trace} from '@bipboys/logger';

error('test error');
info('test info');
verbose('test verbose');
warn('test warn');
log('test log');
debug('test debug');
trace('test trace');
```

```console
-------------------------------
Priority - DEFAULT
-------------------------------
[ERROR] 52:02.40 default test error
[INFO] 52:02.40 default test info
[VERBOSE] 52:02.40 default test verbose
[WARN] 52:02.40 default test warn
[INFO] 52:02.40 default test log
[DEBUG] 52:02.40 default test debug
[TRACE] 52:02.41 default test trace
```

### Creating Custom Logger Instances

You can create named logger instances for different parts of your application:

```js
import {make, error, info, warn} from '@bipboys/logger';

// Create a logger with specific name and log level
const logger = make('MyApp', 'DEBUG');

// The logger instance contains name and level information
console.log(logger); // { name: 'MyApp', level: 'DEBUG' }
```

This is useful when you want to differentiate log output from different components in your application.

## Priority Levels

The logger supports 6 priority levels from lowest to highest:

1. **VERBOSE** - Most verbose output
2. **DEBUG** - Debugging information
3. **INFO** - General information
4. **WARN** - Warning messages
5. **ERROR** - Error messages
6. **TRACE** - Tracing information

Only messages with priority equal to or higher than the configured level will be displayed.

## Usage with TypeScript

TypeScript types are automatically generated from ReScript code. Import types from the generated file:

```typescript
import type {logLevel, consoleLoggerType} from '@bipboys/logger';
import {make, error, info, warn} from '@bipboys/logger';

const logger: consoleLoggerType = make('MyApp', 'DEBUG');
error('test error');
info('test info');
```

See [the example file](./src/spec/example.test.js) for a complete usage example.
