require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/lab_memberships/edit.html.erb" do
  include LabMembershipsHelper
  
  before(:each) do
    assigns[:lab_membership] = @lab_membership = stub_model(LabMembership,
      :new_record? => false
    )
  end

  it "should render edit form" do
    render "/lab_memberships/edit.html.erb"
    
    response.should have_tag("form[action=#{lab_membership_path(@lab_membership)}][method=post]") do
    end
  end
end


