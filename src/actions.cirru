
var
  shortid $ require :shortid
  recorder $ require :actions-recorder

var
  dispatch recorder.dispatch

= exports.modalAdd $ \ (modalData)
  = modalData $ modalData.set :id (shortid.generate)
  dispatch :modal/add modalData

= exports.modalRemove $ \ (modalId)
  dispatch :modal/remove modalId
