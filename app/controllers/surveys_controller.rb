class SurveysController < ApplicationController
  def index
    @checklist = Checklist.for_user(current_user).where(id: params[:checklist_id]).first
    @surveys = Survey.where(checklist_id: params[:checklist_id], user_id: current_user.id).all
  end

  def show
    @survey = Survey.where(id: params[:id], checklist_id: params[:checklist_id], user_id: current_user.id).first
  end
end