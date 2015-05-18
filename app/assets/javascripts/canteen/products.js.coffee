jQuery ->
  $('#product-table').dataTable 'bSort': false

  $('#product-images .hover-btn a').click  ->
    $(this).closest('.col-xs-2').remove()
  return

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


  # $('#product_images').fileupload
  #   dataType: "script"
  #   add: (e, data) ->
  #     types = /(\.|\/)(gif|jpe?g|png)$/i
  #     file = data.files[0]
  #     if types.test(file.type) || types.test(file.name)
  #       data.context = $(tmpl("template-upload", file))
  #       $('#edit_product').append(data.context)
  #       data.submit()
  #     else
  #       alert("#{file.name} is not a gif, jpeg, or png image file")
  #   progress: (e, data) ->
  #     if data.context
  #       progress = parseInt(data.loaded / data.total * 100, 10)
  #       data.context.find('.progress-bar').css('width', progress + '%')
  #       # $('.progress-bar').css('width', progress + '%')
  #   dropZone: $('#dropzone')
  # return
