class NotenplansController < ApplicationController
  before_action :authenticate_user!
  before_action :set_notenplan, only: [:show, :edit, :update, :destroy]

  # GET /notenplans
  # GET /notenplans.json
  def index
    @notenplans = Notenplan.all
  end

  # GET /notenplans/1
  # GET /notenplans/1.json
  def show
  end

  # GET /notenplans/new
  def new
    @notenplan = Notenplan.new
  end

  # GET /notenplans/1/edit
  def edit
  end

  # POST /notenplans
  # POST /notenplans.json
  def create
    @notenplan = Notenplan.new(notenplan_params)

    respond_to do |format|
      if @notenplan.save
        format.html { redirect_to @notenplan, notice: 'Notenplan was successfully created.' }
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
        format.html { redirect_to @notenplan, notice: 'Notenplan was successfully updated.' }
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
      format.html { redirect_to notenplans_url, notice: 'Notenplan was successfully destroyed.' }
      format.json { head :no_content }
    end
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