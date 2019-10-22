class ShadesController < ApplicationController
  before_action :set_shade, only: [:show, :edit, :update, :destroy]

  # GET /shades
  # GET /shades.json
  def index
    @shades = Shade.all
  end

  # GET /shades/1
  # GET /shades/1.json
  def show
  end

  # GET /shades/new
  def new
    @shade = Shade.new
  end

  # GET /shades/1/edit
  def edit
  end

  # POST /shades
  # POST /shades.json
  def create
    @shade = Shade.new(shade_params)

    respond_to do |format|
      if @shade.save
        format.html { redirect_to @shade, notice: 'Shade was successfully created.' }
        format.json { render :show, status: :created, location: @shade }
      else
        format.html { render :new }
        format.json { render json: @shade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shades/1
  # PATCH/PUT /shades/1.json
  def update
    respond_to do |format|
      if @shade.update(shade_params)
        format.html { redirect_to @shade, notice: 'Shade was successfully updated.' }
        format.json { render :show, status: :ok, location: @shade }
      else
        format.html { render :edit }
        format.json { render json: @shade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shades/1
  # DELETE /shades/1.json
  def destroy
    @shade.destroy
    respond_to do |format|
      format.html { redirect_to shades_url, notice: 'Shade was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shade
      @shade = Shade.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shade_params
      params.require(:shade).permit(:name, :branch_id)
    end
end
