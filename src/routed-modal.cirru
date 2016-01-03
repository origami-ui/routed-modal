
var
  hsl $ require :hsl
  React $ require :react
  Immutable $ require :immutable

var
  actions $ require :./actions

var
  ({}~ div) React.DOM

= module.exports $ React.createClass $ {}
  :displayName :routed-modal

  :propTypes $ {}
    :renderer React.PropTypes.func.isRequired
    :modals
      . (React.PropTypes.instanceOf Immutable.List) :isRequired

  :onPrevent $ \ (event)
    event.stopPropagation

  :renderModals $ \ ()
    var
      length @props.modals.size
      allModals $ @props.modals.push (Immutable.Map)
    allModals.map $ \\ (modalData index)
      if (is index length) $ do
        return (@renderPlaceholder)

      var onClick $ \\ (event)
        actions.modalRemove $ modalData.get :id

      div ({} :style @styleModal :onClick onClick :key index)
        div ({} :style @styleBox :onClick @onPrevent)
          @props.renderer modalData index

  :renderPlaceholder $ \ ()
    div
      {} :className :modal-container :key @props.modals.size
        , :style @stylePlaceholder
      div $ {} :style @styleEmptyBox :onClick @onPrevent

  :render $ \ ()
    div ({} :className :routed-modal)
      @renderModals

  :stylePlaceholder $ {}
    :zIndex 100
    :opacity 0.2
    :position :absolute
    :width :100%
    :height :100%
    :top 0
    :left 0
    :backgroundColor $ hsl 0 0 100 0
    :display :flex
    :justifyContent :center
    :alignItems :center
    :transitionDuration :400ms
    :pointerEvents :none
    :transitionProperty :opacity,background-color
    :overflow :auto

  :styleModal $ {}
    :zIndex 100
    :opacity 1
    :position :absolute
    :width :100%
    :height :100%
    :top 0
    :left 0
    :backgroundColor $ hsl 200 50 20 0.3
    :display :flex
    :justifyContent :center
    :alignItems :center
    :transitionDuration :400ms
    :transitionProperty :opacity,background-color
    :overflow :auto

  :styleBox $ {}
    :backgroundColor :white
    :width 600
    :minHeight 400
    :padding :20px
    :transitionDuration :400ms
    :flexShrink 0
    :margin :auto

  :styleEmptyBox $ {}
    :backgroundColor :white
    :width 600
    :minHeight 0
    :padding ":0 20px"
    :transitionDuration :400ms
    :flexShrink 0
    :margin :auto
