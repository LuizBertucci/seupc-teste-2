class NotebooksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :find_notebook, only: [:show, :edit, :update]

  def index
  @notebooks = policy_scope(Notebook)
    if params[:search]
      if params[:search][:query]
        @notebookresult = Notebook.find_by(name: params[:search][:query])
        if @notebookresult
          redirect_to notebook_path(@notebookresult)
        else
          # redirect_to action:'index', alert: "notebook not found"
          # flash.alert
          flash[:error] = 'notebook not found'
          redirect_to action:'index', danger: "notebook not found"
        end
      end
    end
  end

  def show
    skip_authorization
  end

  def new
    @notebook = Notebook.new
    authorize current_user
  end

  def create
    @notebook = Notebook.new(notebooks_params)
    authorize current_user
    
    if @notebook.save
      redirect_to notebook_path(@notebook)
    else
      render :new
    end
  end

  def edit
    authorize current_user
  end

  def destroy
    authorize current_user
    @notebook = Notebook.find(params[:id])
    @notebook.destroy
    redirect_to notebooks_path
  end

  def update
    authorize current_user
    @notebook.edited = true
    @notebook.update(notebooks_params)

    redirect_to notebook_path
  end

  def list
    authorize current_user
    @tags = Tag.all.order(created_at: :asc)
    @notebooks = Notebook.all.order(position: :asc)
  end

  private

  def find_notebook
    @notebook = Notebook.find(params[:id])
  end

  def notebooks_params
    params.require(:notebook).permit(:bar_code, :modelo_especifico,:asin,
    :name, :brand, :modelo, :processor, :color, :ram, :hd, :weight, :ssd,
    :screen_quality, :screen_size, :screen_width, :placa_video, :keyboard,
    :amazon_sales_rank, :guarantee,
    :link_amazon, :amazon_price,
    :link_magalu, :magalu_price,
    :link_submarino, :submarino_price,
    :link_americanas, :americanas_price, :position, :photo, pictures: [])
  end
end
