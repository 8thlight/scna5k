class RunnersController < ApplicationController
  # GET /runners
  # GET /runners.xml
  def index
    @runners = all_runners

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @runners }
    end
  end

  # GET /runners/new
  # GET /runners/new.xml
  def new
    @runner = Runner.new

    unless logged_in
      redirect_to root_url
      return
    end

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @runner }
    end
  end

  # GET /runners/1/edit
  def edit
    @runner = Runner.find(params[:id])

    unless logged_in
      redirect_to root_url
      return
    end
  end

  # POST /runners
  # POST /runners.xml
  def create
    unless logged_in
      redirect_to root_url
      return
    end

    @runner = Runner.new(params[:runner])

    respond_to do |format|
      if @runner.save
        format.html { redirect_to(admin_index_url, :notice => 'Runner was successfully created.') }
        format.xml  { render :xml => @runner, :status => :created, :location => @runner }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @runner.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /runners/1
  # PUT /runners/1.xml
  def update
    unless logged_in
      redirect_to root_url
      return
    end

    @runner = Runner.find(params[:id])

    respond_to do |format|
      if @runner.update_attributes(params[:runner])
        format.html { redirect_to(admin_index_url, :notice => 'Runner was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @runner.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /runners/1
  # DELETE /runners/1.xml
  def destroy
    unless logged_in
      redirect_to root_url
      return
    end

    @runner = Runner.find(params[:id])
    @runner.destroy

    respond_to do |format|
      format.html { redirect_to(admin_index_url) }
      format.xml  { head :ok }
    end
  end
end
