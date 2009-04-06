class LabMembership < ActiveRecord::Base
  belongs_to :lab_group
  belongs_to :user

  validates_associated :lab_group
  validates_associated :user

  validates_uniqueness_of :user_id, :scope => :lab_group_id
end
