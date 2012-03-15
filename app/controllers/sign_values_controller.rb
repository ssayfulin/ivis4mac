class SignValuesController < ApplicationController
  # GET /sign_values
  # GET /sign_values.json
  def index
    @sign_values = SignValue.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sign_values }
    end
  end

  # GET /sign_values/1
  # GET /sign_values/1.json
  def show
    @sign_value = SignValue.get(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sign_value }
    end
  end

  # GET /sign_values/new
  # GET /sign_values/new.json
  def new
    @sign_value = SignValue.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sign_value }
    end
  end

  # GET /sign_values/1/edit
  def edit
    @sign_value = SignValue.get(params[:id])
  end

  # POST /sign_values
  # POST /sign_values.json
  def create
    @sign_value = SignValue.new(params[:sign_value])

    respond_to do |format|
      if @sign_value.save
        format.html { redirect_to @sign_value, notice: 'Sign value was successfully created.' }
        format.json { render json: @sign_value, status: :created, location: @sign_value }
      else
        format.html { render action: "new" }
        format.json { render json: @sign_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sign_values/1
  # PUT /sign_values/1.json
  def update
    @sign_value = SignValue.get(params[:id])

    respond_to do |format|
      if @sign_value.update(params[:sign_value])
        format.html { redirect_to @sign_value, notice: 'Sign value was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sign_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sign_values/1
  # DELETE /sign_values/1.json
  def destroy
    @sign_value = SignValue.get(params[:id])
    @sign_value.destroy

    respond_to do |format|
      format.html { redirect_to sign_values_url }
      format.json { head :no_content }
    end
  end
end
