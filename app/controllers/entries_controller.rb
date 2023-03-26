class EntriesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create_task
    pp params
    @new_task = Repository.create_new_task(cookies[:gen_token],task_params )
    if @new_task
      head :ok, { msg: "Successfully Saved" }
    else
      head :precondition_failed, { msg: "Failed to save new Task" }
    end 
  end
  private
  def task_params
    params.require(:entry).permit(:category_ID, :task_title, :task_description, :task_deadline, :task_created, :journal_ID)   
  end
end