class ParseService
  def initialize(url)
    @url = url
    @tags = ['h1', 'h2', 'h3', 'a']
  end

  def run
    page = Page.find_by(url: @url)
    return page if page.present?

    page = Page.new(url: @url)
    ParsePageJob.perform_later(page.id, @tags) if page.save

    page
  end
end
