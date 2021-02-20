include DomTestingLibrary__Queries

@module("@testing-library/dom")
external waitFor: (unit => 'element) => Js.Promise.t<'element> = "waitFor"
let waitFor = waitFor
