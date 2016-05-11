class NotenplansController < ApplicationController
  before_action :authenticate_user!
  before_action :set_notenplan, only: [:show, :edit, :update, :destroy]

  # GET /notenplans
  # GET /notenplans.json
  def index
    @notenplans = current_user.notenplans.all
  end

  # GET /notenplans/1
  # GET /notenplans/1.json
  def show
    if access_allowed
      @subjects = []
      special_marks = @notenplan.marks.where(mark: nil)
      special_marks.each do |special_mark|
          @subjects << {subject: special_mark.subject, marks:  @notenplan.marks.where(subject_id: special_mark.subject.id)}
      end
    else
      redirect_to notenplans_path, notice: 'Sie dürfen nicht auf diesen Notenplan zugreifen'
    end
  end

  # GET /notenplans/new
  def new
    @notenplan = Notenplan.new
  end

  # GET /notenplans/1/edit
  def edit
    if (!admin_access(@notenplan))
      redirect_to notenplans_path, notice: 'Sie dürfen diesen Notenplan nicht bearbeiten'
    end
  end

  # POST /notenplans
  # POST /notenplans.json
  def create
    @notenplan = Notenplan.create(name: notenplan_params['name'], description: notenplan_params['description'], owner: current_user)
    @userNotenplan = UserNotenplan.create(notenplan: @notenplan, user: current_user, admin: true)

    respond_to do |format|
      if @notenplan.valid? && @userNotenplan.valid?
        format.html { redirect_to new_subject_path(notenplan: @notenplan), notice: 'Notenplan wurde erfolgreich erstellt.' }
        format.json { render :show, status: :created, location: @notenplan }
      else
        format.html { render :new }
        format.json { render json: @notenplan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notenplans/1
  # PATCH/PUT /notenplans/1.json
  def update
    respond_to do |format|
      if @notenplan.update(notenplan_params)
        format.html { redirect_to @notenplan, notice: 'Notenplan wurde erfolgreich geändert.' }
        format.json { render :show, status: :ok, location: @notenplan }
      else
        format.html { render :edit }
        format.json { render json: @notenplan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notenplans/1
  # DELETE /notenplans/1.json
  def destroy
    @notenplan.destroy
    respond_to do |format|
      format.html { redirect_to notenplans_url, notice: 'Notenplan wurde erfolgreich gelöscht.' }
      format.json { head :no_content }
    end
  end

  def access_allowed
    current_user.notenplans.each do |notenplan|
        if notenplan == @notenplan
          return true
        end
    end
    return false
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notenplan
      @notenplan = Notenplan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def notenplan_params
      params.require(:notenplan).permit(:name, :description)
    end
end
