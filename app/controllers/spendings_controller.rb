class SpendingsController < ApplicationController
  before_action :set_spending, only: %i[show edit update destroy]

  def index
    @spending = Group.all
  end

  def show; end

  def new
    @spending = Spending.new
  end

  def create
    @spending = Spending.new(spend_params)
    respond_to do |format|
      if @spending.save
        format.html { redirect_to spending_path(@spending), notice: 'Transaction was added successfully' }
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @spending.update(spend_params)
        format.html { redirect_to spending_path(@spending), notice: 'Transaction was updated successfully' }
      else
        render :edit, status: :unprocessable_entity
      end
    end
  end

  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to spendings_path, notice: 'Transaction was successfully deleted!' }
    end
  end

  def splash; end

  private

  def set_spending
    @spending = Spending.find(params[:id])
  end

  def spend_params
    params.require(:spending).permit(:name, :amount)
  end
end
