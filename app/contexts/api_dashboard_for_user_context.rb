class ApiDashboardForUserContext < ApiBaseContext

  def initialize(user_id)
    super
  end

  def execute
    { surveys: Checklist.for_user(@user_id).count, incidences: rand(100) }
  end
end
