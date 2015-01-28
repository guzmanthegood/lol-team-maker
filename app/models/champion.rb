class Champion < ActiveRecord::Base


	def image_url
		'http://ddragon.leagueoflegends.com/cdn/4.2.6/img/champion/' + self.key + '.png'
	end

end
