class ApiChecklistForUserContext < ApiBaseContext
  def initialize(user_id, survey_id)
    super(user_id)
    @survey_id = survey_id
  end

  def execute
    Checklist.
      where(:id => @survey_id, user_id: @user_id).
      select(:id, :name, :description).
      includes(:check_items).
      first    
  end
end