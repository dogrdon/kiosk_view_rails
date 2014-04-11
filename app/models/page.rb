class Page < ActiveRecord::Base
  belongs_to :book

  has_attached_file :file, :styles => { :medium => "400x400>", :thumb => "100x100>" }, :defualt_url => "/public/images/nada.png"
  validates_attachment_content_type :file, :content_type => /\Aimage\/.*\Z/

end
