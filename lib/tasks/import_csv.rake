require 'csv'

namespace :page do 

	task :import_csv => :environment do
		CSV.foreach('/home/droquo/kiosk_view_rails/lib/assets/data/kiosk-dummy-data.csv', headers: true) do |row|

			Page.create!(row.to_hash)
				
			
		end
	
	end
end