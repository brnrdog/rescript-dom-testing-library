// Generated by ReScript, PLEASE EDIT WITH CARE
'use strict';

var Dom = require("@testing-library/dom");
var DomTestingLibrary__Queries__Options = require("./DomTestingLibrary__Queries__Options.js");

function getByRole(options, matcher, element) {
  return Dom.getByRole(element, matcher.VAL, options.VAL);
}

function findByRole(options, matcher, element) {
  return Dom.findByRole(element, matcher.VAL, options);
}

var makeOptions = DomTestingLibrary__Queries__Options.makeOptions;

var makeOptionsWithRegex = DomTestingLibrary__Queries__Options.makeOptionsWithRegex;

var makeOptionsWithFunction = DomTestingLibrary__Queries__Options.makeOptionsWithFunction;

exports.makeOptions = makeOptions;
exports.makeOptionsWithRegex = makeOptionsWithRegex;
exports.makeOptionsWithFunction = makeOptionsWithFunction;
exports.getByRole = getByRole;
exports.findByRole = findByRole;
/* @testing-library/dom Not a pure module */