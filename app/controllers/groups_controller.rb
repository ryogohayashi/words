class GroupsController < ApplicationController
  def index
    @group = Group.all.order(created_at: "DESC").includes(:user)
    @groups = Group.new
  end

  # def new
  #   @groups = Group.new
  # end

  def create
    @group = Group.create(group_params)
    redirect_to groups_path
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    group = Group.find(params[:id])
    group.update(group_params)
    redirect_to groups_path
  end

  def destroy
    group = Group.find(params[:id])
    group.destroy
    redirect_to groups_path
  end

  private
  def group_params
    params.require(:group).permit(:name).merge(user_id: current_user.id)
  end

end
