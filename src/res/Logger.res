@genType
type logLevel =
  | VERBOSE
  | DEBUG
  | INFO
  | WARN
  | ERROR
  | TRACE

let levelToValue = (level: logLevel): int => {
  switch level {
  | VERBOSE => 1
  | DEBUG => 2
  | INFO => 3
  | WARN => 4
  | ERROR => 5
  | TRACE => 6
  }
}

let levelFromString = (str: string): option<logLevel> => {
  switch Js.String.toUpperCase(str) {
  | "VERBOSE" => Some(VERBOSE)
  | "DEBUG" => Some(DEBUG)
  | "INFO" => Some(INFO)
  | "WARN" => Some(WARN)
  | "ERROR" => Some(ERROR)
  | "TRACE" => Some(TRACE)
  | _ => None
  }
}

let levelToString = (level: logLevel): string => {
  switch level {
  | VERBOSE => "VERBOSE"
  | DEBUG => "DEBUG"
  | INFO => "INFO"
  | WARN => "WARN"
  | ERROR => "ERROR"
  | TRACE => "TRACE"
  }
}

module type Logger = {
  type t
  let make: (~name: string, ~level: string=?, unit) => t

  @variadic let log: (t, array<Js.Json.t>) => unit
  @variadic let info: (t, array<Js.Json.t>) => unit
  @variadic let warn: (t, array<Js.Json.t>) => unit
  @variadic let error: (t, array<Js.Json.t>) => unit
  @variadic let debug: (t, array<Js.Json.t>) => unit
  @variadic let verbose: (t, array<Js.Json.t>) => unit
  @variadic let trace: (t, array<Js.Json.t>) => unit
}

@genType
type consoleLoggerType = {
  name: string,
  level: logLevel,
}

module ConsoleLoggerInternal: Logger = {
  type t = consoleLoggerType

  let globalLogLevel: ref<option<logLevel>> = ref(None)

  let getEffectiveLevel = (loggerLevel: logLevel): logLevel => {
    switch globalLogLevel.contents {
    | Some(globalLevel) => globalLevel
    | None => loggerLevel
    }
  }

  @val @scope("console") @variadic
  external logInternal: array<Js.Json.t> => unit = "log"

  @val @scope("console") @variadic
  external warnInternal: array<Js.Json.t> => unit = "warn"

  @val @scope("console") @variadic
  external errorInternal: array<Js.Json.t> => unit = "error"

  @variadic
  let _log = (logger: t, typeLevel: logLevel, msg: array<Js.Json.t>): unit => {
    let effectiveLoggerLevel = getEffectiveLevel(logger.level)

    if levelToValue(typeLevel) >= levelToValue(effectiveLoggerLevel) {
      let logFn = switch typeLevel {
      | ERROR => errorInternal
      | WARN => warnInternal
      | _ => logInternal
      }

      let prefix = Prefix.prefixFn(~logLevelsType=levelToString(typeLevel), ~name=logger.name)

      switch msg->Js.Array2.length {
      | 0 => logFn([Js.Json.string(prefix)])
      | 1 =>
        // `log(prefix, msg[0]);`
        logFn([Js.Json.string(prefix), Belt.Array.getExn(msg, 0)])
      | _n =>
        // `log(prefix, msg);`
        logFn(Js.Array2.concat([Js.Json.string(prefix)], msg))
      }
    }
  }

  let make = (~name: string, ~level="DEBUG", ()): t => {
    level: levelFromString(level)->Belt.Option.getWithDefault(DEBUG),
    name,
  }

  let log = (logger: t, msg: array<Js.Json.t>) => {
    _log(logger, INFO, msg)
  }

  let info = (logger: t, msg: array<Js.Json.t>) => {
    _log(logger, INFO, msg)
  }

  let warn = (logger: t, msg: array<Js.Json.t>) => {
    _log(logger, WARN, msg)
  }

  let error = (logger: t, msg: array<Js.Json.t>) => {
    _log(logger, ERROR, msg)
  }

  let debug = (logger: t, msg: array<Js.Json.t>) => {
    _log(logger, DEBUG, msg)
  }

  let verbose = (logger: t, msg: array<Js.Json.t>) => {
    _log(logger, VERBOSE, msg)
  }

  let trace = (logger: t, msg: array<Js.Json.t>) => {
    _log(logger, TRACE, msg)
  }
}

@genType
let make = (~name: string, ~level="DEBUG", ()): consoleLoggerType => {
  ConsoleLoggerInternal.make(~name, ~level, ())->Obj.magic
}

@genType @variadic
let info = (msg: array<Js.Json.t>) => {
  let defaultLogger = make(~name="default", ~level="VERBOSE", ())
  ConsoleLoggerInternal.info(defaultLogger->Obj.magic, msg)
}

@genType @variadic
let warn = (msg: array<Js.Json.t>) => {
  let defaultLogger = make(~name="default", ~level="VERBOSE", ())
  ConsoleLoggerInternal.warn(defaultLogger->Obj.magic, msg)
}

@genType @variadic
let error = (msg: array<Js.Json.t>) => {
  let defaultLogger = make(~name="default", ~level="VERBOSE", ())
  ConsoleLoggerInternal.error(defaultLogger->Obj.magic, msg)
}

@genType @variadic
let debug = (msg: array<Js.Json.t>) => {
  let defaultLogger = make(~name="default", ~level="VERBOSE", ())
  ConsoleLoggerInternal.debug(defaultLogger->Obj.magic, msg)
}

@genType @variadic
let verbose = (msg: array<Js.Json.t>) => {
  let defaultLogger = make(~name="default", ~level="VERBOSE", ())
  ConsoleLoggerInternal.verbose(defaultLogger->Obj.magic, msg)
}

@genType @variadic
let log = (msg: array<Js.Json.t>) => {
  let defaultLogger = make(~name="default", ~level="VERBOSE", ())
  ConsoleLoggerInternal.log(defaultLogger->Obj.magic, msg)
}

@genType @variadic
let trace = (msg: array<Js.Json.t>) => {
  let defaultLogger = make(~name="default", ~level="VERBOSE", ())
  ConsoleLoggerInternal.trace(defaultLogger->Obj.magic, msg)
}
