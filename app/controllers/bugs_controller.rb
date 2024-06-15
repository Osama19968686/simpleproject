class BugsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_project
    before_action :set_bug, only: [:show, :edit, :update, :destroy]
    before_action :authorize_qa, only: [:new, :create]
  
    def index
      @bugs = @project.bugs
    end
  
    def show
    end
  
    def new
      @bug = @project.bugs.build
    end
  
    def create
      @bug = @project.bugs.build(bug_params)
      @bug.user_id = current_user
      if @bug.save
        BugMailer.bug_assigned(@bug).deliver_now
        redirect_to project_bug_path(@project, @bug), notice: 'Bug was successfully created.'
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @bug.update(bug_params)
        redirect_to project_bug_path(@project, @bug), notice: 'Bug was successfully updated.'
      else
        render :edit
      end
    end

    def remove_screenshot
      @bug.screenshot.purge
      redirect_to edit_project_bug_path(@project, @bug), notice: 'Screenshot was successfully removed.'
    end

    def destroy
      @bug.destroy
      redirect_to project_bugs_path(@project), notice: 'Bug was successfully destroyed.'
    end
  
    private
  
    def set_project
      @project = Project.find(params[:project_id])
    rescue ActiveRecord::RecordNotFound
      redirect_to project_bugs_path(@project), alert: "Bug not found."
    end
  
    def set_bug
      @bug = @project.bugs.find(params[:id])

    rescue ActiveRecord::RecordNotFound
      redirect_to project_bugs_path(@project), alert: "Bug not found."
    end
  
    def authorize_qa
      unless current_user.qa?
        redirect_to project_bugs_path(@project), alert: 'Only QA can report bugs.'
      end
    end
    

    def bug_params
      params.require(:bug).permit(:title, :description, :status, :screenshot,:assigned_to_id)
    end
  end
  