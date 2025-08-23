class PaymentIntentsController < ApplicationController
  before_action :set_payment_intent, only: %i[ show edit update destroy ]

  # GET /payment_intents or /payment_intents.json
  def index
    @payment_intents = PaymentIntent.all
  end

  # GET /payment_intents/1 or /payment_intents/1.json
  def show
  end

  # GET /payment_intents/new
  def new
    @payment_intent = PaymentIntent.new
  end

  # GET /payment_intents/1/edit
  def edit
  end

  # POST /payment_intents or /payment_intents.json
  def create
    @payment_intent = PaymentIntent.new(payment_intent_params)

    respond_to do |format|
      if @payment_intent.save
        format.html { redirect_to @payment_intent, notice: "Payment intent was successfully created." }
        format.json { render :show, status: :created, location: @payment_intent }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @payment_intent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payment_intents/1 or /payment_intents/1.json
  def update
    respond_to do |format|
      if @payment_intent.update(payment_intent_params)
        format.html { redirect_to @payment_intent, notice: "Payment intent was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @payment_intent }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @payment_intent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payment_intents/1 or /payment_intents/1.json
  def destroy
    @payment_intent.destroy!

    respond_to do |format|
      format.html { redirect_to payment_intents_path, notice: "Payment intent was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment_intent
      @payment_intent = PaymentIntent.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def payment_intent_params
      params.require(:payment_intent).permit(:order_id, :provider, :amount, :status, :external_id, :payload)
    end
end
