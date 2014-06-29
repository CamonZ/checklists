class ApiSurveysForUserContext < ApiBaseContext
  def initialize(user_id)
    super
  end

  def execute
    Checklists.where(user_id: @user_id).select(:id, :name, :description).all
  end
end