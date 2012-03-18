class PoliceStatementsController < ApplicationController
  # GET /police_statements
  # GET /police_statements.json
  def index
    @police_statements = PoliceStatement.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @police_statements }
    end
  end

  # GET /police_statements/1
  # GET /police_statements/1.json
  def show
    @police_statement = PoliceStatement.get(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @police_statement }
    end
  end

  # GET /police_statements/new
  # GET /police_statements/new.json
  def new
    @police_statement = PoliceStatement.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @police_statement }
    end
  end

  # GET /police_statements/1/edit
  def edit
    @police_statement = PoliceStatement.get(params[:id])
  end

  # POST /police_statements
  # POST /police_statements.json
  def create
    @police_statement = PoliceStatement.new(params[:police_statement])

    respond_to do |format|
      if @police_statement.save
        format.html { redirect_to @police_statement, notice: 'Police statement was successfully created.' }
        format.json { render json: @police_statement, status: :created, location: @police_statement }
      else
        format.html { render action: "new" }
        format.json { render json: @police_statement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /police_statements/1
  # PUT /police_statements/1.json
  def update
    @police_statement = PoliceStatement.get(params[:id])

    respond_to do |format|
      if @police_statement.update(params[:police_statement])
        format.html { redirect_to @police_statement, notice: 'Police statement was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @police_statement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /police_statements/1
  # DELETE /police_statements/1.json
  def destroy
    @police_statement = PoliceStatement.get(params[:id])
    @police_statement.destroy

    respond_to do |format|
      format.html { redirect_to police_statements_url }
      format.json { head :no_content }
    end
  end
end
