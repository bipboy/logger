/* TypeScript file generated from Logger.res by genType. */

/* eslint-disable */
/* tslint:disable */

import * as LoggerJS from './Logger.res.js';

import type {Json_t as Js_Json_t} from '../../src/res/shims/Js.shim';

export type logLevel = 
    "VERBOSE"
  | "DEBUG"
  | "INFO"
  | "WARN"
  | "ERROR"
  | "TRACE";

export type consoleLoggerType = { readonly name: string; readonly level: logLevel };

export const make: (name:string, level:(undefined | string), _3:void) => consoleLoggerType = LoggerJS.make as any;

export const info: (msg:Js_Json_t[]) => void = LoggerJS.info as any;

export const warn: (msg:Js_Json_t[]) => void = LoggerJS.warn as any;

export const error: (msg:Js_Json_t[]) => void = LoggerJS.error as any;

export const debug: (msg:Js_Json_t[]) => void = LoggerJS.debug as any;

export const verbose: (msg:Js_Json_t[]) => void = LoggerJS.verbose as any;

export const log: (msg:Js_Json_t[]) => void = LoggerJS.log as any;

export const trace: (msg:Js_Json_t[]) => void = LoggerJS.trace as any;
