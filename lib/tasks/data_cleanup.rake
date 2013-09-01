desc "Delete old Locations"
task :del_locations => :environment do
	puts "Number of Locations in DB: #{Location.all.count}"
	Location.all.map(&:destroy)
	puts "Number of Locations in DB: #{Location.all.count}"	
end