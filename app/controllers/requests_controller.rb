class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction
  has_scope :by_status

  # GET /requests
  # GET /requests.json
  def index
    @sort_column = sort_column
    @requests = apply_scopes(Request).all

    if current_user.try(:admin?) || current_user.approver? || current_user.worker?
      # show all requests
      @requests = @requests.order(sort_column + " " + sort_direction)
    else
      # show only requests for this user
      @requests = @requests.where("email = ?", current_user.email).order(sort_column + " " + sort_direction)
    end

    @issues = Issue.all
  end

  # GET /requests/1
  # GET /requests/1.json
  def show
    @issues = Issue.all
    @comments = @request.comments.recent.limit(10).all
  end

  # GET /requests/new
  def new
    @request = Request.new
    @request.name = current_user.name
    @request.email = current_user.email
    @request.phone = current_user.phone
    @request.other_phone = current_user.other_phone

    #commentable = Post.find(1)
    @request.comment = ''    

    @comments = @request.comments.recent.limit(10).all

    @issues = Issue.all
  end

  # GET /requests/1/edit
  def edit

    if current_user.user? &&  !@request.newrequest?
      redirect_to @request, notice: 'Request cannot be updated.' 
    end

    if current_user.worker? &&  !@request.approved?
      redirect_to @request, notice: 'Request cannot be updated until approved.' 
    end

    @issues = Issue.all
    @comments = @request.comments.recent.limit(10).all
    @disable_fields = current_user.approver? || current_user.worker?
  end

  # POST /requests
  # POST /requests.json
  def create
    params[:request][:issue_ids] ||= []
    params[:request][:email] ||= current_user.email
    params[:request][:name] ||= current_user.name
    @request = Request.new(request_params)


    respond_to do |format|

      if @request.save
        add_issues_to_request
        @request.newrequest!
        @request.approver!

        if !params[:request][:comment].empty?
          comment = @request.comments.create
          comment.comment = params[:request][:comment]
          comment.user_id = current_user.id
          comment.save
        end

        RequestMailer.notification_email(@request).deliver_later

        format.html { redirect_to @request, notice: 'Request was successfully created.' }
        format.json { render :show, status: :created, location: @request }

      else
        format.html { render :new }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /requests/1
  # PATCH/PUT /requests/1.json
  def update
    respond_to do |format|

      params[:request][:issue_ids] ||= []
      if @request.update(request_params)

        # save new comments
        if params[:request][:comment] != nil
          comment = @request.comments.create
          comment.comment = params[:request][:comment]
          comment.user_id = current_user.id
          comment.save
          # make sure updated_at gets updated
          @request.touch
        end
        
        if current_user.worker?
          if params[:status] == "approved"
            @request.approved!
          elsif params[:status] == "completed"
            @request.completed!
            @request.requester!
          end          
        elsif current_user.approver?
          p params[:status]
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
      params.require(:request).permit(:name, :email, :phone, :other_phone, :description, :subject, :status)
    end

    def show_request
      current_user.try(:admin?) || current_user.try(:approver?) || current_user.try(:worker?) || @request.email == current_user.email
    end

    def sort_column
      Request.column_names.include?(params[:sort]) ? params[:sort] : "updated_at"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
    end

    def add_issues_to_request
      issues = Issue.find params[:request][:issue_ids]
      @request.issues = issues
    end

end
