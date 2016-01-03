
var
  hsl $ require :hsl
  React $ require :react
  Immutable $ require :immutable

var
  widget $ require :../styles/widget
  actions $ require :../actions
  RoutedModal $ React.createFactory $ require :../routed-modal

var
  ({}~ div span a) React.DOM

= module.exports $ React.createClass $ {}
  :dislayName :app-page

  :propTypes $ {}
    :core
      . (React.PropTypes.instanceOf Immutable.Map) :isRequired

  :onAdd $ \ ()
    actions.modalAdd $ Immutable.fromJS $ {}
      :name :first
      :data :nothing

  :modalRenderer $ \ (modalData index)
    div null
      span null :nothing index
      span ({} :onClick @onAdd :style widget.button) :Add

  :render $ \ ()
    var
      store $ @props.core.get :store
      link :https://github.com/origami-ui/routed-modal

    div ({} :style @styleRoot)
      div ({} :style @styleNote)
        span null ":This is a Modal library."
        span ({} :onClick @onAdd :style widget.button) :Add
        div null
          span null ":Read more at "
          a ({} :href link) link
      RoutedModal $ {}
        :modals $ store.get :modals
        :renderer @modalRenderer

  :styleRoot $ {}
    :backgroundColor $ hsl 0 0 100
    :padding ":20px"
    :position :absolute
    :height :100%
    :width :100%
    :left 0
    :top 0
    :fontFamily ":Verdana, Helvetica, sans-serif"
    :lineHeight :30px
    :fontSize :18px
