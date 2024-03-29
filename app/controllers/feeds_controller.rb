# frozen_string_literal: true

class FeedsController < ApplicationController
  before_action :set_feed, only: %i[show edit update destroy]

  # GET /feeds
  # GET /feeds.json
  def index
    @feeds = Feed.chronologize.paginate(page: params[:page], per_page: 10)
  end

  # GET /feeds/1
  # GET /feeds/1.json
  def show; end

  # GET /feeds/new
  def new
    @feed = Feed.new
  end

  # GET /feeds/1/edit
  def edit; end

  # POST /feeds
  # POST /feeds.json
  def create
    @feed = Feed.new(feed_params)
    respond_to do |format|
      if @feed.needed_ingredients_quantity_in_stock?
        if @feed.save
          @feed.populate_ingredients_details_based_on_current_feed_formulation
          @feed.consume_ingredients_from_stock
          format.html { redirect_to @feed, notice: 'Feed was successfully created.' }
        else
          format.html { render :new }
        end
      else
        flash.now[:alert] = 'Not enough ingredients in stock. '
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /feeds/1
  # PATCH/PUT /feeds/1.json
  def update
    respond_to do |format|
      if @feed.update(feed_params)
        format.html { redirect_to @feed, notice: 'Feed was successfully updated.' }
        format.json { render :show, status: :ok, location: @feed }
      else
        format.html { render :edit }
        format.json { render json: @feed.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feeds/1
  # DELETE /feeds/1.json
  def destroy
    @feed.rollback_ingredients_consumption
    @feed.destroy
    respond_to do |format|
      format.html { redirect_to feeds_url, notice: 'Feed was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_feed
    @feed = Feed.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def feed_params
    params.require(:feed).permit(:date, :total_chickens,
                                 :feed_quantity_per_chicken, :batch_id, :days)
  end
end
