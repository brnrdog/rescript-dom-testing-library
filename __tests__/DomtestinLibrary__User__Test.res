open Jest
open DomTestingLibrary
open JestDom

let render = %raw(`
  function(html) {
    const body = document.querySelector('body', document)
    body.innerHTML = html
    return body
  }
`)

describe("UserEvent", () => {
  let setupMocks = %raw(`
    window.increment = () => {
      window.count = window.count || 0;
      return window.count++
    }
  `)

  let resetMocks = () => %raw(`window.count = 0`)

  beforeEach(() => {
    setupMocks()
  })

  afterEach(() => {
    resetMocks()
  })

  test("click", () => {
    `<button onclick="window.increment">Click me</button>`
    ->render
    ->getByRole(~matcher=#Str("button"), ~options=makeByRoleOptions(~name="Click me", ()))
    ->UserEvent.click

    %raw("window.count") |> ExpectJs.expect |> ExpectJs.toEqual(1)
  })

  test("type", () => {
    let input = `<input />`->render
    input->getByRole(~matcher=#Str("textbox"))->UserEvent.type_("four")
    input->getByDisplayValue(~matcher=#Str("four"))->expect->toBeInTheDocument
  })

  testPromise("keyboard", () => {
    `<input />`->render->getByRole(~matcher=#Str("textbox"))->UserEvent.click
    UserEvent.keyboard("four")

    waitFor(() => screen->getByDisplayValue(~matcher=#Str("four"))->expect->toBeInTheDocument)
  })

  test("tab", () => {
    let html = `<button>Save</button>`->render

    let cancel =
      html->DomTestingLibrary.getByRole(
        ~matcher=#Str("button"),
        ~options=makeByRoleOptions(~name="Save", ()),
      )

    let activeElement = %raw(`document.activeElement`)

    cancel->expect->Expect.toBe(activeElement)
  })
})
