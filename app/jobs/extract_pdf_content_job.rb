class ExtractPDFContentJob
  include Resque::Plugins::Status

  def perform
    if document.source_file_name =~ /.*(pdf)$/
      reader = PDF::Reader.new(document.source.path)
      content = []
      reader.pages.each_with_index do |page,page_number|
        msg = "At page #{page_number} of #{reader.page_count}"
        at(page_number, reader.page_count, msg)
        content << page.text
      end
      document.content = content.join(' ')

      # document.author ||= reader.info[:author] || 'unknown'
      #
      document.save
      document.analyze
    else
      raise "can only extract content from documents with pdf sources"
    end
  end

  def document_id
    @document_id ||= options['document_id'].to_i
  end

  def document
    @document ||= Document.find_by_id(document_id)
  end
end
