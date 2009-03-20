require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/users/new.html.erb" do
  
  before(:each) do
    assigns[:user] = stub_model(User,
      :new_record? => true,
      :login => "value for login",
      :email => "value for email",
      :firstname => "value for firstname",
      :lastname => "value for lastname",
      :lock_version => 1
    )
  end

  it "should render new form" do
    render "/users/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", users_path) do
      with_tag("input#user_login[name=?]", "user[login]")
      with_tag("input#user_email[name=?]", "user[email]")
      with_tag("input#user_firstname[name=?]", "user[firstname]")
      with_tag("input#user_lastname[name=?]", "user[lastname]")
      with_tag("input#user_lock_version[name=?]", "user[lock_version]")
    end
  end
end


