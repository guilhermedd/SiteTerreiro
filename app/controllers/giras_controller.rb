class GirasController < ApplicationController
  include GirasHelper
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_gira, only: %i[ show edit update destroy ]
  def index
    @giras = Gira.all
  end

  # GET /giras/1 or /giras/1.json
  def show
    @gira = Gira.find(params[:id])
  end

  # GET /giras/new
  def new
    @gira = Gira.new
  end

  # GET /giras/1/edit
  def edit
  end

  # POST /giras or /giras.json
  def create
    @gira = Gira.new(gira_params)

    respond_to do |format|
      if @gira.save
        format.html { redirect_to @gira, notice: "Gira criada com sucesso." }
        format.json { render :show, status: :created, location: @gira }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @gira.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /giras/1 or /giras/1.json
  def update
    respond_to do |format|
      if @gira.update(gira_params)
        format.html { redirect_to @gira, notice: "Gira was successfully updated." }
        format.json { render :show, status: :ok, location: @gira }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @gira.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /giras/1 or /giras/1.json
  def destroy
    @gira.destroy!

    respond_to do |format|
      format.html { redirect_to giras_path, status: :see_other, notice: "Gira was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gira
      @gira = Gira.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def gira_params
      params.expect(gira: [ :event_date, :name, :type_of_gira, :description])
    end
end
