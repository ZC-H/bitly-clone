get '/' do
  erb :"static/index"
end

post '/urls' do
  url = Url.new(:origurl => params['long_url'] )
  if url.save
  	#redirect '/'
  	url.to_json
  else
  	false.to_json
  end
end

get '/:short_url' do
  url = Url.find_by('biturl = ?',params["short_url"])
  if url != nil
  	url.increment!(:clicked)
	  redirect url.origurl
	else
		"<h1>Error: No Associated URL</h1>"
	end
end
