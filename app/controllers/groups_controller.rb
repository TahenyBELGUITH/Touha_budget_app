class GroupsController < ApplicationController
  before_action :set_group, only: %i[show edit update destroy]

  def index
    return unless current_user

    @user = current_user
    @groups = @user.groups.includes(:spendings)
  end

  def show
    @spendings = @group.spendings.order('created_at DESC')
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.user_id = current_user.id

    render :new unless @group.save

    redirect_to groups_path
  end

  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_path, notice: 'Category was successfully deleted!' }
    end
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
