@module("@testing-library/dom")
external screen: 'document = "screen"
let screen = screen

type textMatcher = (string, Dom.element) => bool
type textMatch = [
  | #Func(textMatcher)
  | #RegExp(Js.Re.t)
  | #Str(string)
]

@unboxed
type roleOptions = {name: textMatch}
let makeRoleOptions = (~name, ()) => {
  {
    name: name,
  }
}

@module("@testing-library/dom")
external getByRole: (
  'element,
  ~matcher: @unwrap
  [
    | #Func(textMatcher)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: option<roleOptions>,
) => 'element = "getByRole"
let getByRole = (~options=?, ~matcher, element) => getByRole(element, ~matcher, ~options)

@module("@testing-library/dom")
external getByText: (
  'element,
  ~matcher: @unwrap
  [
    | #Func(textMatcher)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
) => 'element = "getByText"
let getByText = (element, ~matcher) => getByText(element, ~matcher)

@module("@testing-library/dom")
external getByLabelText: (
  'element,
  ~matcher: @unwrap
  [
    | #Func(textMatcher)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
) => 'element = "getByLabelText"
let getByLabelText = (element, ~matcher) => getByLabelText(element, ~matcher)

@module("@testing-library/dom")
external getByPlaceholderText: (
  'element,
  ~matcher: @unwrap
  [
    | #Func(textMatcher)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
) => 'element = "getByPlaceholderText"
let getByPlaceholderText = (element, ~matcher) => getByPlaceholderText(element, ~matcher)

@module("@testing-library/dom")
external getByDisplayValue: (
  'element,
  ~matcher: @unwrap
  [
    | #Func(textMatcher)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
) => 'element = "getByDisplayValue"
let getByDisplayValue = (element, ~matcher) => getByDisplayValue(element, ~matcher)

@module("@testing-library/dom")
external getByAltText: (
  'element,
  ~matcher: @unwrap
  [
    | #Func(textMatcher)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
) => 'element = "getByAltText"
let getByAltText = (element, ~matcher) => getByAltText(element, ~matcher)

@module("@testing-library/dom")
external getByTitle: (
  'element,
  ~matcher: @unwrap
  [
    | #Func(textMatcher)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
) => 'element = "getByTitle"
let getByTitle = (element, ~matcher) => getByTitle(element, ~matcher)

@module("@testing-library/dom")
external getByTestId: (
  'element,
  ~matcher: @unwrap
  [
    | #Func(textMatcher)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
) => 'element = "getByTestId"
let getByTestId = (element, ~matcher) => getByTestId(element, ~matcher)

@module("@testing-library/dom")
external findByRole: (
  'element,
  ~matcher: @unwrap
  [
    | #Func(textMatcher)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: option<roleOptions>,
) => Js.Promise.t<'element> = "findByRole"
let findByRole = (~options=?, ~matcher, element) => findByRole(element, ~matcher, ~options)

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
