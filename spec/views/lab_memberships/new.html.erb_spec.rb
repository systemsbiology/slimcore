require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/lab_memberships/new.html.erb" do
  
  before(:each) do
    assigns[:lab_membership] = stub_model(LabMembership,
      :new_record? => true
    )
  end

  it "should render new form" do
    render "/lab_memberships/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", lab_memberships_path) do
    end
  end
end


