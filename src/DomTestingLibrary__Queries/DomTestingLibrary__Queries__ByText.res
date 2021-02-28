open DomTestingLibrary__Queries__Options

type byTextOptions = {
  selector: Js.undefined<string>,
  exact: Js.undefined<bool>,
  ignore: Js.undefined<bool>,
  normalizer: Js.undefined<string => string>,
}

let makeByTextOptions = (~selector=?, ~exact=?, ~ignore=?, ~normalizer=?, ()) => {
  {
    selector: selector->Js.Undefined.fromOption,
    exact: exact->Js.Undefined.fromOption,
    ignore: ignore->Js.Undefined.fromOption,
    normalizer: normalizer->Js.Undefined.fromOption,
  }
}

@module("@testing-library/dom")
external getByText: (
  'element,
  ~matcher: @unwrap
  [
    | #Func(textMatcher)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: option<byTextOptions>,
) => 'element = "getByText"
let getByText = (~options=?, element, ~matcher) => getByText(element, ~matcher, ~options)

@module("@testing-library/dom")
external findByText: (
  'element,
  ~matcher: @unwrap
  [
    | #Func(textMatcher)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: option<byTextOptions>,
) => Js.Promise.t<'element> = "findByText"
let findByText = (~options=?, ~matcher, element) => findByText(element, ~matcher, ~options)
