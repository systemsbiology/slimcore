require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/lab_groups/new.html.erb" do
  include LabGroupsHelper
  
  before(:each) do
    assigns[:lab_group] = stub_model(LabGroup,
      :new_record? => true,
      :name => "value for name",
      :file_folder => "value for file_folder",
      :lock_version => 1
    )
  end

  it "should render new form" do
    render "/lab_groups/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", lab_groups_path) do
      with_tag("input#lab_group_name[name=?]", "lab_group[name]")
      with_tag("input#lab_group_file_folder[name=?]", "lab_group[file_folder]")
      with_tag("input#lab_group_lock_version[name=?]", "lab_group[lock_version]")
    end
  end
end


