// Generated by ReScript, PLEASE EDIT WITH CARE
'use strict';

var Js_undefined = require("rescript/lib/js/js_undefined.js");
var Dom = require("@testing-library/dom");

function makeByPlaceholderTextOptions(exact, normalizer, param) {
  return {
          exact: Js_undefined.fromOption(exact),
          normalizer: Js_undefined.fromOption(normalizer)
        };
}

function getByPlaceholderText(options, matcher, element) {
  return Dom.getByPlaceholderText(element, matcher.VAL, options);
}

function findByPlaceholderText(options, matcher, element) {
  return Dom.findByPlaceholderText(element, matcher.VAL, options);
}

function getAllByPlaceholderText(options, matcher, element) {
  return Dom.getAllByPlaceholderText(element, matcher.VAL, options);
}

function queryAllByPlaceholderText(options, matcher, element) {
  return Dom.queryAllByPlaceholderText(element, matcher.VAL, options);
}

function findAllByPlaceholderText(options, matcher, element) {
  return Dom.findAllByPlaceholderText(element, matcher.VAL, options);
}

exports.makeByPlaceholderTextOptions = makeByPlaceholderTextOptions;
exports.getByPlaceholderText = getByPlaceholderText;
exports.findByPlaceholderText = findByPlaceholderText;
exports.getAllByPlaceholderText = getAllByPlaceholderText;
exports.queryAllByPlaceholderText = queryAllByPlaceholderText;
exports.findAllByPlaceholderText = findAllByPlaceholderText;
/* @testing-library/dom Not a pure module */
