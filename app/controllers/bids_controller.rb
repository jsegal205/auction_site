class BidsController < ApplicationController
  before_action :set_bid, only: %i[ show edit update destroy ]
  before_action :set_item

  # GET /bids or /bids.json
  def index
    @bids = Bid.all
  end

  # GET /bids/1 or /bids/1.json
  def show
  end

  # GET /bids/new
  def new
    @bid = Bid.new
  end

  # GET /bids/1/edit
  def edit
  end

  # POST /bids or /bids.json
  def create
    @bid = @item.bids.build(bid_params)
    @bid.user = current_user

    if @bid.save
      redirect_to @item, notice: "Your bid has been placed successfully."
    else
      # Set both @bids and @bid for the re-rendered form
      pp @bid.errors
      @bids = @item.bids.order(amount: :desc)
      render "items/show", status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bids/1 or /bids/1.json
  def update
    respond_to do |format|
      if @bid.update(bid_params)
        format.html { redirect_to @bid, notice: "Bid was successfully updated." }
        format.json { render :show, status: :ok, location: @bid }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bid.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bids/1 or /bids/1.json
  def destroy
    @bid.destroy!

    respond_to do |format|
      format.html { redirect_to bids_path, status: :see_other, notice: "Bid was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bid
      @bid = Bid.find(params[:id])
    end

    def set_item
      @item = Item.find(params[:item_id])
    end

    # Only allow a list of trusted parameters through.
    def bid_params
      params.require(:bid).permit(:amount)
    end
end
