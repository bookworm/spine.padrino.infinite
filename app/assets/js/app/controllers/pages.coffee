$ = jQuery
    
class Pages extends Spine.Controller
  className: 'list'
    
  elements:
    '.items': 'items'
    'footer': 'footer'
    
  constructor: ->
    super
    
    @html JST['app/views/pages/list']()
    
    Page.bind 'fetch', =>
      @el.addClass('loading')
    
    Page.bind 'refresh', =>
      @el.removeClass('loading')
      @footer.waypoint(@scroll, offset: '80%')
      @render(arguments...)

    Page.fetch()
    
  render: (items = []) =>
    for item in items
      @items.append JST['app/views/pages/item'](item)
      
  scroll: (e, direction) =>
    @footer.waypoint('destroy')
    Page.fetch()

window.Pages = Pages
