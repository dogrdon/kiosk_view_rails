require 'json'

namespace :imports do 
	task :import_json do
		File.open('/home/droquo/kiosk_view_rails/lib/assets/data/pages.json', 'r') do |file|
			file.each do |line|
				#page_data = JSON.parse line

				#Page.create! page_data
				puts line
			end
		end
	
	end
end