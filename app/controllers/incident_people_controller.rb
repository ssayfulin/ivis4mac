class IncidentPeopleController < ApplicationController
  # GET /incident_people
  # GET /incident_people.json
  def index
    @incident_people = IncidentPerson.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @incident_people }
    end
  end

  # GET /incident_people/1
  # GET /incident_people/1.json
  def show
    @incident_person = IncidentPerson.get(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @incident_person }
    end
  end

  # GET /incident_people/new
  # GET /incident_people/new.json
  def new
    @incident_person = IncidentPerson.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @incident_person }
    end
  end

  # GET /incident_people/1/edit
  def edit
    @incident_person = IncidentPerson.get(params[:id])
  end

  # POST /incident_people
  # POST /incident_people.json
  def create
    @incident_person = IncidentPerson.new(params[:incident_person])

    respond_to do |format|
      if @incident_person.save
        format.html { redirect_to @incident_person, notice: 'Incident person was successfully created.' }
        format.json { render json: @incident_person, status: :created, location: @incident_person }
      else
        format.html { render action: "new" }
        format.json { render json: @incident_person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /incident_people/1
  # PUT /incident_people/1.json
  def update
    @incident_person = IncidentPerson.get(params[:id])

    respond_to do |format|
      if @incident_person.update(params[:incident_person])
        format.html { redirect_to @incident_person, notice: 'Incident person was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @incident_person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /incident_people/1
  # DELETE /incident_people/1.json
  def destroy
    @incident_person = IncidentPerson.get(params[:id])
    @incident_person.destroy

    respond_to do |format|
      format.html { redirect_to incident_people_url }
      format.json { head :no_content }
    end
  end
end
