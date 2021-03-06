class NotebooksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :index, :show]
  before_action :find_notebook, only: [:show, :edit, :update]

  def home
    authorize current_user
    if params[:query].present?
      @notebooks = Notebook.search_query(params[:query]).order(created_at: :desc)
    else
      @notebooks = Notebook.all.order(created_at: :desc)
    end
  end

  def index
    if params[:query].present?
      @query = params[:query].split(" ")
      @notebooks = Notebook.search_query(params[:query]).order(created_at: :desc)
    else
      @notebooks = Notebook.all.order(created_at: :desc)
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
    # action to render the view where the adm will manage old/new notebooks, tags, notebooks positions.
    authorize current_user
    @tags = Tag.all.order(created_at: :asc)
    @notebooks = Notebook.all.order(position: :asc)
  end

  private

  def find_notebook
    @notebook = Notebook.find(params[:id])
  end

  def notebooks_params
    params.require(:notebook).permit(:bar_code, :modelo_especifico, :asin,
    :name, :brand, :modelo, :processor, :color, :ram, :hd, :weight, :ssd,
    :screen_quality, :screen_size, :screen_width, :placa_video, :keyboard,
    :amazon_sales_rank, :guarantee,
    :link_amazon, :amazon_price,
    :link_magalu, :magalu_price,
    :link_submarino, :submarino_price,
    :link_americanas, :americanas_price, :position, :photo, pictures: [])
  end
end
