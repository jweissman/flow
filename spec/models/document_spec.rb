require 'spec_helper'
require 'pry'

describe Document do
  let(:path) { Rails.root.join 'lib','assets','accelerationism.pdf' }
  let(:pdf) { File.new(path) }

  context 'extracting content from a PDF' do
    subject do
      Document.create source: pdf
    end

    before do
      subject.extract_content
      subject.reload
    end

    its(:content) { should include('modernity of abstraction') }
    its(:summary) { should include('relentless horizontalism') }
    pending 'keywords'
  end

  #it 'can take a PDF and extract meaningful summaries' do
  #  document = Document.new(source: File.new(TEST_PDF_FILE_PATH))
  #  # document.
  #  document.extract_content

  #  document.content.should_not be_nil
  #end
end
