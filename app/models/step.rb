class Step < ActiveRecord::Base
  has_attached_file :picture, styles: { medium: "200x200>" }
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/
  
  belongs_to :recipe

  validates :description, presence: true
end
