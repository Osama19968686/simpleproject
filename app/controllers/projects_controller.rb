class ProjectsController < ApplicationController
  before_action :authenticate_user!

def index
@projects=Project.all
end

def create
  @project = current_user.projects.build(project_params)

    if @project.save
      redirect_to @project, notice: 'Project was successfully created.'
    else
      render :new
    end
  end

  def show
    @project = Project.find(params[:id])
  end

def project_params
params.require(:project).permit(:name, :description)
end

def new
@project = Project.new
end


end