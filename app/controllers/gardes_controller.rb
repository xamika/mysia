class GardesController < ApplicationController
  before_action :set_garde, only: [:show, :edit, :update, :destroy]

  # GET /gardes
  # GET /gardes.json
  def index
    @gardes = Garde.all
  end

  # GET /gardes/1
  # GET /gardes/1.json
  def show
  end

  # GET /gardes/new
  def new
    @garde = Garde.new
  end

  # GET /gardes/1/edit
  def edit
  end

  # POST /gardes
  # POST /gardes.json
  def create
    @garde = Garde.new(garde_params)

    respond_to do |format|
      if @garde.save
        format.html { redirect_to @garde, notice: 'Garde was successfully created.' }
        format.json { render :show, status: :created, location: @garde }
      else
        format.html { render :new }
        format.json { render json: @garde.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gardes/1
  # PATCH/PUT /gardes/1.json
  def update
    respond_to do |format|
      if @garde.update(garde_params)
        format.html { redirect_to @garde, notice: 'Garde was successfully updated.' }
        format.json { render :show, status: :ok, location: @garde }
      else
        format.html { render :edit }
        format.json { render json: @garde.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gardes/1
  # DELETE /gardes/1.json
  def destroy
    @garde.destroy
    respond_to do |format|
      format.html { redirect_to gardes_url, notice: 'Garde was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_garde
      @garde = Garde.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def garde_params
      params.require(:garde).permit(:notenplan_id, :subject_id, :garde, :weighting, :shorttest)
    end
end
