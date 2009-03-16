require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe LabMembershipsController do

  def mock_lab_membership(stubs={})
    @mock_lab_membership ||= mock_model(LabMembership, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all lab_memberships as @lab_memberships" do
      LabMembership.should_receive(:find).with(:all).and_return([mock_lab_membership])
      get :index
      assigns[:lab_memberships].should == [mock_lab_membership]
    end

    describe "with mime type of xml" do
  
      it "should render all lab_memberships as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        LabMembership.should_receive(:find).with(:all).and_return(lab_memberships = mock("Array of LabMemberships"))
        lab_memberships.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested lab_membership as @lab_membership" do
      LabMembership.should_receive(:find).with("37").and_return(mock_lab_membership)
      get :show, :id => "37"
      assigns[:lab_membership].should equal(mock_lab_membership)
    end
    
    describe "with mime type of xml" do

      it "should render the requested lab_membership as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        LabMembership.should_receive(:find).with("37").and_return(mock_lab_membership)
        mock_lab_membership.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new lab_membership as @lab_membership" do
      LabMembership.should_receive(:new).and_return(mock_lab_membership)
      get :new
      assigns[:lab_membership].should equal(mock_lab_membership)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested lab_membership as @lab_membership" do
      LabMembership.should_receive(:find).with("37").and_return(mock_lab_membership)
      get :edit, :id => "37"
      assigns[:lab_membership].should equal(mock_lab_membership)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created lab_membership as @lab_membership" do
        LabMembership.should_receive(:new).with({'these' => 'params'}).and_return(mock_lab_membership(:save => true))
        post :create, :lab_membership => {:these => 'params'}
        assigns(:lab_membership).should equal(mock_lab_membership)
      end

      it "should redirect to the created lab_membership" do
        LabMembership.stub!(:new).and_return(mock_lab_membership(:save => true))
        post :create, :lab_membership => {}
        response.should redirect_to(lab_membership_url(mock_lab_membership))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved lab_membership as @lab_membership" do
        LabMembership.stub!(:new).with({'these' => 'params'}).and_return(mock_lab_membership(:save => false))
        post :create, :lab_membership => {:these => 'params'}
        assigns(:lab_membership).should equal(mock_lab_membership)
      end

      it "should re-render the 'new' template" do
        LabMembership.stub!(:new).and_return(mock_lab_membership(:save => false))
        post :create, :lab_membership => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested lab_membership" do
        LabMembership.should_receive(:find).with("37").and_return(mock_lab_membership)
        mock_lab_membership.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :lab_membership => {:these => 'params'}
      end

      it "should expose the requested lab_membership as @lab_membership" do
        LabMembership.stub!(:find).and_return(mock_lab_membership(:update_attributes => true))
        put :update, :id => "1"
        assigns(:lab_membership).should equal(mock_lab_membership)
      end

      it "should redirect to the lab_membership" do
        LabMembership.stub!(:find).and_return(mock_lab_membership(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(lab_membership_url(mock_lab_membership))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested lab_membership" do
        LabMembership.should_receive(:find).with("37").and_return(mock_lab_membership)
        mock_lab_membership.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :lab_membership => {:these => 'params'}
      end

      it "should expose the lab_membership as @lab_membership" do
        LabMembership.stub!(:find).and_return(mock_lab_membership(:update_attributes => false))
        put :update, :id => "1"
        assigns(:lab_membership).should equal(mock_lab_membership)
      end

      it "should re-render the 'edit' template" do
        LabMembership.stub!(:find).and_return(mock_lab_membership(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested lab_membership" do
      LabMembership.should_receive(:find).with("37").and_return(mock_lab_membership)
      mock_lab_membership.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the lab_memberships list" do
      LabMembership.stub!(:find).and_return(mock_lab_membership(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(lab_memberships_url)
    end

  end

end
