open DomTestingLibrary__Queries__Options

type byTitleOptions = {
  exact: Js.undefined<bool>,
  normalizer: Js.undefined<string => string>,
}

let makeByTitleOptions = (~exact=?, ~normalizer=?, ()) => {
  {
    exact: exact->Js.Undefined.fromOption,
    normalizer: normalizer->Js.Undefined.fromOption,
  }
}

@module("@testing-library/dom")
external getByTitle: (
  'element,
  ~matcher: @unwrap
  [
    | #Func(textMatcher)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: option<byTitleOptions>,
) => 'element = "getByTitle"
let getByTitle = (~options=?, ~matcher, element) => getByTitle(element, ~matcher, ~options)

@module("@testing-library/dom")
external findByTitle: (
  'element,
  ~matcher: @unwrap
  [
    | #Func(textMatcher)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: option<byTitleOptions>,
) => Js.Promise.t<'element> = "findByTitle"
let findByTitle = (~options=?, ~matcher, element) => findByTitle(element, ~matcher, ~options)
