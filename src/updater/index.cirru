
var
  modal $ require :./modal

var
  identity $ \ (x) x

= module.exports $ \ (db actionType actionData actionMeta)
  var handler $ case actionType
    :modal/add modal.add
    :modal/remove modal.remove
    else identity

  handler db actionData actionMeta
