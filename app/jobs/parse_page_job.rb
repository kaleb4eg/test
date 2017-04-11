require "open-uri"
require "net/http"

class ParsePageJob < ApplicationJob
  queue_as :default

  def perform(page_id, tags)
    page = Page.find(page_id)
    return page.index_failed! if

    doc = Nokogiri::HTML(open(page.url))
    elements = doc.css(tags.join(', ')).map do |e|
      el = { element_type: e.name, page_id: page.id }
      el[:content] = e.name == 'a' ? e['href'] : e.text
      el
    end

    Element.bulk_insert(values: elements)
    page.indexed!
  rescue Exception
    page.index_failed!
  end
end
