class Book < ActiveRecord::Base

	#has_attached_file :disp_img, :styles => { :medium => "200x200>", :thumb => "90x90>" }, :defualt_url => "/images/:style/nada.png"
	#validates_attachment_content_type :disp_img, :content_type => /\Aimage\/.*\Z/


end
