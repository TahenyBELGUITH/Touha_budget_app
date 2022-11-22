class SpendingsController < ApplicationController
  before_action :set_spending

  def index; end

  def show; end

  private

  def set_spending
    @spending = Spending.find(params[:id])
  end
end
