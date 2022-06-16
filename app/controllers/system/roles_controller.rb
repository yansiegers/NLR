# frozen_string_literal: true

module System
  class RolesController < ::EngineersDashboardController
    before_action :find_role, only: %i[edit update destroy]

    def index
      @roles = Role.all
    end

    def new
      @role = Role.new
    end

    def create
      @role = Role.new(role_params)
      if @role.save
        flash[:success] = 'Role successfully created'
        redirect_to system_roles_path
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit; end

    def update
      if @role.update(role_params)
        flash[:success] = 'Role was successfully updated'
        redirect_to system_roles_path
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      if @role.destroy
        flash[:success] = 'Role was successfully deleted'
        redirect_to system_roles_path
      else
        flash[:error] = 'Something went wrong'
        redirect_to system_roles_path
      end
    end

    private

    def role_params
      params.require(:role)
            .permit(:name, :utility_name)
    end

    def find_role
      @role = Role.find(params[:id])
    end
  end
end
