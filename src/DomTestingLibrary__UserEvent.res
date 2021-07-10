type t
type eventInit
type options

type clickOptions = {
  skipHover: bool,
  clickCount: int,
}

type typeOptions = {
  delay: int,
  // skipClick: bool,
  // skipAutoClose: bool,
  // initialSelectionStart: int,
  // initialSelectionEnd: int,
}

type keyboardOptions = {delay: int}

type userEvent = {
  click: (. Dom.element, Js.undefined<clickOptions>, Js.undefined<eventInit>) => unit,
  @as("type")
  type_: (. Dom.element, string, Js.undefined<typeOptions>) => unit,
  keyboard: (. string, Js.undefined<keyboardOptions>) => unit,
}

@module("@testing-library/user-event")
external userEvent: userEvent = "default"

let click = (~options=?, ~init=?, element) => {
  let options = options->Js.Undefined.fromOption
  let init = init->Js.Undefined.fromOption

  userEvent.click(. element, options, init)
}

let type_ = (~options=?, element, text) => {
  let options = options->Js.Undefined.fromOption

  userEvent.type_(. element, text, options)
}

let keyboard = (~options=?, text) => {
  let options = options->Js.Undefined.fromOption

  userEvent.keyboard(. text, options)
}
