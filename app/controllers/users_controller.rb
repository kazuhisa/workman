class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :set_group

  def new
    @user = User.new
  end

  def create
    @user = @group.users.build(user_params)
    if @user.save
      redirect_to group_user_path(@group, @user), notice: '登録しました。'
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to group_user_path(@group, @user), notice: '更新しました。'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to group_path(@group), notice: '削除しました。'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def set_group
      @group = Group.find(params[:group_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :age)
    end
end
