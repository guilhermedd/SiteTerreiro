class GaleriesController < ApplicationController
  before_action :authenticate_user!, only: %i[show edit update destroy create detach_image]

  before_action :set_galery, only: %i[ show edit update destroy detach_image ]

  # GET /galeries or /galeries.json
  def index
    @galeries = Galery.all
  end

  # GET /galeries/1 or /galeries/1.json
  def show
  end

  # GET /galeries/new
  def new
    @galery = Galery.new
    # @galery.galery_photos.build # Cria um campo para pelo menos uma foto
  end

  # GET /galeries/1/edit
  def edit
  end

  # POST /galeries or /galeries.json
  def create
    # Duplica os parâmetros permitidos
    processed_params = galery_params.dup

    # Se existir a chave :images e ela for um array, remove duplicatas
    if processed_params[:images].is_a?(Array)
      processed_params[:images] = processed_params[:images].uniq
    end

    @galery = Galery.new(processed_params)

    if @galery.save
      redirect_to @galery, notice: "Galeria criada com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end


  def detach_image
    @galery = Galery.find(params[:id])
    image = @galery.images.find(params[:image_id])
    image.purge
    redirect_to edit_galery_path(@galery), notice: "Imagem removida com sucesso!"
  end

  def update
    @galery = Galery.find(params.require(:id))

    if params[:galery][:images]&.any?
      new_files = params[:galery][:images].reject(&:blank?).uniq
      @galery.images.attach(new_files) if new_files.any?
    end

    if @galery.update(galery_params.except(:images))
      redirect_to @galery, notice: 'Galeria atualizada com sucesso.'
    else
      puts @galery.errors.full_messages # Debug
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /galeries/1 or /galeries/1.json
  def destroy
    @galery.images.each{|image| image.purge}
    @galery.destroy!

    respond_to do |format|
      format.html { redirect_to galeries_path, status: :see_other, notice: "Galeria deletada com sucesso!" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_galery
      @galery = Galery.find(params.expect(:id))
    end

  def galery_params
    params.require(:galery).permit(:title, images: [])
  end

end
