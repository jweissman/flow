class ExtractPDFContentJob
  include Resque::Plugins::Status

  def perform
    puts "=== would be processing document with id #{document_id}"
    # page_number = 0
    # document = Document.find_by_id(document_id)
    puts "--- got document: #{document.inspect}"
    if document.source_file_name =~ /.*(pdf)$/
      puts "--- is a pdf, okay!"
      puts "--- target: #{document.source.path}"
      reader = PDF::Reader.new(document.source.path)
      puts "--- got pdf reader!"
      # total_pages = reader.pages.count
      content = []
      puts "--- processing #{reader.page_count} pages!"
      reader.pages.each_with_index do |page,page_number|
	puts "--- considering page #{page.inspect}..."
        msg = "At page #{page_number} of #{reader.page_count}"
        puts "***** #{msg}"
        at(page_number, reader.page_count, msg)
        content << page.text
      end
      puts "--- updating doc..."
      document.content = content.join(' ')

      puts "--- persisting updated doc!"
      document.save

      puts "=== done processing document #{document_id}"
    end
  end

  def document_id
    @document_id ||= options['document_id'].to_i
  end

  def document
    @document ||= Document.find_by_id(document_id)
  end
end
