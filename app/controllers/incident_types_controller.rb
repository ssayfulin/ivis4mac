class IncidentTypesController < ApplicationController
  # GET /incident_types
  # GET /incident_types.json
  def index
    @incident_types = IncidentType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @incident_types }
    end
  end

  # GET /incident_types/1
  # GET /incident_types/1.json
  def show
    @incident_type = IncidentType.get(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @incident_type }
    end
  end

  # GET /incident_types/new
  # GET /incident_types/new.json
  def new
    @incident_type = IncidentType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @incident_type }
    end
  end

  # GET /incident_types/1/edit
  def edit
    @incident_type = IncidentType.get(params[:id])
  end

  # POST /incident_types
  # POST /incident_types.json
  def create
    @incident_type = IncidentType.new(params[:incident_type])

    respond_to do |format|
      if @incident_type.save
        format.html { redirect_to @incident_type, notice: 'Incident type was successfully created.' }
        format.json { render json: @incident_type, status: :created, location: @incident_type }
      else
        format.html { render action: "new" }
        format.json { render json: @incident_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /incident_types/1
  # PUT /incident_types/1.json
  def update
    @incident_type = IncidentType.get(params[:id])

    respond_to do |format|
      if @incident_type.update(params[:incident_type])
        format.html { redirect_to @incident_type, notice: 'Incident type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @incident_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /incident_types/1
  # DELETE /incident_types/1.json
  def destroy
    @incident_type = IncidentType.get(params[:id])
    @incident_type.destroy

    respond_to do |format|
      format.html { redirect_to incident_types_url }
      format.json { head :no_content }
    end
  end
end
