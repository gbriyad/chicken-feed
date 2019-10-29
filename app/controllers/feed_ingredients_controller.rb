class FeedIngredientsController < ApplicationController
  before_action :set_feed_ingredient, only: [:show, :edit, :update, :destroy]

  # GET /feed_ingredients
  # GET /feed_ingredients.json
  def index
    @feed_ingredients = FeedIngredient.all
  end

  # GET /feed_ingredients/1
  # GET /feed_ingredients/1.json
  def show
  end

  # GET /feed_ingredients/new
  def new
    @feed_ingredient = FeedIngredient.new
  end

  # GET /feed_ingredients/1/edit
  def edit
  end

  # POST /feed_ingredients
  # POST /feed_ingredients.json
  def create
    @feed_ingredient = FeedIngredient.new(feed_ingredient_params)

    respond_to do |format|
      if @feed_ingredient.save
        format.html { redirect_to @feed_ingredient, notice: 'Feed ingredient was successfully created.' }
        format.json { render :show, status: :created, location: @feed_ingredient }
      else
        format.html { render :new }
        format.json { render json: @feed_ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /feed_ingredients/1
  # PATCH/PUT /feed_ingredients/1.json
  def update
    respond_to do |format|
      if @feed_ingredient.update(feed_ingredient_params)
        format.html { redirect_to @feed_ingredient, notice: 'Feed ingredient was successfully updated.' }
        format.json { render :show, status: :ok, location: @feed_ingredient }
      else
        format.html { render :edit }
        format.json { render json: @feed_ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feed_ingredients/1
  # DELETE /feed_ingredients/1.json
  def destroy
    @feed_ingredient.destroy
    respond_to do |format|
      format.html { redirect_to feed_ingredients_url, notice: 'Feed ingredient was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feed_ingredient
      @feed_ingredient = FeedIngredient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def feed_ingredient_params
      params.require(:feed_ingredient).permit(:feed_id, :ingredient_id, :price, :quantity)
    end
end
