open DomTestingLibrary__Queries__Options

type byTestIdOptions = {
  exact: Js.undefined<bool>,
  normalizer: Js.undefined<string => string>,
}

let makeByTestIdOptions = (~exact=?, ~normalizer=?, ()) => {
  {
    exact: exact->Js.Undefined.fromOption,
    normalizer: normalizer->Js.Undefined.fromOption,
  }
}

@module("@testing-library/dom")
external getByTestId: (
  'element,
  ~matcher: @unwrap
  [
    | #Func(textMatcher)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: option<byTestIdOptions>,
) => 'element = "getByTestId"
let getByTestId = (~options=?, ~matcher, element) => getByTestId(element, ~matcher, ~options)

@module("@testing-library/dom")
external findByTestId: (
  'element,
  ~matcher: @unwrap
  [
    | #Func(textMatcher)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: option<byTestIdOptions>,
) => Js.Promise.t<'element> = "findByTestId"
let findByTestId = (~options=?, ~matcher, element) => findByTestId(element, ~matcher, ~options)
