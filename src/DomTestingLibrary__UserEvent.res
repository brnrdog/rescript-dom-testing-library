type t
type eventInit
type options

type clickOptions = {
  @optional
  skipHover: bool,
  @optional
  clickCount: int,
}

type userEvent = {click: (. Dom.element, Js.undefined<clickOptions>, Js.undefined<eventInit>) => unit}

@module("@testing-library/user-event")
external userEvent: userEvent = "default"

let click = (~options=?, ~init=?, element) => {
  let options = options->Js.Undefined.fromOption
  let init = init->Js.Undefined.fromOption

  userEvent.click(. element, options, init)
}
