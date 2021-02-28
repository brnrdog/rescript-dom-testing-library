open DomTestingLibrary__Queries__Options

type optionsWithString = {
  name: Js.undefined<string>,
  selector: Js.undefined<string>,
  exact: Js.undefined<bool>,
}

type optionsWithRegExp = {
  name: Js.undefined<Js.Re.t>,
  selector: Js.undefined<string>,
  exact: Js.undefined<bool>,
}

type optionsWithFunction = {
  name: Js.undefined<textMatcher>,
  selector: Js.undefined<string>,
  exact: Js.undefined<bool>,
}

type options = [
  | #WithString(optionsWithString)
  | #WithRegExp(optionsWithRegExp)
  | #WithFunction(optionsWithFunction)
]

let makeOptions = (~exact=?, ~selector=?, ~name=?, ()): options => {
  #WithString({
    selector: Js.Undefined.fromOption(selector),
    exact: Js.Undefined.fromOption(exact),
    name: Js.Undefined.fromOption(name),
  })
}

let makeOptionsWithRegex = (~exact=?, ~selector=?, ~name=?, ()): options => {
  #WithRegExp({
    selector: Js.Undefined.fromOption(selector),
    exact: Js.Undefined.fromOption(exact),
    name: Js.Undefined.fromOption(name),
  })
}

let makeOptionsWithFunction = (~exact=?, ~selector=?, ~name=?, ()): options => {
  #WithFunction({
    selector: Js.Undefined.fromOption(selector),
    exact: Js.Undefined.fromOption(exact),
    name: Js.Undefined.fromOption(name),
  })
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
  ~options: @unwrap
  [
    | #WithString(optionsWithString)
    | #WithRegExp(optionsWithRegExp)
    | #WithFunction(optionsWithFunction)
  ],
) => 'element = "getByRole"
let getByRole = (~options, ~matcher, element) => {
  getByRole(element, ~matcher, ~options)
}

@module("@testing-library/dom")
external findByRole: (
  'element,
  ~matcher: @unwrap
  [
    | #Func(textMatcher)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: option<options>,
) => Js.Promise.t<'element> = "findByRole"
let findByRole = (~options=?, ~matcher, element) => findByRole(element, ~matcher, ~options)

@module("@testing-library/dom")
external getAllByRole: (
  'element,
  ~matcher: @unwrap
  [
    | #Func(textMatcher)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: option<options>,
) => array<'element> = "getAllByRole"
let getAllByRole = (~options=?, ~matcher, element) => getAllByRole(element, ~matcher, ~options)

@module("@testing-library/dom")
external queryAllByRole: (
  'element,
  ~matcher: @unwrap
  [
    | #Func(textMatcher)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: option<options>,
) => array<'element> = "queryAllByRole"
let queryAllByRole = (~options=?, ~matcher, element) => queryAllByRole(element, ~matcher, ~options)

@module("@testing-library/dom")
external findAllByRole: (
  'element,
  ~matcher: @unwrap
  [
    | #Func(textMatcher)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: option<options>,
) => Js.Promise.t<array<'element>> = "findAllByRole"
let findAllByRole = (~options=?, ~matcher, element) => findAllByRole(element, ~matcher, ~options)
