type normalizer = string => string
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

type optionsWithNormalizer = {
  name: Js.undefined<normalizer>,
  selector: Js.undefined<string>,
  exact: Js.undefined<bool>,
}

type options = [
  | #WithString(optionsWithString)
  | #WithRegExp(optionsWithRegExp)
  | #WithNormalizer(optionsWithNormalizer)
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

let makeOptionsWithNormalizer = (~exact=?, ~selector=?, ~name=?, ()): options => {
  #WithNormalizer({
    selector: Js.Undefined.fromOption(selector),
    exact: Js.Undefined.fromOption(exact),
    name: Js.Undefined.fromOption(name),
  })
}
