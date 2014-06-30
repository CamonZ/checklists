class ApiChecklistForUserContext < ApiBaseContext
  def initialize(user_id, checklist_id)
    super(user_id)
    @checklist_id = checklist_id
  end

  def execute
    Checklist.
      where(:id => @checklist_id, user_id: @user_id).
      select(:id, :name, :description).
      includes(:check_items).
      first    
  end
end