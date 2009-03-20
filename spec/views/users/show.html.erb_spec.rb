require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/users/show.html.erb" do

  before(:each) do
    assigns[:user] = @user = stub_model(User,
      :login => "value for login",
      :email => "value for email",
      :firstname => "value for firstname",
      :lastname => "value for lastname",
      :lock_version => 1
    )
  end

  it "should render attributes in <p>" do
    render "/users/show.html.erb"
    response.should have_text(/value\ for\ login/)
    response.should have_text(/value\ for\ email/)
    response.should have_text(/value\ for\ firstname/)
    response.should have_text(/value\ for\ lastname/)
    response.should have_text(/1/)
  end
end

