class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def create
    if session["user_id"] != nil
    @task = Task.new
    @task["description"] = params["description"]
    @task.save
    end
    
    redirect_to "/tasks"
  end

  def destroy
    @task = Task.find_by({ "id" => params["id"] })
    @task.destroy
    redirect_to "/tasks"
  end
end
