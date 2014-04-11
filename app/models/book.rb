class Book < ActiveRecord::Base

	has_many :pages, dependent: :destroy

	has_attached_file :thumb, :styles => { :medium => "200x200>", :thumb => "90x90>" }, :defualt_url => "/public/images/nada.png"
	validates_attachment_content_type :thumb, :content_type => /\Aimage\/.*\Z/

	validates :title, presence: true,
								length: {minimum: 2}


end
