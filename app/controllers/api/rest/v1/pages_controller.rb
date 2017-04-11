class Api::Rest::V1::PagesController < Api::Rest::V1::RestApiController
  def index
    render json: Page.filter(page_params)
  end

  def show
    render json: Page.find(params[:id]), status: :ok
  end

  def create
    page = ::ParseService.new(page_params[:url]).run
    if page.errors.empty?
      render json: page, status: :created
    else
      render json: { errors: page.errors }, status: :error
    end
  end

  private

  def page_params
    params.require(:indexed_page).permit(:url, :page_number)
  end
end
