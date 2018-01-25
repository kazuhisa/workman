class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
    @group.users.build
  end

  def edit
    @group.users.build
  end

  def create
    @group = Group.new(group_params)

    if add_row_request?
      @group.users.build
      render :new
      return
    end

    if @group.save
      redirect_to @group, notice: '登録しました。'
    else
      render :new
    end
  end

  def update
    @group.attributes = group_params
    if add_row_request?
      @group.users.build
      render :edit
      return
    end

    if @group.save
      redirect_to @group, notice: '更新しました。'
    else
      render :edit
    end
  end

  def destroy
    @group.destroy
    redirect_to groups_url, notice: '削除しました。'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:group).permit(:name, :content, users_attributes: [:name, :age, :id])
    end

    def add_row_request?
      params.keys.include?('add_row')
    end

end
