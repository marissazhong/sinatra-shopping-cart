class User < ActiveRecord::Base
  has_many :carts
  has_secure_password
  include Slug::InstanceMethods
end
