class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction

  # GET /requests
  # GET /requests.json
  def index
    @sort_column = sort_column
    if current_user.try(:admin?) || current_user.approver? || current_user.worker?
      # show all requests
      @requests = Request.order(sort_column + " " + sort_direction)
    else
      # show only requests for this user
      @requests = Request.where("email = ?", current_user.email).order(sort_column + " " + sort_direction)
    end
    @issues = Issue.all
  end

  # GET /requests/1
  # GET /requests/1.json
  def show
    @issues = Issue.all
  end

  # GET /requests/new
  def new
    @request = Request.new
    @request.name = current_user.name
    @request.email = current_user.email
    @request.phone = current_user.phone
    @request.other_phone = current_user.other_phone
    @issues = Issue.all
  end

  # GET /requests/1/edit
  def edit
    @issues = Issue.all
    @disable_fields = current_user.approver? || current_user.worker?
  end

  # POST /requests
  # POST /requests.json
  def create
    params[:request][:issue_ids] ||= []
    @request = Request.new(request_params)

    respond_to do |format|

      if @request.save
        add_issues_to_request
        @request.newrequest!
        @request.approver!
        RequestMailer.notification_email(@request).deliver_later

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

      params[:request][:issue_ids] ||= []
      if @request.update(request_params)
        if current_user.worker?
          
        elsif current_user.approver?
          if params[:status] == "approved"
            @request.approved!
            @request.worker!
          elsif params[:status] == "disapproved"
            @request.disapproved!
            @request.requester!
          end
        else
           add_issues_to_request 
        end
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
      params.require(:request).permit(:name, :email, :phone, :other_phone, :description)
    end

    def show_request
      current_user.try(:admin?) || current_user.approver? || current_user.worker? || @request.email == current_user.email
    end

    def sort_column
      Request.column_names.include?(params[:sort]) ? params[:sort] : "name"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end

    def add_issues_to_request
      issues = Issue.find params[:request][:issue_ids]
      @request.issues = issues
    end

end
