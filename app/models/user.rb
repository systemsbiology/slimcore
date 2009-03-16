class User < ActiveRecord::Base
  has_many :lab_memberships, :dependent => :destroy
  has_many :lab_groups, :through => :lab_memberships
end
