class LinksController < ApplicationController
  before_action :set_link, only: [:show]

  def show
    if params[:slug]
      @link = Link.find_by(slug: params[:slug])
      url = @link.full_url
      @link.clicked
      @link.save
      redirect_to url, status: :moved_permanently
    else
      @link = Link.find(params[:id])
    end
  end

  def create
    @link = Link.new(link_params)
    
    respond_to do |format|
      if @link.save
        query = encoding_params
        if query
          generate_slug(query)
        end

        format.html { redirect_to @link, notice: 'Link was successfully created.' }
        format.js
        format.json { render :show, status: :created, location: @link }
      else
        format.html { render :new }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def encoding_params
      URI.parse(params["link"]["full_url"]).query
    end

    def generate_slug(query)
      encoding = query.split('&').select { |element| /encoding/ =~ element }[0].split('=')
      @link.generate_slug(encoding[1])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_link
      @link = Link.find_by(slug: params[:slug])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def link_params
      params.require(:link).permit(:full_url)
    end
end
