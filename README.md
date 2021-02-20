# ReScript DOM Testing Library

[![npm](https://img.shields.io/npm/v/rescript-dom-testing-library?label=version&style=flat-square)](https://www.npmjs.com/package/rescript-dom-testing-library)
[![GitHub Workflow Status](https://img.shields.io/github/workflow/status/brnrdog/rescript-dom-testing-library/Version%20Release?style=flat-square)](https://github.com/brnrdog/rescript-dom-testing-library/actions/workflows/release.yml)
![Codecov](https://img.shields.io/codecov/c/github/brnrdog/rescript-dom-testing-library?style=flat-square)

ReScript bindings for [testing-library/dom](https://github.com/testing-library/dom-testing-library/).

⚠️ Currently under development, [check the tests](https://github.com/brnrdog/rescript-dom-testing-library/blob/master/__tests__/DomTestingLibraryTest.res) for the available API.

## Install

```bash
npm install --save-dev rescript-dom-testing-library
# or yarn
yarn add --dev rescript-dom-testing-library
```

Update your bsconfig file:

```json
{
  "bs-dev-dependencies": ["rescript-dom-testing-library"]
}
```

## Usage

```res
let render = %raw(`
  function(html) {
    const body = document.querySelector('body')
    body.innerHTML = html
    return body
  }
`)

let example = `
<label htmlFor="color">
  Select a color
  <select id="color">
    <option>Red</option>
    <option>Green</option>
    <option>Blue</option>
  </select>
</label>
`

test("renders label", () => {
  example
  ->render
  ->getByLabelText(~matcher=#RegExp(Js.Re.fromString("Select a color")))
  ->expect
  ->toMatchSnapshot
})
```
