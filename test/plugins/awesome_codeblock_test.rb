require_relative '../helper'
require 'liquid'
require 'author/plugins/awesome_codeblock'

describe Author::Plugins::AwesomeCodeblock do
  
  let(:liquid) { Liquid::Template }
  
  context "no options given" do
    it "should process the block into pretty code" do
      using_liquid_templates do
        rendered = liquid.parse(IO.read('no_options.md')).render
        expect(rendered).to_include %q[puts &quot;I'm awesome!&quot;]
        expect(rendered).to_include %Q[<figure class="code text"><div class="CodeRay"><table class="code">]
        expect(rendered).to_not_include %q[<figcaption class='code-header'><span>]
        expect(rendered).to_not_include %q[<div class="line-number">]
        expect(rendered).to_not_include %q[<div class="line-number highlight">]
      end
    end
  end
  
  context "with title set" do
    it "should set the title when string" do
      using_liquid_templates do
        rendered = liquid.parse(IO.read('title_as_string.md')).render
        expect(rendered).to_include %q[<figcaption class="code-header"><span>The Title</span></figcaption]
      end
    end
    
    it "should set the title when file name" do
      using_liquid_templates do
        rendered = liquid.parse(IO.read('title_as_filename.md')).render
        expect(rendered).to_include %q[<figcaption class="code-header"><span>index.html</span></figcaption>]
      end
    end
    
    it "should set the title when file path" do
      using_liquid_templates do
        rendered = liquid.parse(IO.read('title_as_filepath.md')).render
        expect(rendered).to_include %q[<figcaption class="code-header"><span>path/to/file/index.html</span></figcaption>]
      end
    end
  end
  
  context "with language set" do
    it "should set the language" do
      using_liquid_templates do
        rendered = liquid.parse(IO.read('language_set.md')).render
        expect(rendered).to_include %Q[<figure class="code ruby">]
      end
    end
  end
  
  context "with show line numbers set" do
    it "should include line numbers" do
      using_liquid_templates do
        rendered = liquid.parse(IO.read('show_line_numbers.md')).render
        expect(rendered).to_include %q[<td class="gutter"><div class="line-number">1</div></td>]
      end
    end
  end
  
  context "with lines set to be highlighted" do
    it "should highlight the line" do
      using_liquid_templates do
        rendered = liquid.parse(IO.read('highlight_lines.md')).render
        expect(rendered).to_include %q[<td class="gutter"><div class="line-number highlight">1</div></td>]
      end
    end
  end
  
  context "with starting line number set" do
    it "should start the line count at the number given" do
      using_liquid_templates do
        rendered = liquid.parse(IO.read('starting_line_number.md')).render
        expect(rendered).to_include %q[<td class="gutter"><div class="line-number">15</div></td>]
      end
    end
  end
  
end