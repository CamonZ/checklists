class CreatingANewChecklistContext

  def initialize(params, user_id)
    @params = params
    @user_id = user_id
  end

  def create
    checklist = Checklist.new accepted_param_values
    checklist.user_id = @user_id
    checklist.save
    checklist
  end
  

  def accepted_param_values
    @params.require(:checklist).permit(:name)
  end
end