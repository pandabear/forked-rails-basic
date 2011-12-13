class Comment < ActiveRecord::Base
  belongs_to :book

  validates :name, :presence => true, :length => 20
  validates :content, :presence => true, :length => 200
end
