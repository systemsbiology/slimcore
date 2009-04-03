require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe LabGroupsController do

  def mock_lab_group(stubs={})
    @mock_lab_group ||= mock_model(LabGroup, stubs)
  end
  
  describe "responding to GET index" do

    describe "without any parameters" do

      it "should expose all lab_groups as @lab_groups" do
        LabGroup.should_receive(:find).with(:all).and_return([mock_lab_group])
        get :index
        assigns[:lab_groups].should == [mock_lab_group]
      end

      describe "with mime type of xml" do
    
        it "should render all lab_groups as xml" do
          request.env["HTTP_ACCEPT"] = "application/xml"
          LabGroup.should_receive(:find).with(:all).
            and_return(lab_groups = mock("Array of LabGroups"))
          lab_groups.should_receive(:to_xml).and_return("generated XML")
          get :index
          response.body.should == "generated XML"
        end
      
      end

    end

    describe "with a 'user_id' parameter" do

      it "should expose all lab_groups with the specified user_id as @lab_groups" do
        LabGroup.should_receive(:find).
          with(:all, :include => :lab_memberships, :conditions => ["lab_memberships.user_id = ?", "3"]).
            and_return([mock_lab_group])
        get :index, :user_id => 3
        assigns[:lab_groups].should == [mock_lab_group]
      end

      describe "with mime type of xml" do
    
        it "should render all lab_groups with the specified user_id as xml" do
          request.env["HTTP_ACCEPT"] = "application/xml"
          LabGroup.should_receive(:find).
            with(:all, :include => :lab_memberships, :conditions => ["lab_memberships.user_id = ?", "3"]).
            and_return(lab_groups = mock("Array of LabGroups"))
          lab_groups.should_receive(:to_xml).and_return("generated XML")
          get :index, :user_id => 3
          response.body.should == "generated XML"
        end
      
      end      

    end

    describe "with a 'name' parameter" do

      it "should expose the lab_group with the specified name" do
        LabGroup.should_receive(:find).
          with(:all, :conditions => {:name => "Yeast Group"}).
          and_return([mock_lab_group])
        get :index, :name => "Yeast Group"
        assigns[:lab_groups].should == [mock_lab_group]
      end

      describe "with mime type of xml" do
    
        it "should render all lab_groups with the specified user_id as xml" do
          request.env["HTTP_ACCEPT"] = "application/xml"
          LabGroup.should_receive(:find).
            with(:all, :conditions => {:name => "Yeast Group"}).
            and_return(lab_groups = [mock_lab_group])
          lab_groups.should_receive(:to_xml).and_return("generated XML")
          get :index, :name => "Yeast Group"
          response.body.should == "generated XML"
        end
      
      end      

    end
  end

  describe "responding to GET show" do

    it "should expose the requested lab_group as @lab_group" do
      LabGroup.should_receive(:find).with("37").and_return(mock_lab_group)
      get :show, :id => "37"
      assigns[:lab_group].should equal(mock_lab_group)
    end
    
    describe "with mime type of xml" do

      it "should render the requested lab_group as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        LabGroup.should_receive(:find).with("37").and_return(mock_lab_group)
        mock_lab_group.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new lab_group as @lab_group" do
      LabGroup.should_receive(:new).and_return(mock_lab_group)
      get :new
      assigns[:lab_group].should equal(mock_lab_group)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested lab_group as @lab_group" do
      LabGroup.should_receive(:find).with("37").and_return(mock_lab_group)
      get :edit, :id => "37"
      assigns[:lab_group].should equal(mock_lab_group)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created lab_group as @lab_group" do
        LabGroup.should_receive(:new).with({'these' => 'params'}).and_return(mock_lab_group(:save => true))
        post :create, :lab_group => {:these => 'params'}
        assigns(:lab_group).should equal(mock_lab_group)
      end

      it "should redirect to the created lab_group" do
        LabGroup.stub!(:new).and_return(mock_lab_group(:save => true))
        post :create, :lab_group => {}
        response.should redirect_to(lab_group_url(mock_lab_group))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved lab_group as @lab_group" do
        LabGroup.stub!(:new).with({'these' => 'params'}).and_return(mock_lab_group(:save => false))
        post :create, :lab_group => {:these => 'params'}
        assigns(:lab_group).should equal(mock_lab_group)
      end

      it "should re-render the 'new' template" do
        LabGroup.stub!(:new).and_return(mock_lab_group(:save => false))
        post :create, :lab_group => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested lab_group" do
        LabGroup.should_receive(:find).with("37").and_return(mock_lab_group)
        mock_lab_group.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :lab_group => {:these => 'params'}
      end

      it "should expose the requested lab_group as @lab_group" do
        LabGroup.stub!(:find).and_return(mock_lab_group(:update_attributes => true))
        put :update, :id => "1"
        assigns(:lab_group).should equal(mock_lab_group)
      end

      it "should redirect to the lab_group" do
        LabGroup.stub!(:find).and_return(mock_lab_group(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(lab_group_url(mock_lab_group))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested lab_group" do
        LabGroup.should_receive(:find).with("37").and_return(mock_lab_group)
        mock_lab_group.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :lab_group => {:these => 'params'}
      end

      it "should expose the lab_group as @lab_group" do
        LabGroup.stub!(:find).and_return(mock_lab_group(:update_attributes => false))
        put :update, :id => "1"
        assigns(:lab_group).should equal(mock_lab_group)
      end

      it "should re-render the 'edit' template" do
        LabGroup.stub!(:find).and_return(mock_lab_group(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested lab_group" do
      LabGroup.should_receive(:find).with("37").and_return(mock_lab_group)
      mock_lab_group.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the lab_groups list" do
      LabGroup.stub!(:find).and_return(mock_lab_group(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(lab_groups_url)
    end

  end

end
