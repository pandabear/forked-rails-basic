class User < ActiveRecord::Base
  include Clearance::User
  has_many :reservations
  has_many :ratings
end
