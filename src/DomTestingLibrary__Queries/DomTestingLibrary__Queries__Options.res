type textMatcher = (string, Dom.element) => bool
type textMatch = [
  | #Func(textMatcher)
  | #RegExp(Js.Re.t)
  | #Str(string)
]

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
