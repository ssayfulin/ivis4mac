class IncidentMapsController < ApplicationController
  # GET /incident_maps
  # GET /incident_maps.json
  def index
    @incident_maps = IncidentMap.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @incident_maps }
    end
  end

  # GET /incident_maps/1
  # GET /incident_maps/1.json
  def show
    @incident_map = IncidentMap.get(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @incident_map }
    end
  end

  # GET /incident_maps/new
  # GET /incident_maps/new.json
  def new
    @incident_map = IncidentMap.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @incident_map }
    end
  end

  # GET /incident_maps/1/edit
  def edit
    @incident_map = IncidentMap.get(params[:id])
  end

  # POST /incident_maps
  # POST /incident_maps.json
  def create
    @incident_map = IncidentMap.new(params[:incident_map])

    respond_to do |format|
      if @incident_map.save
        format.html { redirect_to @incident_map, notice: 'Incident map was successfully created.' }
        format.json { render json: @incident_map, status: :created, location: @incident_map }
      else
        format.html { render action: "new" }
        format.json { render json: @incident_map.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /incident_maps/1
  # PUT /incident_maps/1.json
  def update
    @incident_map = IncidentMap.get(params[:id])

    respond_to do |format|
      if @incident_map.update(params[:incident_map])
        format.html { redirect_to @incident_map, notice: 'Incident map was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @incident_map.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /incident_maps/1
  # DELETE /incident_maps/1.json
  def destroy
    @incident_map = IncidentMap.get(params[:id])
    @incident_map.destroy

    respond_to do |format|
      format.html { redirect_to incident_maps_url }
      format.json { head :no_content }
    end
  end
end
