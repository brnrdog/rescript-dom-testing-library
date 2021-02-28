open DomTestingLibrary__Queries__Options

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
