open DomTestingLibrary__Queries__Options

type byPlaceholderTextOptions = {
  exact: Js.undefined<bool>,
  normalizer: Js.undefined<string => string>,
}

let makeByPlaceholderTextOptions = (~exact=?, ~normalizer=?, ()) => {
  {
    exact: exact->Js.Undefined.fromOption,
    normalizer: normalizer->Js.Undefined.fromOption,
  }
}

@module("@testing-library/dom")
external getByPlaceholderText: (
  'element,
  ~matcher: @unwrap
  [
    | #Func(textMatcher)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: option<byPlaceholderTextOptions>,
) => 'element = "getByPlaceholderText"
let getByPlaceholderText = (~options=?, ~matcher, element) =>
  getByPlaceholderText(element, ~matcher, ~options)

@module("@testing-library/dom")
external findByPlaceholderText: (
  'element,
  ~matcher: @unwrap
  [
    | #Func(textMatcher)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: option<byPlaceholderTextOptions>,
) => Js.Promise.t<'element> = "findByPlaceholderText"
let findByPlaceholderText = (~options=?, ~matcher, element) =>
  findByPlaceholderText(element, ~matcher, ~options)
