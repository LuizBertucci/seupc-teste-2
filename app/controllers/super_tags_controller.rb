class SuperTagsController < ApplicationController
  skip_after_action :verify_authorized
  before_action :find_super_tag, only: [:show, :edit, :update, :destroy]

    
  def index
    @super_tags = super_tag.all.order(created_at: :asc)
  end
  
  def new
    @super_tag = SuperTag.new
  end

  def create
    @super_tag = SuperTag.new(super_tag_params)
    
    if @super_tag.save
      flash[:success] = "super_tag successfully created"
      redirect_to list_notebooks_path
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def edit
    
  end
  

  def update
    if @super_tag.update(super_tag_params)
      raise

      @super_tag.super_taggings.destroy_all unless @super_tag.super_taggings.nil?

      @ranking = (1..params[:super_tag][:rank].to_i).to_a
      
      @ranking.each do |rank|
        notebook = Notebook.find_by(position: rank)
        super_tagging.create!(notebook_id: notebook.id, super_tag_id: @super_tag.id)      
      end    

      flash[:success] = "Object was successfully updated"
      redirect_to list_notebooks_path
    else
      flash[:error] = "Something went wrong"
      render 'edit'
      end
  end
  
  def destroy
    @user = current_user
    authorize @user

    @super_tag.super_taggings.destroy_all unless @super_tag.super_taggings.nil?

    @super_tag.destroy
    redirect_to list_notebooks_path
  end

  private

  def find_super_tag
    @super_tag = SuperTag.find(params[:id])
  end

  def super_tag_params
    params.require(:super_tag).permit(:name)
  end
end

