class DocumentsController < ApplicationController
  before_action :set_document, only: [:show, :edit, :update, :extract, :analyze, :destroy]

  def index
    @documents = Document.all
  end

  def show
  end

  def new
    @document = Document.new
  end

  def edit
  end

  def create
    @document = Document.new(document_params)

    if @document.save
      redirect_to @document, notice: 'Document was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @document.update(document_params)
      redirect_to @document, notice: 'Document was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def extract
    if @document.extract_content
      redirect_to @document, notice: 'Extraction has successfully been initiated.'
    else
      render action: 'show'
    end
  end

  def analyze
    if @document.summarize
      redirect_to @document, notice: 'Analysis has successfully been initiated.'
    else
      render action: 'show'
    end
  end

  def destroy
    @document.destroy
    redirect_to documents_url, notice: 'Document was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document
      @document = Document.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def document_params
      params.require(:document).permit(:name, :description, :content, :source)
    end
end
