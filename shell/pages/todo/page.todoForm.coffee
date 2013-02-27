calatrava.pageView ?= {}

calatrava.pageView.todoForm = ->

	$page = $('#todoForm')
	$p = (sel)-> $(sel, $page)

	renderSection = (key, data)->
		console.log('rendering section ', key)
		console.log('rendering data ', data)
		$p("#" + key).text(data)
		
	bind: (event, handler) ->
		console.log "event: #{event}"
		$p("#" + event).off('click').on 'click', handler

	render: (message) ->
		console.log('rendering...', message)
		renderSection(section, data) for own section,data of message

	get: (field) ->
		console.log('getting...', field)
		$page.find("#" + field).val()

	show: -> console.log('showing...')
	hide: -> console.log('hiding...')
