class Book < ActiveRecord::Base

	has_attached_file :thumb, :styles => { :medium => "200x200>", :thumb => "90x90>" }, :defualt_url => "/images/:style/nada.png"
	validates_attachment_content_type :thumb, :content_type => /\Aimage\/.*\Z/


end
