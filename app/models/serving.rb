class Serving < ActiveRecord::Base
  belongs_to :product

  validates :name, presence: true, format: { with: /\A[\w\-\s]+\z/, message: 'only allows letters!' }

end
