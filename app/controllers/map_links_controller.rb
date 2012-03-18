class MapLinksController < ApplicationController
  # GET /map_links
  # GET /map_links.json
  def index
    @map_links = MapLink.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @map_links }
    end
  end

  # GET /map_links/1
  # GET /map_links/1.json
  def show
    @map_link = MapLink.get(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @map_link }
    end
  end

  # GET /map_links/new
  # GET /map_links/new.json
  def new
    @map_link = MapLink.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @map_link }
    end
  end

  # GET /map_links/1/edit
  def edit
    @map_link = MapLink.get(params[:id])
  end

  # POST /map_links
  # POST /map_links.json
  def create
    @map_link = MapLink.new(params[:map_link])

    respond_to do |format|
      if @map_link.save
        format.html { redirect_to @map_link, notice: 'Map link was successfully created.' }
        format.json { render json: @map_link, status: :created, location: @map_link }
      else
        format.html { render action: "new" }
        format.json { render json: @map_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /map_links/1
  # PUT /map_links/1.json
  def update
    @map_link = MapLink.get(params[:id])

    respond_to do |format|
      if @map_link.update(params[:map_link])
        format.html { redirect_to @map_link, notice: 'Map link was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @map_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /map_links/1
  # DELETE /map_links/1.json
  def destroy
    @map_link = MapLink.get(params[:id])
    @map_link.destroy

    respond_to do |format|
      format.html { redirect_to map_links_url }
      format.json { head :no_content }
    end
  end
end
