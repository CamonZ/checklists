class ApiDashboardForUserContext < ApiBaseContext

  def initialize(user)
    super
  end

  def execute
    { surveys: Checklist.for_user(@user.id).count, incidences: rand(100) }
  end
end
