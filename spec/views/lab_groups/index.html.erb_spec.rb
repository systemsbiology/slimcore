require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/lab_groups/index.html.erb" do
  
  before(:each) do
    assigns[:lab_groups] = [
      stub_model(LabGroup,
        :name => "value for name",
        :file_folder => "value for file_folder",
        :lock_version => 1
      ),
      stub_model(LabGroup,
        :name => "value for name",
        :file_folder => "value for file_folder",
        :lock_version => 1
      )
    ]
  end

  it "should render list of lab_groups" do
    render "/lab_groups/index.html.erb"
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", "value for file_folder".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end

