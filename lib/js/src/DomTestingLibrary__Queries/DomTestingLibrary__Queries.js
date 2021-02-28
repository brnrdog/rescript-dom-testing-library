// Generated by ReScript, PLEASE EDIT WITH CARE
'use strict';

var Dom = require("@testing-library/dom");
var DomTestingLibrary__Queries__ByRole = require("./DomTestingLibrary__Queries__ByRole.js");

var screen = Dom.screen;

function getByText(element, matcher) {
  return Dom.getByText(element, matcher.VAL);
}

function getByLabelText(element, matcher) {
  return Dom.getByLabelText(element, matcher.VAL);
}

function getByPlaceholderText(element, matcher) {
  return Dom.getByPlaceholderText(element, matcher.VAL);
}

function getByDisplayValue(element, matcher) {
  return Dom.getByDisplayValue(element, matcher.VAL);
}

function getByAltText(element, matcher) {
  return Dom.getByAltText(element, matcher.VAL);
}

function getByTitle(element, matcher) {
  return Dom.getByTitle(element, matcher.VAL);
}

function getByTestId(element, matcher) {
  return Dom.getByTestId(element, matcher.VAL);
}

function findByText(element, matcher) {
  return Dom.findByText(element, matcher.VAL);
}

function findByLabelText(element, matcher) {
  return Dom.findByLabelText(element, matcher.VAL);
}

function findByPlaceholderText(element, matcher) {
  return Dom.findByPlaceholderText(element, matcher.VAL);
}

function findByDisplayValue(element, matcher) {
  return Dom.findByDisplayValue(element, matcher.VAL);
}

function findByAltText(element, matcher) {
  return Dom.findByAltText(element, matcher.VAL);
}

function findByTitle(element, matcher) {
  return Dom.findByTitle(element, matcher.VAL);
}

function findByTestId(element, matcher) {
  return Dom.findByTestId(element, matcher.VAL);
}

var makeOptions = DomTestingLibrary__Queries__ByRole.makeOptions;

var makeOptionsWithRegex = DomTestingLibrary__Queries__ByRole.makeOptionsWithRegex;

var makeOptionsWithFunction = DomTestingLibrary__Queries__ByRole.makeOptionsWithFunction;

var getByRole = DomTestingLibrary__Queries__ByRole.getByRole;

var findByRole = DomTestingLibrary__Queries__ByRole.findByRole;

exports.makeOptions = makeOptions;
exports.makeOptionsWithRegex = makeOptionsWithRegex;
exports.makeOptionsWithFunction = makeOptionsWithFunction;
exports.getByRole = getByRole;
exports.findByRole = findByRole;
exports.screen = screen;
exports.getByText = getByText;
exports.getByLabelText = getByLabelText;
exports.getByPlaceholderText = getByPlaceholderText;
exports.getByDisplayValue = getByDisplayValue;
exports.getByAltText = getByAltText;
exports.getByTitle = getByTitle;
exports.getByTestId = getByTestId;
exports.findByText = findByText;
exports.findByLabelText = findByLabelText;
exports.findByPlaceholderText = findByPlaceholderText;
exports.findByDisplayValue = findByDisplayValue;
exports.findByAltText = findByAltText;
exports.findByTitle = findByTitle;
exports.findByTestId = findByTestId;
/* screen Not a pure module */