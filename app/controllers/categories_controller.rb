class CatagoriesController < ApplicationController
  before_action :set_catagory, only: [:show, :edit, :update, :destroy]

  # GET /catagories
  def index
    @catagories = Catagory.all
  end

  # GET /catagories/1
  def show
  end

  # GET /catagories/new
  def new
    @catagory = Catagory.new
  end

  # GET /catagories/1/edit
  def edit
  end

  # POST /catagories
  def create
    @catagory = Catagory.new(catagory_params)

    if @catagory.save
      edirect_to @catagory, notice: 'Catagory was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /catagories/1
  def update
    if @catagory.update(catagory_params)
      redirect_to @catagory, notice: 'Catagory was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /catagories/1
  def destroy
    @catagory.destroy
    redirect_to catagories_url, notice: 'Catagory was successfully destroyed.'
  end

  private
  
  # Use callbacks to share common setup or constraints between actions.
  def set_catagory
    @catagory = Catagory.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def catagory_params
    params.require(:catagory).permit(:name)
  end
end
