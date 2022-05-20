/* TypeScript file generated from index.res by genType. */
/* eslint-disable import/first */


// @ts-ignore: Implicit any on import
import * as Curry__Es6Import from 'rescript/lib/es6/curry.js';
const Curry: any = Curry__Es6Import;

// @ts-ignore: Implicit any on import
import * as indexBS__Es6Import from './index.bs';
const indexBS: any = indexBS__Es6Import;

export const prefixFn: (_1:{ readonly logLevelsType: string; readonly name: string }) => string = function (Arg1: any) {
  const result = Curry._2(indexBS.prefixFn, Arg1.logLevelsType, Arg1.name);
  return result
};
