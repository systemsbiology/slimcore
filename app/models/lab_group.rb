class LabGroup < ActiveRecord::Base
  has_many :lab_memberships, :dependent => :destroy
  has_many :users, :through => :lab_memberships

  validates_uniqueness_of :name
end
