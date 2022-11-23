class SpendingsController < ApplicationController
  def new
    @spending = Spending.new
  end

  def create
    @groups = params[:spending][:group_id].drop(1)
    @groups.each do |group|
      @spending = Spending.new(name: params[:spending][:name], amount: params[:spending][:amount],
                               group_id: group.to_i, user_id: current_user.id)
      @spending.save
    end
    redirect_to group_path(@groups.first.to_i)
  end

  private

  def spending_params
    params.require(:spending).permit(:group_id, :amount, :name)
  end
end
