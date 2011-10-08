require 'reverse-markdown'

describe ReverseMarkdown do
  it "Should parse elements inside blockquotes" do
    error_string = """<blockquote><b>1</b>: 1<br /></blockquote>"""
     result = ReverseMarkdown.new.parse_string error_string
     result.should == ">1: 1\n>\n"
  end

  it "Should not print first newline" do
    error_string = """<blockquote><br /><b>1</b>: 1<br /></blockquote>"""
     result = ReverseMarkdown.new.parse_string error_string
     result.should == ">1: 1\n>\n"
  end

  it "Should insert newlines correctly" do
    html_snippet = "<blockquote><br />1<br />2</blockquote>"
    result = ReverseMarkdown.new.parse_string html_snippet
    result.should == ">1\n>2\n"
  end
end

