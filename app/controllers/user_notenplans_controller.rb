class UserNotenplansController < ApplicationController
  before_action :set_user_notenplan, only: [:show, :edit, :update, :destroy]

  # GET /user_notenplans
  # GET /user_notenplans.json
  def index
    @user_notenplans = UserNotenplan.all
  end

  # GET /user_notenplans/1
  # GET /user_notenplans/1.json
  def show
  end

  # GET /user_notenplans/new
  def new
    @notenplan_id = params[:notenplan_id]
    @user_notenplan = UserNotenplan.new
  end

  # GET /user_notenplans/1/edit
  def edit
  end

  # POST /user_notenplans
  # POST /user_notenplans.json
  def create
    user = User.find_by(email: user_notenplan_params[:user_id])
    if (!user.nil?)
      @user_notenplan = UserNotenplan.find_or_create_by(notenplan_id: user_notenplan_params[:notenplan_id], user_id: user.id)
      notenplan = Notenplan.find_by(id: user_notenplan_params[:notenplan_id])
      respond_to do |format|
        if @user_notenplan.save
          format.html { redirect_to notenplan, notice: 'User notenplan was successfully created.' }
          format.json { render :show, status: :created, location: @user_notenplan }
        else
          format.html { render :new, notenplan_id: user_notenplan_params[:notenplan_id] }
          format.json { render json: @user_notenplan.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to new_user_notenplan_path, notenplan_id: user_notenplan_params[:notenplan_id], notice: 'User wurde nicht gefunden'
    end
  end

  # PATCH/PUT /user_notenplans/1
  # PATCH/PUT /user_notenplans/1.json
  def update
    respond_to do |format|
      if @user_notenplan.update(user_notenplan_params)
        format.html { redirect_to @user_notenplan, notice: 'User notenplan was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_notenplan }
      else
        format.html { render :edit }
        format.json { render json: @user_notenplan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_notenplans/1
  # DELETE /user_notenplans/1.json
  def destroy
    @user_notenplan.destroy
    respond_to do |format|
      format.html { redirect_to user_notenplans_url, notice: 'User notenplan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_notenplan
      @user_notenplan = UserNotenplan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_notenplan_params
      params.require(:user_notenplan).permit(:user_id, :notenplan_id)
    end
end
