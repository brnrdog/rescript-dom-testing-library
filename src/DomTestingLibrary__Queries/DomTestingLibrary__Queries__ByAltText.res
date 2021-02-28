open DomTestingLibrary__Queries__Options

type byAltTextOptions = {
  exact: Js.undefined<bool>,
  normalizer: Js.undefined<string => string>,
}

let makeByAltTextOptions = (~exact=?, ~normalizer=?, ()) => {
  {
    exact: exact->Js.Undefined.fromOption,
    normalizer: normalizer->Js.Undefined.fromOption,
  }
}

@module("@testing-library/dom")
external getByAltText: (
  'element,
  ~matcher: @unwrap
  [
    | #Func(textMatcher)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: option<byAltTextOptions>,
) => 'element = "getByAltText"
let getByAltText = (~options=?, ~matcher, element) => getByAltText(element, ~matcher, ~options)

@module("@testing-library/dom")
external findByAltText: (
  'element,
  ~matcher: @unwrap
  [
    | #Func(textMatcher)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: option<byAltTextOptions>,
) => Js.Promise.t<'element> = "findByAltText"
let findByAltText = (~options=?, ~matcher, element) => findByAltText(element, ~matcher, ~options)
