class FileLinksController < ApplicationController
  load_and_authorize_resource

  # GET /file_links
  # GET /file_links.json
  def index
    @file_links = FileLink.all
  end

  # GET /file_links/1
  # GET /file_links/1.json
  def show
  end

  # GET /file_links/new
  def new
    @file_link = FileLink.new
  end

  # GET /file_links/1/edit
  def edit
  end

  # POST /file_links
  # POST /file_links.json
  def create
    @file_link = FileLink.new(file_link_params)

    respond_to do |format|
      if @file_link.save
        format.html { redirect_to @file_link, notice: 'File link was successfully created.' }
        format.json { render action: 'show', status: :created, location: @file_link }
      else
        format.html { render action: 'new' }
        format.json { render json: @file_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /file_links/1
  # PATCH/PUT /file_links/1.json
  def update
    respond_to do |format|
      if @file_link.update(file_link_params)
        format.html { redirect_to @file_link, notice: 'File link was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @file_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /file_links/1
  # DELETE /file_links/1.json
  def destroy
    @file_link.destroy
    respond_to do |format|
      format.html { redirect_to file_links_url }
      format.json { head :no_content }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def file_link_params
      params.require(:file_link).permit(:type, :url, :user_id)
    end
end
