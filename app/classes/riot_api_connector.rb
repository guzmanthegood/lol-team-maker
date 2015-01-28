require 'faraday_middleware'

class RiotApiConnector

	def initialize
		@api_key = "450698af-f010-405a-ac60-caf99aac9a87"
  end

  def get_all_champions
  	connection = get_connection 'https://global.api.pvp.net/api/lol/static-data/euw/v1.2/champion?champData=all&api_key=' + @api_key
  	connection.get
  end

  def load_all_champions
  	response = get_all_champions

  	response.body["data"].each do |riot_champ|
  		champ = Champion.find_or_create_by(id: riot_champ.last["id"])
			champ.id = riot_champ.last["id"]
			champ.key = riot_champ.last["key"]
			champ.name = riot_champ.last["name"]
			champ.title = riot_champ.last["title"]
			champ.partype = riot_champ.last["partype"]
			champ.lore = riot_champ.last["lore"]
			champ.blurb = riot_champ.last["blurb"]
			champ.save
  	end
  end

	private
		def get_connection(url)
	   	connection = Faraday::Connection.new(
			  :url => url,
			  :headers => { :accept =>  'application/json',
			  							:user_agent => 'Faraday Ruby Client'}) do |builder|
			    builder.adapter Faraday.default_adapter
			    builder.response :json, :content_type => /\bjson$/
				end
		end

end
