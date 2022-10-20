class PagesController < ApplicationController
    def home
    end
    def dashboard
        @users = User.all
        @projects = Project.all
        @developers = UserProject.all
        @manager_project = @projects.where(created_by_id: current_user.id).count
        @developer_project = @developers.where(developer_id: current_user.id).count
        @qa_project = @projects.where(qa_id: current_user.id).count
    end
    
end
