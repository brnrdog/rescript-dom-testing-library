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

describe("byLabel", () => {
  test("getByLabel", () => {
    "<label for=\"title\">Title</label><input type=\"text\" id=\"title\" />"
    ->render
    ->getByLabelText(~matcher=#Str("Title"))
    ->expect
    ->toBeInTheDocument
  })

  test("getByLabel - exact as false", () => {
    "<label for=\"title\">Title</label><input type=\"text\" id=\"title\" />"
    ->render
    ->getByLabelText(~matcher=#Str("title"), ~options=makeByLabelTextOptions(~exact=false, ()))
    ->expect
    ->toBeInTheDocument
  })

  testPromise("findByLabel", () => {
    "<label for=\"title\">Title</label><input type=\"text\" id=\"title\" />"
    ->render
    ->findByLabelText(~matcher=#Str("Title"))
    ->Promise.then_(actual => actual->expect->toBeInTheDocument->Js.Promise.resolve)
  })
})

describe("byText", () => {
  test("getByText", () => {
    "<span>Hello world</span>"
    ->render
    ->getByText(~matcher=#Str("Hello world"))
    ->expect
    ->toBeInTheDocument
  })

  test("getByText - exact as false", () => {
    "<span>Hello world</span>"
    ->render
    ->getByText(~matcher=#Str("hello world"), ~options=makeByTextOptions(~exact=false, ()))
    ->expect
    ->toBeInTheDocument
  })

  testPromise("findByText", () => {
    "<span>Hello world</span>"
    ->render
    ->findByText(~matcher=#Str("Hello world"))
    ->Promise.then_(el => el->expect->toBeInTheDocument->Js_promise.resolve)
  })

  test("getAllByText", () => {
    "<select>
    <option role=\"option\">Color Red</option>
    <option role=\"option\">Color Green</option>
    <option role=\"option\">Color Blue</option>
  </select>"
    ->render
    ->getAllByText(~matcher=#RegExp(Js.Re.fromString("Color")))
    |> Expect.expect
    |> Expect.toHaveLength(3)
  })

  testPromise("findAllByText", () => {
    "<select>
    <option role=\"option\">Color Red</option>
    <option role=\"option\">Color Green</option>
    <option role=\"option\">Color Blue</option>
  </select>"
    ->render
    ->findAllByText(~matcher=#RegExp(Js.Re.fromString("Color")))
    ->Promise.then_(el => el |> Expect.expect |> Expect.toHaveLength(3) |> Js_promise.resolve)
  })
})

describe("byRole", () => {
  test("getByRole - regex", () => {
    let options = makeByRoleOptionsWithRegex(
      ~name=Js.Re.fromStringWithFlags("color green", ~flags="i"),
      (),
    )

    "<option role=\"option\">Color Green</option>"
    ->render
    ->getByRole(~matcher=#Str("option"), ~options)
    ->expect
    ->toBeInTheDocument
  })

  test("getByRole - function", () => {
    let options = makeByRoleOptionsWithFunction(
      ~name=(content, _element) => content === "Color Green",
      (),
    )

    "<option role=\"option\">Color Green</option>"
    ->render
    ->getByRole(~matcher=#Str("option"), ~options)
    ->expect
    ->toBeInTheDocument
  })

  testPromise("findByRole", () => {
    let options = makeByRoleOptions(~name="Red Color", ())
    "<option role=\"option\">Red Color</option>"
    ->render
    ->findByRole(~matcher=#Str("option"), ~options)
    ->Promise.then_(el => el->expect->toBeInTheDocument->Js_promise.resolve)
  })

  testPromise("findAllByRole", () => {
    "<select>
    <option role=\"option\">Color Red</option>
    <option role=\"option\">Color Green</option>
    <option role=\"option\">Color Blue</option>
  </select>"
    ->render
    ->findAllByRole(~matcher=#Str("option"))
    ->Promise.then_(el => el |> Expect.expect |> Expect.toHaveLength(3) |> Js_promise.resolve)
  })

  test("getAllByRole", () => {
    "<select>
    <option role=\"option\">Color Red</option>
    <option role=\"option\">Color Green</option>
    <option role=\"option\">Color Blue</option>
  </select>"
    ->render
    ->getAllByRole(~matcher=#Str("option"))
    |> Expect.expect
    |> Expect.toHaveLength(3)
  })

  test("queryAllByRole", () => {
    "<select>
    <option role=\"option\">Color Red</option>
    <option role=\"option\">Color Green</option>
    <option role=\"option\">Color Blue</option>
  </select>"
    ->render
    ->queryAllByRole(~matcher=#Str("option"))
    |> Expect.expect //bs-jest is pipe-last
    |> Expect.toHaveLength(3)
  })
})

describe("byPlaceholder", () => {
  test("getByPlaceholderText", () => {
    "<input type=\"text\" placeholder=\"title\" />"
    ->render
    ->getByPlaceholderText(~matcher=#Str("title"))
    ->expect
    ->toBeInTheDocument
  })

  test("getByPlaceholderText - exact as false", () => {
    "<input type=\"text\" placeholder=\"Title\" />"
    ->render
    ->getByPlaceholderText(
      ~matcher=#Str("title"),
      ~options=makeByPlaceholderTextOptions(~exact=false, ()),
    )
    ->expect
    ->toBeInTheDocument
  })

  testPromise("findByPlaceholderText", () => {
    "<input type=\"text\" placeholder=\"title\" />"
    ->render
    ->findByPlaceholderText(~matcher=#Str("title"))
    ->Promise.then_(el => el->expect->toBeInTheDocument->Js_promise.resolve)
  })
})

describe("byDisplayValue", () => {
  test("getByDisplayValue", () => {
    "<input type=\"text\" placeholder=\"title\" value=\"Red\" />"
    ->render
    ->getByDisplayValue(~matcher=#Str("Red"))
    ->expect
    ->toBeInTheDocument
  })

  test("getByDisplayValue - exact as false", () => {
    "<input type=\"text\" placeholder=\"title\" value=\"Red\" />"
    ->render
    ->getByDisplayValue(~matcher=#Str("red"), ~options=makeByDisplayValueOptions(~exact=false, ()))
    ->expect
    ->toBeInTheDocument
  })

  testPromise("findByDisplayValue", () => {
    "<input type=\"text\" placeholder=\"title\" value=\"Red\" />"
    ->render
    ->findByDisplayValue(~matcher=#Str("Red"))
    ->Promise.then_(el => el->expect->toBeInTheDocument->Js_promise.resolve)
  })
})

describe("byAltText", () => {
  test("getByAltText", () => {
    "<img alt=\"alt text example\" />"
    ->render
    ->getByAltText(~matcher=#Str("alt text example"))
    ->expect
    ->toBeInTheDocument
  })

  testPromise("findByAltText", () => {
    "<img alt=\"alt text example\" />"
    ->render
    ->findByAltText(~matcher=#Str("alt text example"))
    ->Promise.then_(el => el->expect->toBeInTheDocument->Js_promise.resolve)
  })

  test("getByAltText - exact as false", () => {
    "<img alt=\"alt text example\" />"
    ->render
    ->getByAltText(
      ~matcher=#Str("alt text example"),
      ~options=makeByAltTextOptions(~exact=false, ()),
    )
    ->expect
    ->toBeInTheDocument
  })

  test("getAllByAltText", () => {
    "<img alt=\"alt text example\" />"->render->getAllByAltText(~matcher=#Str("alt text example"))
    |> Expect.expect
    |> Expect.toHaveLength(1)
  })

  test("queryAllByAltText", () => {
    "<img alt=\"alt text example\" />"->render->queryAllByAltText(~matcher=#Str("alt text example"))
    |> Expect.expect
    |> Expect.toHaveLength(1)
  })

  testPromise("findAllByAltText", () => {
    "<img alt=\"alt text example\" />"
    ->render
    ->findAllByAltText(~matcher=#Str("alt text example"))
    ->Promise.then_(el => el |> Expect.expect |> Expect.toHaveLength(1) |> Js_promise.resolve)
  })
})

describe("byTitle", () => {
  test("getByTitle", () => {
    "<span title=\"title example\" />"
    ->render
    ->getByTitle(~matcher=#Str("title example"))
    ->expect
    ->toBeInTheDocument
  })

  test("getAllByTitle", () => {
    "<span title=\"title example\" />"->render->getAllByTitle(~matcher=#Str("title example"))
    |> Expect.expect
    |> Expect.toHaveLength(1)
  })

  test("queryAllByTitle", () => {
    "<span title=\"title example\" />"->render->queryAllByTitle(~matcher=#Str("title example"))
    |> Expect.expect
    |> Expect.toHaveLength(1)
  })

  testPromise("findAllByTitle", () => {
    "<span title=\"title example\" />"
    ->render
    ->findAllByTitle(~matcher=#Str("title example"))
    ->Promise.then_(el => el |> Expect.expect |> Expect.toHaveLength(1) |> Js_promise.resolve)
  })

  test("getByTitle - exact as false", () => {
    "<span title=\"title example\" />"
    ->render
    ->getByTitle(~matcher=#Str("TITLE EXAMPLE"), ~options=makeByTitleOptions(~exact=false, ()))
    ->expect
    ->toBeInTheDocument
  })

  testPromise("findByTitle", () => {
    "<span title=\"title example\" />"
    ->render
    ->findByTitle(~matcher=#Str("title example"))
    ->Promise.then_(el => el->expect->toBeInTheDocument->Js_promise.resolve)
  })
})

describe("byTestId", () => {
  test("getByTestId", () => {
    "<div data-testid=\"test-id\">Test ID</div>"
    ->render
    ->getByTestId(~matcher=#Str("test-id"))
    ->expect
    ->toBeInTheDocument
  })

  test("getAllByTestId", () => {
    "<select>
    <option role=\"option\" data-testid=\"option\">Color Red</option>
    <option role=\"option\" data-testid=\"option\">Color Green</option>
    <option role=\"option\" data-testid=\"option\">Color Blue</option>
  </select>"
    ->render
    ->getAllByTestId(~matcher=#RegExp(Js.Re.fromString("option")))
    |> Expect.expect
    |> Expect.toHaveLength(3)
  })

  test("queryAllByTestId", () => {
    "<select>
    <option role=\"option\" data-testid=\"option\">Color Red</option>
    <option role=\"option\" data-testid=\"option\">Color Green</option>
    <option role=\"option\" data-testid=\"option\">Color Blue</option>
  </select>"
    ->render
    ->queryAllByTestId(~matcher=#RegExp(Js.Re.fromString("option")))
    |> Expect.expect
    |> Expect.toHaveLength(3)
  })

  test("getByTestId - exact as false", () => {
    "<div data-testid=\"TEST-ID\">Test ID</div>"
    ->render
    ->getByTestId(~matcher=#Str("test-id"), ~options=makeByTestIdOptions(~exact=false, ()))
    ->expect
    ->toBeInTheDocument
  })

  testPromise("findAllByTestId", () => {
    "<select>
    <option data-testid=\"opt\">Color Red</option>
    <option data-testid=\"opt\">Color Green</option>
    <option data-testid=\"opt\">Color Blue</option>
  </select>"
    ->render
    ->findAllByTestId(~matcher=#Str("opt"))
    ->Promise.then_(el => el |> Expect.expect |> Expect.toHaveLength(3) |> Js_promise.resolve)
  })

  testPromise("findByTestId", () => {
    "<div data-testid=\"test-id\">Test ID</div>"
    ->render
    ->findByTestId(~matcher=#Str("test-id"))
    ->Promise.then_(el => el->expect->toBeInTheDocument->Js_promise.resolve)
  })
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
