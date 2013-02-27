class User < ActiveRecord::Base
  attr_accessible :email, :fullname, :metadata, :name, :password, :phone
  
  validates :name, :presence => true, :uniqueness => true, :length => { :maximum => 50 }, :format => { :with => /^[A-Za-z\d_]+$/, :message => "can only be alphanumeric with no spaces." }
  validates :fullname, :presence => true, :length => { :maximum => 100 }
  validates :phone, :presence => true
  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
  
end
