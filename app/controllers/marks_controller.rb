class MarksController < ApplicationController
  before_action :set_mark, only: [:show, :edit, :update, :destroy]



  # GET /marks/1
  # GET /marks/1.json
  def show
  end

  # GET /marks/new
  def new
    if admin_access(Notenplan.find_by(id: params[:notenplan_id]))
      @mark = Mark.new
      @notenplan_id = params[:notenplan_id]
      @subject_id = params[:subject_id]
    else
      redirect_to notenplans_path, notice: "Keine Berechtigung"
    end
  end

  # GET /marks/1/edit
  def edit
    if admin_access(Notenplan.find_by(id: params[:notenplan_id]))
      @notenplan_id = params[:notenplan_id]
      @subject_id = params[:subject_id]
    else
      redirect_to notenplans_path, notice: "Keine Berechtigung"
    end
  end

  # POST /marks
  # POST /marks.json
  def create
    if admin_access(Notenplan.find_by(id: mark_params[:notenplan_id]))
      @mark = Mark.new(mark_params)
      respond_to do |format|
        if @mark.save
          format.html { redirect_to Notenplan.find_by(id: mark_params[:notenplan_id]), notice: 'Note erfolgreich erstellt.' }
          format.json { render :show, status: :created, location: @mark }
        else
          format.html { render :new }
          format.json { render json: @mark.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to notenplans_path, notice: "Keine Berechtigung"
    end
  end

  # PATCH/PUT /marks/1
  # PATCH/PUT /marks/1.json
  def update
    respond_to do |format|
      if @mark.update(mark_params)
        format.html { redirect_to @mark, notice: 'Note erfolgreich geändert.' }
        format.json { render :show, status: :ok, location: @mark }
      else
        format.html { render :edit }
        format.json { render json: @mark.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /marks/1
  # DELETE /marks/1.json
  def destroy
    @mark.destroy
    respond_to do |format|
      format.html { redirect_to notenplans_path, notice: 'Note erfolgreich gelöscht.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mark
      @mark = Mark.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mark_params
      params.require(:mark).permit(:mark, :weighting, :shorttest, :notenplan_id, :subject_id)
    end
end
