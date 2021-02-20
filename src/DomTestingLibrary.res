include DomTestingLibrary__Queries

@module("@testing-library/dom")
external waitFor: (unit => Js.Promise.t<'element'>) => Js.Promise.t<'element> = "waitFor"
let waitFor = callback => (() => callback)->waitFor
