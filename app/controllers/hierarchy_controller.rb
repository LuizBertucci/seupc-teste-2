class HierarchyController < ApplicationController
  def show
    @user = current_user
    authorize @user
  end
end
