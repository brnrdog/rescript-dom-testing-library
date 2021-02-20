@module("@testing-library/dom")
external screen: 'document = "screen"
let screen = screen

type textMatcher = (string, Dom.element) => bool

@module("@testing-library/dom")
external findByRole: (
  'element,
  ~matcher: @unwrap
  [
    | #Func(textMatcher)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
) => Js.Promise.t<'element> = "findByRole"
let findByRole = (element, ~matcher) => findByRole(element, ~matcher)

@module("@testing-library/dom")
external findByText: (
  'element,
  ~matcher: @unwrap
  [
    | #Func(textMatcher)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
) => Js.Promise.t<'element> = "findByText"
let findByText = (element, ~matcher) => findByText(element, ~matcher)

@module("@testing-library/dom")
external findByLabelText: (
  'element,
  ~matcher: @unwrap
  [
    | #Func(textMatcher)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
) => Js.Promise.t<'element> = "findByLabelText"
let findByLabelText = (element, ~matcher) => findByLabelText(element, ~matcher)

@module("@testing-library/dom")
external findByPlaceholderText: (
  'element,
  ~matcher: @unwrap
  [
    | #Func(textMatcher)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
) => Js.Promise.t<'element> = "findByPlaceholderText"
let findByPlaceholderText = (element, ~matcher) => findByPlaceholderText(element, ~matcher)

@module("@testing-library/dom")
external findByDisplayValue: (
  'element,
  ~matcher: @unwrap
  [
    | #Func(textMatcher)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
) => Js.Promise.t<'element> = "findByDisplayValue"
let findByDisplayValue = (element, ~matcher) => findByDisplayValue(element, ~matcher)

@module("@testing-library/dom")
external findByAltText: (
  'element,
  ~matcher: @unwrap
  [
    | #Func(textMatcher)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
) => Js.Promise.t<'element> = "findByAltText"
let findByAltText = (element, ~matcher) => findByAltText(element, ~matcher)

@module("@testing-library/dom")
external findByTitle: (
  'element,
  ~matcher: @unwrap
  [
    | #Func(textMatcher)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
) => Js.Promise.t<'element> = "findByTitle"
let findByTitle = (element, ~matcher) => findByTitle(element, ~matcher)

@module("@testing-library/dom")
external findByTestId: (
  'element,
  ~matcher: @unwrap
  [
    | #Func(textMatcher)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
) => Js.Promise.t<'element> = "findByTestId"
let findByTestId = (element, ~matcher) => findByTestId(element, ~matcher)
