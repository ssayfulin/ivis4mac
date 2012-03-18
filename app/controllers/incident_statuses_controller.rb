class IncidentStatusesController < ApplicationController
  # GET /incident_statuses
  # GET /incident_statuses.json
  def index
    @incident_statuses = IncidentStatus.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @incident_statuses }
    end
  end

  # GET /incident_statuses/1
  # GET /incident_statuses/1.json
  def show
    @incident_status = IncidentStatus.get(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @incident_status }
    end
  end

  # GET /incident_statuses/new
  # GET /incident_statuses/new.json
  def new
    @incident_status = IncidentStatus.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @incident_status }
    end
  end

  # GET /incident_statuses/1/edit
  def edit
    @incident_status = IncidentStatus.get(params[:id])
  end

  # POST /incident_statuses
  # POST /incident_statuses.json
  def create
    @incident_status = IncidentStatus.new(params[:incident_status])

    respond_to do |format|
      if @incident_status.save
        format.html { redirect_to @incident_status, notice: 'Incident status was successfully created.' }
        format.json { render json: @incident_status, status: :created, location: @incident_status }
      else
        format.html { render action: "new" }
        format.json { render json: @incident_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /incident_statuses/1
  # PUT /incident_statuses/1.json
  def update
    @incident_status = IncidentStatus.get(params[:id])

    respond_to do |format|
      if @incident_status.update(params[:incident_status])
        format.html { redirect_to @incident_status, notice: 'Incident status was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @incident_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /incident_statuses/1
  # DELETE /incident_statuses/1.json
  def destroy
    @incident_status = IncidentStatus.get(params[:id])
    @incident_status.destroy

    respond_to do |format|
      format.html { redirect_to incident_statuses_url }
      format.json { head :no_content }
    end
  end
end
