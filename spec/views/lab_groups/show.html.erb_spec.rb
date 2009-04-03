require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/lab_groups/show.html.erb" do

  before(:each) do
    assigns[:lab_group] = @lab_group = stub_model(LabGroup,
      :name => "value for name",
      :lock_version => 1
    )
  end

  it "should render attributes in <p>" do
    render "/lab_groups/show.html.erb"
    response.should have_text(/value\ for\ name/)
    response.should have_text(/1/)
  end
end

