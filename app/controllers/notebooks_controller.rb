class NotebooksController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :find_notebook, only: [:show, :edit, :destroy, :update]

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

  end

  def new
    @notebook = Notebook.new
  end

  def create
    @notebook = Notebook.new(notebooks_params)
    if @notebook.save
      redirect_to notebook_path(@notebook)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @notebook.update(notebooks_params)

    redirect_to notebook_path
  end

  private

  def find_notebook
    @notebook = notebook.find(params[:id])
  end

  def notebooks_params
    params.require(:notebook).permit(:bar_code, :full_price, :offer_price,
      :brand, :modelo, :processor, :color,
      :screen, :ram, :hd, :ssd, :placa_video, :keyboard,
      :amazon_sales_rank, :guarantee)
  end
end




