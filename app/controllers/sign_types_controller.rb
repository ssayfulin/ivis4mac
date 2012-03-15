class SignTypesController < ApplicationController
  # GET /sign_types
  # GET /sign_types.json
  def index
    @sign_types = SignType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sign_types }
    end
  end

  # GET /sign_types/1
  # GET /sign_types/1.json
  def show
    @sign_type = SignType.get(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sign_type }
    end
  end

  # GET /sign_types/new
  # GET /sign_types/new.json
  def new
    @sign_type = SignType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sign_type }
    end
  end

  # GET /sign_types/1/edit
  def edit
    @sign_type = SignType.get(params[:id])
  end

  # POST /sign_types
  # POST /sign_types.json
  def create
    @sign_type = SignType.new(params[:sign_type])

    respond_to do |format|
      if @sign_type.save
        format.html { redirect_to @sign_type, notice: 'Sign type was successfully created.' }
        format.json { render json: @sign_type, status: :created, location: @sign_type }
      else
        format.html { render action: "new" }
        format.json { render json: @sign_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sign_types/1
  # PUT /sign_types/1.json
  def update
    @sign_type = SignType.get(params[:id])

    respond_to do |format|
      if @sign_type.update(params[:sign_type])
        format.html { redirect_to @sign_type, notice: 'Sign type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sign_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sign_types/1
  # DELETE /sign_types/1.json
  def destroy
    @sign_type = SignType.get(params[:id])
    @sign_type.destroy

    respond_to do |format|
      format.html { redirect_to sign_types_url }
      format.json { head :no_content }
    end
  end
end
