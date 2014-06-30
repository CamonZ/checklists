class ChecklistsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_checklist, only: [:edit, :update, :show]
  def index
    @checklists = Checklist.for_user(current_user.id)
  end

  def new
    @checklist = Checklist.new

    @checklist.check_items << CheckItem.new
  end

  def edit
    render template: 'checklists/new'
  end

  def show
  end

  def create
    ctx = CreatingANewChecklistContext.new(params, current_user.id)
    @checklist = ctx.create
    if @checklist
      redirect_to checklists_path 
    else
      render :new
    end
  end

  def update
    @checklist.update_attributes(update_params)
    redirect_to checklists_path
  end

  private

  def set_checklist
    @checklist = Checklist.where(id: params[:id]).first
  end

  def update_params
    params.require(:checklist).
      permit(:name, :description, check_items_attributes: [:id, :question, :type])
  end
end
