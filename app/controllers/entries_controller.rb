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

  def delete_task
    @remove_task = Repository.delete_single_task(cookies[:gen_token],taskid_params)

    if @remove_task
      head :ok, { msg: "Tasked Deleted Successfully" }
    else
      head :precondition_failed, { msg: "Failed to delete Task try again later" }
    end 
  end

  def edit_task
    
    # @target_task = Task.find( edittask_params['task_ID'],)
    # pp @target_task
  pp
    @update_task = Repository.modify_single_task(cookies[:gen_token],edittask_params)
    if @update_task
      head :ok, { msg: "Tasked Updated Successfully" }
    else
      head :precondition_failed, { msg: "Failed to update please check your values and try again" }
    end 
  end

  private
  def task_params
    params.require(:entry).permit(:category_ID, :task_title, :task_description, :task_deadline, :task_created, :journal_ID)   
  end

  def taskid_params
    params.require(:entry).permit(:task_ID)   
  end

  def edittask_params
    params.require(:entry).permit(:task_ID, :category_ID, :task_title, :task_description)   
  end
end