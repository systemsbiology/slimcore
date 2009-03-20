require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/lab_memberships/show.html.erb" do

  before(:each) do
    assigns[:lab_membership] = @lab_membership = stub_model(LabMembership)
  end

  it "should render attributes in <p>" do
    render "/lab_memberships/show.html.erb"
  end
end

