class SubjectsController < ApplicationController
  before_action :set_subject, only: [:show, :edit, :update, :destroy]

  # GET /subjects
  # GET /subjects.json
  def index
    @subjects = Subject.all
  end

  # GET /subjects/1
  # GET /subjects/1.json
  def show
  end

  # GET /subjects/new
  def new
    @subject = Subject.new
    @subjects = Subject.all
    session[:notenplan_id] = params[:notenplan]
  end

  # GET /subjects/1/edit
  def edit
  end

  # POST /subjects
  # POST /subjects.json
  def create
    subject_params[:name].each do |subject_name|
      if (subject_name != "")
        subject = Subject.find_or_create_by(name: subject_name)
        Mark.find_or_create_by(notenplan_id: session[:notenplan_id], subject: subject)
      end
    end
    notenplan = Notenplan.find_by(id: session[:notenplan_id])
    redirect_to notenplan, notice: 'Das Fach wurde erfolgreich erstellt.'
  end

  # PATCH/PUT /subjects/1
  # PATCH/PUT /subjects/1.json
  def update
    respond_to do |format|
      if @subject.update(subject_params)
        format.html { redirect_to @subject, notice: 'Das Fach wurde erfolgreich geändert.' }
        format.json { render :show, status: :ok, location: @subject }
      else
        format.html { render :edit }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subjects/1
  # DELETE /subjects/1.json
  def destroy
    @subject.destroy
    respond_to do |format|
      format.html { redirect_to subjects_url, notice: 'Das Fach wurde erfolgreich gelöscht.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subject
      @subject = Subject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subject_params
      params.require(:subject).permit(:number,:name => [])
    end
end
