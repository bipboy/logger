import { ConsoleLogger, LoggerI } from "../logger";

function testPriority(name) {
  console.log("-------------------------------");
  console.log(`Priority - ${name}`);
  console.log("-------------------------------");
}

let log: LoggerI = new ConsoleLogger("Example Log");

testPriority("DEFAULT");
log.error("test error");
log.info("test info");
log.verbose("test verbose");
log.warn("test warn");
log.log("test log");
log.debug("test debug");
log.trace("test trace");

log = new ConsoleLogger("Example Log", "ERROR");

testPriority("ERROR");
log.error("test error");
log.info("test info");
log.verbose("test verbose");
log.warn("test warn");
log.log("test log");
log.debug("test debug");
log.trace("test trace");
