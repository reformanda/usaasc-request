class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction

  # GET /requests
  # GET /requests.json
  def index
    @sort_column = sort_column
    if current_user.try(:admin?)
      @requests = Request.order(sort_column + " " + sort_direction)
    else
      @requests = Request.where("email = ?", current_user.email).order(sort_column + " " + sort_direction)
    end
  end

  # GET /requests/1
  # GET /requests/1.json
  def show
  end

  # GET /requests/new
  def new
    @request = Request.new
  end

  # GET /requests/1/edit
  def edit
  end

  # POST /requests
  # POST /requests.json
  def create
    @request = Request.new(request_params)

    respond_to do |format|
      if @request.save
        format.html { redirect_to @request, notice: 'Request was successfully created.' }
        format.json { render :show, status: :created, location: @request }
      else
        format.html { render :new }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /requests/1
  # PATCH/PUT /requests/1
  # PATCH/PUT /requests/1.json
  def update
    respond_to do |format|
      if @request.update(request_params)
        format.html { redirect_to @request, notice: 'Request was successfully updated.' }
        format.json { render :show, status: :ok, location: @request }
      else
        format.html { render :edit }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy
    @request.destroy
    respond_to do |format|
      format.html { redirect_to requests_url, notice: 'Request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end




  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find(params[:id])
      if !show_request
        redirect_to requests_url, notice: "Request not found."
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_params
      params.require(:request).permit(:name, :email, :phone, :other_phone, :laptop_issue, :laptop_desc, :software_issue, :software_desc, :blackberry_issue, :blackberry_desc, :email_issue, :email_desc, :pst_issue, :pst_desc, :shared_folder_issue, :shared_folder_desc, :other_hardware_issue, :other_hardware_desc, :air_card_issue, :air_card_desc, :other_issue, :other_issue)
    end

    def show_request
      current_user.try(:admin?) || @request.email == current_user.email
    end

    def sort_column
      Request.column_names.include?(params[:sort]) ? params[:sort] : "name"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end


end
