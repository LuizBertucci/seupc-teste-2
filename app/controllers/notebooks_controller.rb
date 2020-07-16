class NotebooksController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :find_notebook, only: [:show, :edit, :update]

  def index
    @user = current_user
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
    @user = current_user
  end

  def new
    @notebook = Notebook.new
    @user = current_user
    authorize @user
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
    @user = current_user
    authorize @user
  end


  def destroy
    @user = current_user
    authorize @user
    @notebook = Notebook.find(params[:id])
    @notebook.destroy
    redirect_to notebooks_path

  end

  def update
    @user = current_user
    authorize @user
    @notebook.edited = true
    @notebook.update(notebooks_params)

    redirect_to notebook_path
  end

  private

  def find_notebook
    @notebook = Notebook.find(params[:id])


  end

  def notebooks_params
    params.require(:notebook).permit(:bar_code, :full_price, :offer_price,
      :brand, :modelo, :processor, :color,
      :screen, :ram, :hd, :ssd, :placa_video, :keyboard,
      :amazon_sales_rank, :guarantee, :link_amazon, :link_submarino,
      :link_magalu, :link_americanas, :name)
  end
end




