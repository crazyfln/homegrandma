
# init search page
@initSearchPage = ->
  $('#property_types').change()
  $items = $('#sl-cont-list').children()
  locations = new Array()
  $items.each (idx, item)->
    if ($(item).data('latitude') != undefined) &&  ($(item).data('longitude') != undefined)
      locations.push(latlng: new google.maps.LatLng($(item).data('latitude'), $(item).data('longitude')), name: $(item).data('property-name'))

  if locations.length > 0
    latlng = locations[0]['latlng']
    mapOptions =
      zoom: 10
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
    $map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions)

    $.each locations, (idx, item)->
      latlngMarker = item['latlng']
      marker = new google.maps.Marker
        position: latlngMarker
        map: $map
        title: item.name



# Home -> Search
@initSearchFieldType = ()->
  $("#property_types").on "change", ->
    $this = $(this)
    $value = $this.val()

    console.log $value
    console.log "-----"

    if ($value is "") or ($value is undefined)
      $("#banner-find span").hide()
      $("#search-header .sh-1 span").hide()
      $(".sh-1 label span").hide()

    if $value is "assisted_living"
      $("#banner-find span").hide()
      $("#search-header .sh-1 span").hide()
      $("span.green").show()

    if $value is "independant_living"
      $("#banner-find span").hide()
      $("#search-header .sh-1 span").hide()
      $("span.blue").show()

    if $value is "residential_care"
      $("#banner-find span").hide()
      $("#search-header .sh-1 span").hide()
      $("span.pink").show()

    if $value is "memory_care_specialty"
      $("#banner-find span").hide()
      $("#search-header .sh-1 span").hide()
      $("span.orange").show()

    if $value is "nursing_home"
      $("#banner-find span").hide()
      $("#search-header .sh-1 span").hide()
      $("span.red").show()

    if $value is "ccrc"
      $("#banner-find span").hide()
      $("#search-header .sh-1 span").hide()
      $("span.pink2").show()

  $('#property_types').change()


@codeAddress = ->
  address = document.getElementById("address").value
  geocoder.geocode
    address: address
  , (results, status) ->
    if status is google.maps.GeocoderStatus.OK
      map.setCenter results[0].geometry.location
      marker = new google.maps.Marker(
        map: map
        position: results[0].geometry.location
      )
    else
      alert "Geocode was not successful for the following reason: " + status
