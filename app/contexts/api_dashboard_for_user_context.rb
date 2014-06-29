class ApiDashboardForUserContext 

  def initialize(user_id)
    @user_id = user_id
  end

  def execute
    { surveys: Checklist.for_user(@user_id).count, incidences: rand(100) }
  end
end
