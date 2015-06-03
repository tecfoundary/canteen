jQuery ->
  $('#product-table').dataTable 'bSort': false

  $('#product-images .hover-btn a').click  ->
    $(this).closest('.col-xs-2').remove()
    return
  
  substringMatcher = (strs) ->
    (q, cb) ->
      matches = undefined
      substringRegex = undefined
      # an array that will be populated with substring matches
      matches = []
      # regex used to determine if a string contains the substring `q`
      substrRegex = new RegExp(q, 'i')
      # iterate through the pool of strings and for any string that
      # contains the substring `q`, add it to the `matches` array
      $.each strs, (i, str) ->
        if substrRegex.test(str)
          matches.push str
        return
      cb matches
      return

  $('#product-table tbody').on 'click', 'tr', ->
    console.log "Clicked"
    redirection = $(this).attr('id')
    console.log "id " + redirection
    document.location.href = redirection
    return

  $('#category .typeahead').typeahead {hint: true, highlight: true, minLength: 1}, {name: 'categories', source: substringMatcher(categories)}
  $('#sub-category .typeahead').typeahead {hint: true, highlight: true, minLength: 1}, {name: 'sub-categories', source: substringMatcher(sub_categories)}
  $('#brand .typeahead').typeahead {hint: true, highlight: true, minLength: 1}, {name: 'brands', source: substringMatcher(brands)}



$(document).bind 'dragover', (e) ->
  dropZone = $('#dropzone')
  timeout = window.dropZoneTimeout
  if !timeout
    dropZone.addClass 'in'
  else
    clearTimeout timeout
  found = false
  node = e.target
  loop
    if node == dropZone[0]
      found = true
      break
    node = node.parentNode
    unless node != null
      break
  if found
    dropZone.addClass 'hover'
  else
    dropZone.removeClass 'hover'
  window.dropZoneTimeout = setTimeout((->
    window.dropZoneTimeout = null
    dropZone.removeClass 'in hover'
    return
  ), 100)
  return