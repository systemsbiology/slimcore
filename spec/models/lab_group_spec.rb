require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe LabGroup do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :lock_version => 1,
      :created_at => Time.now,
      :updated_at => Time.now
    }
  end

  it "should create a new instance given valid attributes" do
    LabGroup.create!(@valid_attributes)
  end
end
