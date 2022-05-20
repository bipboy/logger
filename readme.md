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

It couldn't be easier! You create an instance of a class with a name and the required priority. Then you call the required method to output the logging message to the console. The message will be displayed in the format shown below.

```js
// default level
const log = new ConsoleLogger('Example Log');

log.error('test error');
log.info('test info');
log.verbose('test verbose');
log.warn('test warn');
log.log('test log');
log.debug('test debug');
log.trace('test trace');
```

```console
-------------------------------
Priority - DEFAULT
-------------------------------
[ERROR] 46:04.704 Example Log - test error
[INFO] 46:04.705 Example Log - test info
[WARN] 46:04.706 Example Log - test warn
[INFO] 46:04.706 Example Log - test log
[DEBUG] 46:04.706 Example Log - test debug
[TRACE] 46:04.707 Example Log - test trace
```

Displays messages with the specified priority and higher to the console

```js
// error level
log = new ConsoleLogger('Example Log', 'ERROR');

log.error('test error');
log.info('test info');
log.verbose('test verbose');
log.warn('test warn');
log.log('test log');
log.debug('test debug');
log.trace('test trace');
```

```console
-------------------------------
Priority - ERROR
-------------------------------
[ERROR] 46:04.707 Example Log - test error
[TRACE] 46:04.707 Example Log - test trace
```

## Priority Levels

> 1. VERBOSE
> 2. DEBUG
> 3. INFO
> 4. WARN
> 5. ERROR
> 6. TRACE

## Usage with TypeScript

See [the typescript usage example](./src/spec/example.test.ts)
