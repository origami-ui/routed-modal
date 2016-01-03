
var
  stir $ require :stir-template
  settings $ require :./settings
  resource $ require :./resource
  ({}~ html head title meta link script body div) stir

var style $ stir.createFactory :style

= module.exports $ \ (env)
  var config $ settings.get env
  var assets $ resource.get config

  stir.render
    stir.doctype
    html null
      head null
        title null ":Routed Modal"
        meta $ {} :charset :utf-8
        link $ {} :rel :icon
          , :href :http://origami-ui.org/logo/origami-ui.png
        cond (? assets.style)
          link $ {} :rel :stylesheet :href assets.style
        script $ {} :src assets.vendor :defer true
        script $ {} :src assets.main :defer true
        style null ":body * {box-sizing: border-box;}"
      body ({} :style ":margin: 0;")
        div ({} :id :app)
