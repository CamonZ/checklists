class ApiChecklistsForUserContext < ApiBaseContext
  def initialize(user)
    super
  end

  def execute
    Checklist.for_user(@user).select(:id, :name, :description).all
  end
end