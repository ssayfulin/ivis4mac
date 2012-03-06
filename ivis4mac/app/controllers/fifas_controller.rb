class FifasController < ApplicationController
  # GET /fifas
  # GET /fifas.json
  def index
    @fifas = Fifa.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @fifas }
    end
  end

  # GET /fifas/1
  # GET /fifas/1.json
  def show
    @fifa = Fifa.get(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @fifa }
    end
  end

  # GET /fifas/new
  # GET /fifas/new.json
  def new
    @fifa = Fifa.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @fifa }
    end
  end

  # GET /fifas/1/edit
  def edit
    @fifa = Fifa.get(params[:id])
  end

  # POST /fifas
  # POST /fifas.json
  def create
    @fifa = Fifa.new(params[:fifa])

    respond_to do |format|
      if @fifa.save
        format.html { redirect_to @fifa, notice: 'Fifa was successfully created.' }
        format.json { render json: @fifa, status: :created, location: @fifa }
      else
        format.html { render action: "new" }
        format.json { render json: @fifa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /fifas/1
  # PUT /fifas/1.json
  def update
    @fifa = Fifa.get(params[:id])

    respond_to do |format|
      if @fifa.update(params[:fifa])
        format.html { redirect_to @fifa, notice: 'Fifa was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @fifa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fifas/1
  # DELETE /fifas/1.json
  def destroy
    @fifa = Fifa.get(params[:id])
    @fifa.destroy

    respond_to do |format|
      format.html { redirect_to fifas_url }
      format.json { head :no_content }
    end
  end
end
