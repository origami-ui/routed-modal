
var
  React $ require :react
  ReactDOM $ require :react-dom
  recorder $ require :actions-recorder

var
  Page $ React.createFactory $ require :./app/page
  schema $ require :./schema
  updater $ require :./updater

var render $ \ (core)
  ReactDOM.render
    Page $ {} :core core
    document.querySelector :#app

recorder.setup $ {}
  :initial schema.store
  :updater updater
  :inProduction false

recorder.request render
recorder.subscribe render

if module.hot $ do
  module.hot.accept ([] :./app/page) $ \ ()
    = Page $ React.createFactory $ require :./app/page
    recorder.request render
