# frozen_string_literal: true

class WorkspacesController < ApplicationController
  before_action :find_workspace, only: %i[show edit update destroy]

  def index
    @workspaces = Workspace.all
  end

  def show; end

  def new
    @workspace = Workspace.new
  end

  def create
    @workspace = Workspace.new(workspace_params)
    if @workspace.save
      flash[:success] = 'Workspace successfully created'
      redirect_to workspaces_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @workspace.update(workspace_params)
      flash[:success] = 'Workspace was successfully updated'
      redirect_to workspaces_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @workspace.destroy
      flash[:success] = 'Workspace was successfully deleted'
      redirect_to workspaces_path
    else
      flash[:error] = 'Something went wrong'
      redirect_to workspaces_path
    end
  end

  private

  def workspace_params
    params.require(:workspace)
          .permit(
            :name,
            :favorite,
            :user_id,
            graph_ids: []
          )
  end

  def find_workspace
    @workspace = Workspace.find(params[:id])
  end
end
