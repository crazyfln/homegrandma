@initFormPropertyStep1 = ()->
  $("#search-toggler").click ->
    setTimeout (->
      $("#search-toggler").html ->
        visible = $(".sh-2").is(":visible") or $(".sh-3").is(":visible")
        if visible
          "Less Options"
        else
          "More Options"

    ), 500

  $("#property_phone_number").mask "(999) 999-9999?"




@initFormPropertyStep2 = ()->
  $("#property_include_service_charge").click ->
  if @checked
    $("#service-types").slideUp "slow"
  else
    $("#service-types").slideDown "slow"


  # about checkbox primary
  $('.photos-field-container').on 'change', 'input[type=checkbox]', (event)->
    $this = $(this)
    $('.photos-field-container input[type=checkbox]').prop('checked', false)
    $this.prop('checked', true)
    $.uniform.update()
    # TO DO
    #
    #


@initDetailProperty = ()->
  $li_container = $('li.t-culture a')
  $li_container.on 'click', (event)->
    $map_container = $('#property_location')
    latlng = new google.maps.LatLng($map_container.data('latitude'), $map_container.data('longitude'))
    if $map_container.data('map-initialized') == undefined
      mapOptions =
        zoom: 14
        center: latlng
        mapTypeControl: true
        mapTypeControlOptions:
          style: google.maps.MapTypeControlStyle.DROPDOWN_MENU
        zoomControl: true
        panControl: true
        panControlOptions:
          position: google.maps.ControlPosition.LEFT_TOP
        zoomControlOptions:
          style: google.maps.ZoomControlStyle.SMALL
          position: google.maps.ControlPosition.LEFT_TOP

      # render google map
      $map = new google.maps.Map(document.getElementById("property_location"), mapOptions)

      # show marker
      marker = new google.maps.Marker
        position: latlng
        map: $map
        title: $map_container.data('name')

      # add map-initialized = true
      $map_container.data('map-initialized', true)

# whaetever
@property_map = ->
    mapOptions =
      zoom: 4
      center: new google.maps.LatLng(-34, 150)

    map = new google.maps.Map(document.getElementById("property_location"), mapOptions)
  map_patch = ->
    setTimeout (->
      google.maps.event.trigger map, "resize"
    ), 1000
  # map = undefined
  # google.maps.event.addDomListener window, "load", property_map