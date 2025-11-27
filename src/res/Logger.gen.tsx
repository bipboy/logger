/* TypeScript file generated from Logger.res by genType. */

/* eslint-disable */
/* tslint:disable */

import * as LoggerJS from './Logger.res.js';

export type logLevel = 
    "VERBOSE"
  | "DEBUG"
  | "INFO"
  | "WARN"
  | "ERROR"
  | "TRACE";

export type consoleLoggerType = { readonly name: string; readonly level: logLevel };

export const make: (name:string, level:(undefined | string), _3:void) => consoleLoggerType = LoggerJS.make as any;

export const info: (msg:unknown[]) => void = LoggerJS.info as any;

export const warn: (msg:unknown[]) => void = LoggerJS.warn as any;

export const error: (msg:unknown[]) => void = LoggerJS.error as any;

export const debug: (msg:unknown[]) => void = LoggerJS.debug as any;

export const verbose: (msg:unknown[]) => void = LoggerJS.verbose as any;

export const log: (msg:unknown[]) => void = LoggerJS.log as any;

export const trace: (msg:unknown[]) => void = LoggerJS.trace as any;
