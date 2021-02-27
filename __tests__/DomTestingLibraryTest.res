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

let renderWithDelay = %raw(`
  function(html, delay) {
    const body = document.querySelector('body')
    setTimeout(() => {
      body.innerHTML = html
    }, delay)
    return body
  }
`)

module Promise = {
  let then_ = (promise, fn) => Js.Promise.then_(fn, promise)
}

test("getByLabel", () => {
  "<label for=\"title\">Title</label><input type=\"text\" id=\"title\" />"
  ->render
  ->getByLabelText(~matcher=#Str("Title"))
  ->expect
  ->toBeInTheDocument
})

test("getByText", () => {
  "<span>Hello world</span>"
  ->render
  ->getByText(~matcher=#Str("Hello world"))
  ->expect
  ->toBeInTheDocument
})

test("getByRole", () => {
  "<option role=\"option\">Color Green</option>"
  ->render
  ->getByRole(~matcher=#Str("option"), ~options=makeRoleOptions(~name=#Str("Color Green"))
  ->expect
  ->toBeInTheDocument
})

test("getByPlaceholderText", () => {
  "<input type=\"text\" placeholder=\"title\" />"
  ->render
  ->getByPlaceholderText(~matcher=#Str("title"))
  ->expect
  ->toBeInTheDocument
})

test("getByDisplayValue", () => {
  "<input type=\"text\" placeholder=\"title\" value=\"Red\" />"
  ->render
  ->getByDisplayValue(~matcher=#Str("Red"))
  ->expect
  ->toBeInTheDocument
})

test("getByAltText", () => {
  "<img alt=\"alt text example\" />"
  ->render
  ->getByAltText(~matcher=#Str("alt text example"))
  ->expect
  ->toBeInTheDocument
})

test("getByTitle", () => {
  "<span title=\"title example\" />"
  ->render
  ->getByTitle(~matcher=#Str("title example"))
  ->expect
  ->toBeInTheDocument
})

test("getByTestId", () => {
  "<div data-testid=\"test-id\">Test ID</div>"
  ->render
  ->getByTestId(~matcher=#Str("test-id"))
  ->expect
  ->toBeInTheDocument
})

testPromise("findByLabel", () => {
  "<label for=\"title\">Title</label><input type=\"text\" id=\"title\" />"
  ->render
  ->findByLabelText(~matcher=#Str("Title"))
  ->Promise.then_(actual => actual->expect->toBeInTheDocument->Js.Promise.resolve)
})

testPromise("findByText", () => {
  "<span>Hello world</span>"
  ->render
  ->findByText(~matcher=#Str("Hello world"))
  ->Promise.then_(el => el->expect->toBeInTheDocument->Js_promise.resolve)
})

testPromise("findByRole", () => {
  "<option role=\"option\">Red Color</option>"
  ->render
  ->findByRole(~matcher=#Str("option"), ~options=makeRoleOptions(~name=#Str("Red Color")))
  ->Promise.then_(el => el->expect->toBeInTheDocument->Js_promise.resolve)
})

testPromise("findByPlaceholderText", () => {
  "<input type=\"text\" placeholder=\"title\" />"
  ->render
  ->findByPlaceholderText(~matcher=#Str("title"))
  ->Promise.then_(el => el->expect->toBeInTheDocument->Js_promise.resolve)
})

testPromise("findByDisplayValue", () => {
  "<input type=\"text\" placeholder=\"title\" value=\"Red\" />"
  ->render
  ->findByDisplayValue(~matcher=#Str("Red"))
  ->Promise.then_(el => el->expect->toBeInTheDocument->Js_promise.resolve)
})

testPromise("findByAltText", () => {
  "<img alt=\"alt text example\" />"
  ->render
  ->findByAltText(~matcher=#Str("alt text example"))
  ->Promise.then_(el => el->expect->toBeInTheDocument->Js_promise.resolve)
})

testPromise("findByTitle", () => {
  "<span title=\"title example\" />"
  ->render
  ->findByTitle(~matcher=#Str("title example"))
  ->Promise.then_(el => el->expect->toBeInTheDocument->Js_promise.resolve)
})

testPromise("findByTestId", () => {
  "<div data-testid=\"test-id\">Test ID</div>"
  ->render
  ->findByTestId(~matcher=#Str("test-id"))
  ->Promise.then_(el => el->expect->toBeInTheDocument->Js_promise.resolve)
})

testPromise("waitFor", () => {
  waitFor(() =>
    "<div data-testid=\"test-id\">Test ID</div>"
    ->renderWithDelay(200)
    ->getByTestId(~matcher=#Str("test-id"))
    ->expect
    ->toBeInTheDocument
  )
})
