require 'json'

namespace :page do 
	task :import_json => :environment do
		File.open('/home/droquo/kiosk_view_rails/lib/assets/data/pages.json', 'r') do |file|
			file.each do |line|
				page_data = JSON.parse line

				Page.create!(page_data)
				#new_page = Page.new(page_data)
				#new_page.save!
				#Page.create! page_data
				#puts page_data
			end
		end
	
	end
end