require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/lab_groups/edit.html.erb" do
  
  before(:each) do
    assigns[:lab_group] = @lab_group = stub_model(LabGroup,
      :new_record? => false,
      :name => "value for name",
      :lock_version => 1
    )
  end

  it "should render edit form" do
    render "/lab_groups/edit.html.erb"
    
    response.should have_tag("form[action=#{lab_group_path(@lab_group)}][method=post]") do
      with_tag('input#lab_group_name[name=?]', "lab_group[name]")
      with_tag('input#lab_group_lock_version[name=?]', "lab_group[lock_version]")
    end
  end
end


