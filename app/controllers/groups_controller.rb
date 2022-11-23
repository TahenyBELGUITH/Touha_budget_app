class GroupsController < ApplicationController
  before_action :set_group, only: %i[show edit update destroy]

  def index
    @groups = Group.all
  end

  def show; end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    respond_to do |format|
      if @group.save
        format.html { redirect_to group_path(@group), notice: 'Category was added successfully' }
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to group_path(@group), notice: 'Category was updated successfully' }
      else
        render :edit, status: :unprocessable_entity
      end
    end
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
    params.require(:group).permit(:name, :icon, :user_id)
  end
end
