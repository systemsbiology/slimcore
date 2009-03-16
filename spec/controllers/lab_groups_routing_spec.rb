require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe LabGroupsController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "lab_groups", :action => "index").should == "/lab_groups"
    end
  
    it "should map #new" do
      route_for(:controller => "lab_groups", :action => "new").should == "/lab_groups/new"
    end
  
    it "should map #show" do
      route_for(:controller => "lab_groups", :action => "show", :id => 1).should == "/lab_groups/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "lab_groups", :action => "edit", :id => 1).should == "/lab_groups/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "lab_groups", :action => "update", :id => 1).should == "/lab_groups/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "lab_groups", :action => "destroy", :id => 1).should == "/lab_groups/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/lab_groups").should == {:controller => "lab_groups", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/lab_groups/new").should == {:controller => "lab_groups", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/lab_groups").should == {:controller => "lab_groups", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/lab_groups/1").should == {:controller => "lab_groups", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/lab_groups/1/edit").should == {:controller => "lab_groups", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/lab_groups/1").should == {:controller => "lab_groups", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/lab_groups/1").should == {:controller => "lab_groups", :action => "destroy", :id => "1"}
    end
  end
end
