class TasksController < ApplicationController
  skip_before_action :verify_authenticity_token
  # def create 
  #   pp params
  #   @new_task = Repository.create_new_task(cookies[:gen_token],task_params )
  #   if @new_task
  #     head :ok, { msg: "Successfully Saved" }
  #   else
  #     head :precondition_failed, { msg: "Failed to save new Task" }
  #   end 
  # end

  def my_tasks
    @logged_account = Account.find_by( "authentication_token": cookies[:gen_token])
    pp @logged_account
    @tasks = Task.all
    @filtered = []

    @tasks.each do | obj| 
      if obj.account_ID == @logged_account.id
        @filtered.push(obj)
      end
    end
    
    render json: @filtered 
  end
  
  private 

  def task_params
    params.require(:entry).permit(:category_ID, :task_title, :task_description, :task_deadline, :task_created, :journal_ID)   
  end
end