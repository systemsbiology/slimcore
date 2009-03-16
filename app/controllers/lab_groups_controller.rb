class LabGroupsController < ApplicationController
  # GET /lab_groups
  # GET /lab_groups.xml
  def index
    @lab_groups = LabGroup.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @lab_groups }
    end
  end

  # GET /lab_groups/1
  # GET /lab_groups/1.xml
  def show
    @lab_group = LabGroup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @lab_group }
    end
  end

  # GET /lab_groups/new
  # GET /lab_groups/new.xml
  def new
    @lab_group = LabGroup.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @lab_group }
    end
  end

  # GET /lab_groups/1/edit
  def edit
    @lab_group = LabGroup.find(params[:id])
  end

  # POST /lab_groups
  # POST /lab_groups.xml
  def create
    @lab_group = LabGroup.new(params[:lab_group])

    respond_to do |format|
      if @lab_group.save
        flash[:notice] = 'LabGroup was successfully created.'
        format.html { redirect_to(@lab_group) }
        format.xml  { render :xml => @lab_group, :status => :created, :location => @lab_group }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @lab_group.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /lab_groups/1
  # PUT /lab_groups/1.xml
  def update
    @lab_group = LabGroup.find(params[:id])

    respond_to do |format|
      if @lab_group.update_attributes(params[:lab_group])
        flash[:notice] = 'LabGroup was successfully updated.'
        format.html { redirect_to(@lab_group) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @lab_group.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /lab_groups/1
  # DELETE /lab_groups/1.xml
  def destroy
    @lab_group = LabGroup.find(params[:id])
    @lab_group.destroy

    respond_to do |format|
      format.html { redirect_to(lab_groups_url) }
      format.xml  { head :ok }
    end
  end
end
