class DeliveryFeeRulesController < ApplicationController
  before_action :set_delivery_fee_rule, only: %i[ show edit update destroy ]

  # GET /delivery_fee_rules or /delivery_fee_rules.json
  def index
    @delivery_fee_rules = DeliveryFeeRule.all
  end

  # GET /delivery_fee_rules/1 or /delivery_fee_rules/1.json
  def show
  end

  # GET /delivery_fee_rules/new
  def new
    @delivery_fee_rule = DeliveryFeeRule.new
  end

  # GET /delivery_fee_rules/1/edit
  def edit
  end

  # POST /delivery_fee_rules or /delivery_fee_rules.json
  def create
    @delivery_fee_rule = DeliveryFeeRule.new(delivery_fee_rule_params)

    respond_to do |format|
      if @delivery_fee_rule.save
        format.html { redirect_to @delivery_fee_rule, notice: "Delivery fee rule was successfully created." }
        format.json { render :show, status: :created, location: @delivery_fee_rule }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @delivery_fee_rule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /delivery_fee_rules/1 or /delivery_fee_rules/1.json
  def update
    respond_to do |format|
      if @delivery_fee_rule.update(delivery_fee_rule_params)
        format.html { redirect_to @delivery_fee_rule, notice: "Delivery fee rule was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @delivery_fee_rule }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @delivery_fee_rule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /delivery_fee_rules/1 or /delivery_fee_rules/1.json
  def destroy
    @delivery_fee_rule.destroy!

    respond_to do |format|
      format.html { redirect_to delivery_fee_rules_path, notice: "Delivery fee rule was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_delivery_fee_rule
      @delivery_fee_rule = DeliveryFeeRule.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def delivery_fee_rule_params
      params.require(:delivery_fee_rule).permit(:restaurant_id, :min_km, :max_km, :fee)
    end
end
