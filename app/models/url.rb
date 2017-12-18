class Url < ActiveRecord::Base
	validates :biturl, :uniqueness => true
	validates :origurl,	:format => { :with => /.+\..+/,
    :message => "Invalid website format." }

  before_validation do	
  	shorten
  	addhttp
		self.clicked = 0
  end

	# This is Sinatra! Remember to create a migration!
	def shorten
		puts "SHORTENING"
		o = [('a'..'z'), ('A'..'Z'), (0..9)].map(&:to_a).flatten
		self.biturl = (0...7).map { o.sample }.join
	end

	def addhttp
		url = self.origurl
		if !(url =~ /^https?:\/\//)
		  self.origurl = 'http://' + url
		end
	end
end