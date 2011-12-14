class Reservation < ActiveRecord::Base
  
  belongs_to :book
  belongs_to :user
  
  delegate :email, to: :user
  
  before_validation :make_reserved, :on => :create
  
  STATES = %w( free reserved )
  
  validates :book_id, :presence  => true
  validates :user_id, presence: true
  validates :state,   :inclusion => { :in => STATES }

  validates :book_id, :uniqueness => { 
                          :scope => :state, 
                          :message => 'book has been already reserved' 
                      }, 
                      :if => "state == 'reserved'"
                      
  def free(user)
    if self.user_id == user.id
      self.update_attributes({state: 'free'})
    else
      return false
    end
  end
  
  private

  def make_reserved
    self.state = 'reserved'
  end
  
end
