open DomTestingLibrary__Queries__Options

type byDisplayValueOptions = {
  exact: Js.undefined<bool>,
  normalizer: Js.undefined<string => string>,
}

let makeByDisplayValueOptions = (~exact=?, ~normalizer=?, ()) => {
  {
    exact: exact->Js.Undefined.fromOption,
    normalizer: normalizer->Js.Undefined.fromOption,
  }
}

@module("@testing-library/dom")
external getByDisplayValue: (
  'element,
  ~matcher: @unwrap
  [
    | #Func(textMatcher)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: option<byDisplayValueOptions>,
) => 'element = "getByDisplayValue"
let getByDisplayValue = (~options=?, ~matcher, element) =>
  getByDisplayValue(element, ~matcher, ~options)

@module("@testing-library/dom")
external findByDisplayValue: (
  'element,
  ~matcher: @unwrap
  [
    | #Func(textMatcher)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: option<byDisplayValueOptions>,
) => Js.Promise.t<'element> = "findByDisplayValue"
let findByDisplayValue = (~options=?, ~matcher, element) =>
  findByDisplayValue(element, ~matcher, ~options)
