class CreatingASurveyForUserContext < ApiBaseContext
  def initialize(user, params)
    super(user)
    @params = params
  end

  def execute
    survey = Survey.new(params_for_survey)
    survey.save
    survey
  end

  private

  def params_for_survey
    @params.
      require(:survey).
      permit(:checklist_id, check_item_results_attributes: [:check_item_id, :value]).
      merge({user_id: @user.id})
  end
end