include DomTestingLibrary__Queries__ByDisplayValue
include DomTestingLibrary__Queries__ByLabelText
include DomTestingLibrary__Queries__ByPlaceholderText
include DomTestingLibrary__Queries__ByRole
include DomTestingLibrary__Queries__ByText
include DomTestingLibrary__Queries__ByTitle
include DomTestingLibrary__Queries__Options

@module("@testing-library/dom")
external screen: 'document = "screen"
let screen = screen

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
