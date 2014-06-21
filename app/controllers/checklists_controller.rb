class ChecklistsController < ApplicationController
  def index
    @checklists = Checklist.for_user(current_user.id)
  end

  def new
    @checklist = Checklist.new

    @checklist.check_items << CheckItem.new
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
end
