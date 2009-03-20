require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/users/index.html.erb" do
  
  before(:each) do
    assigns[:users] = [
      stub_model(User,
        :login => "value for login",
        :email => "value for email",
        :firstname => "value for firstname",
        :lastname => "value for lastname",
        :lock_version => 1
      ),
      stub_model(User,
        :login => "value for login",
        :email => "value for email",
        :firstname => "value for firstname",
        :lastname => "value for lastname",
        :lock_version => 1
      )
    ]
  end

  it "should render list of users" do
    render "/users/index.html.erb"
    response.should have_tag("tr>td", "value for login".to_s, 2)
    response.should have_tag("tr>td", "value for email".to_s, 2)
    response.should have_tag("tr>td", "value for firstname".to_s, 2)
    response.should have_tag("tr>td", "value for lastname".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end

