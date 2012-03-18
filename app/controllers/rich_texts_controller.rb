class RichTextsController < ApplicationController
  # GET /rich_texts
  # GET /rich_texts.json
  def index
    @rich_texts = RichText.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @rich_texts }
    end
  end

  # GET /rich_texts/1
  # GET /rich_texts/1.json
  def show
    @rich_text = RichText.get(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @rich_text }
    end
  end

  # GET /rich_texts/new
  # GET /rich_texts/new.json
  def new
    @rich_text = RichText.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @rich_text }
    end
  end

  # GET /rich_texts/1/edit
  def edit
    @rich_text = RichText.get(params[:id])
  end

  # POST /rich_texts
  # POST /rich_texts.json
  def create
    @rich_text = RichText.new(params[:rich_text])

    respond_to do |format|
      if @rich_text.save
        format.html { redirect_to @rich_text, notice: 'Rich text was successfully created.' }
        format.json { render json: @rich_text, status: :created, location: @rich_text }
      else
        format.html { render action: "new" }
        format.json { render json: @rich_text.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /rich_texts/1
  # PUT /rich_texts/1.json
  def update
    @rich_text = RichText.get(params[:id])

    respond_to do |format|
      if @rich_text.update(params[:rich_text])
        format.html { redirect_to @rich_text, notice: 'Rich text was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @rich_text.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rich_texts/1
  # DELETE /rich_texts/1.json
  def destroy
    @rich_text = RichText.get(params[:id])
    @rich_text.destroy

    respond_to do |format|
      format.html { redirect_to rich_texts_url }
      format.json { head :no_content }
    end
  end
end
