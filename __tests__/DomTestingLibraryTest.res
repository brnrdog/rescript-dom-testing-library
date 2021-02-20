open Jest
open Expect
open DomTestingLibrary__Queries

let render = %raw(`
  function(html) {
    const body = document.createElement('body', document)
    body.innerHTML = html
    return body
  }
  `)

let matchSnapshot = actual => {
  actual->expect->toMatchSnapshot->Js.Promise.resolve
}

module Promise = {
  let then_ = (promise, fn) => Js.Promise.then_(fn, promise)
}

testPromise("findByLabel", () => {
  "<label for=\"title\">Title</label><input type=\"text\" id=\"title\" />"
  ->render
  ->findByLabelText(~matcher=#Str("Title"))
  ->Promise.then_(matchSnapshot)
})

testPromise("findByText", () => {
  "<span>Hello world</span>"
  ->render
  ->findByText(~matcher=#Str("Hello world"))
  ->Promise.then_(matchSnapshot)
})

testPromise("findByRole", () => {
  "<option role=\"option\">Option</option>"
  ->render
  ->findByRole(~matcher=#Str("option"))
  ->Promise.then_(matchSnapshot)
})

testPromise("findByPlaceholderText", () => {
  "<input type=\"text\" placeholder=\"title\" />"
  ->render
  ->findByPlaceholderText(~matcher=#Str("title"))
  ->Promise.then_(matchSnapshot)
})

testPromise("findByDisplayValue", () => {
  "<input type=\"text\" placeholder=\"title\" value=\"Red\" />"
  ->render
  ->findByDisplayValue(~matcher=#Str("Red"))
  ->Promise.then_(matchSnapshot)
})

testPromise("findByAltText", () => {
  "<img alt=\"alt text example\" />"
  ->render
  ->findByAltText(~matcher=#Str("alt text example"))
  ->Promise.then_(matchSnapshot)
})

testPromise("findByTitle", () => {
  "<span title=\"title example\" />"
  ->render
  ->findByTitle(~matcher=#Str("title example"))
  ->Promise.then_(matchSnapshot)
})

testPromise("findByTestId", () => {
  "<div data-testid=\"test-id\">Test ID</div>"
  ->render
  ->findByTestId(~matcher=#Str("test-id"))
  ->Promise.then_(matchSnapshot)
})
