class TagsController < ApplicationController
  skip_after_action :verify_authorized
  before_action :find_tag, only: [:show, :edit, :update, :destroy]

    
  def index
    @tags = Tag.all.order(created_at: :asc)
  end
  
  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      flash[:success] = "tag successfully created"
      redirect_to list_notebooks_path
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def edit
    
  end
  

  def update
    if @tag.update(tag_params)

      @tag.taggings.destroy_all unless @tag.taggings.nil?

      @ranking = (1..params[:tag][:rank].to_i).to_a
      
      @ranking.each do |rank|
        notebook = Notebook.find_by(position: rank)
        Tagging.create!(notebook_id: notebook.id, tag_id: @tag.id)      
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

    @tag.taggings.destroy_all unless @tag.taggings.nil?

    @tag.destroy
    redirect_to list_notebooks_path
  end
  private

  def find_tag
    @tag = Tag.find(params[:id])
  end

  def tag_params
    params.require(:tag).permit(:name, :rank)
  end
end
