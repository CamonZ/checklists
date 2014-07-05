class ApiChecklistForUserContext < ApiBaseContext
  def initialize(user, checklist_id)
    super(user)
    @checklist_id = checklist_id
  end

  def execute
    Checklist.for_user(@user).
      where(:id => @checklist_id).
      select(:id, :name, :description).
      includes(:check_items).
      first
  end
end