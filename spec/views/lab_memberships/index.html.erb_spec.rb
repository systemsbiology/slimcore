require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/lab_memberships/index.html.erb" do
  include LabMembershipsHelper
  
  before(:each) do
    assigns[:lab_memberships] = [
      stub_model(LabMembership),
      stub_model(LabMembership)
    ]
  end

  it "should render list of lab_memberships" do
    render "/lab_memberships/index.html.erb"
  end
end

