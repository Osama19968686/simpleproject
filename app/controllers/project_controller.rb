class ProjectController < ApplicationController

def index
@projects=Project.all
end

def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to @project, notice: 'Project was successfully created.'
    else
      render :new
    end
  end

def project_params
params.require(:project).permit(:name, :description)
end

def new
@project = Project.new
end


end