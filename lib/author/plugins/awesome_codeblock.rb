# = AwesomeCodeblock
#
# This is a CodeRay plugin that allows you to output more awesome codeblocks.
# It was inspired by the code_ray_block plugin by git@codebykat.
#
# == Usage
#
# The most basic usage is just calling the code block. This will not do much more than
# the standard codeblock wrapper.
#
#  {% awesome_codeblock %}
#  code goes here
#  {% endawesome_codeblock %}
#
# You can choose to have a title added to the code block. This is great if you want to
# display the filename or filepath for the code snippet.
#
#  {% awesome_codeblock title:"path/to/file.rb" %}
#  code goes here
#  {% endawesome_codeblock %}
#
# You can set the language of the code block. The default is `:text` but you can specify
# any of the code formats that CodeRay supports.
#
#  {% awesome_codeblock lang:"ruby" %}
#  code goes here
#  {% endawesome_codeblock %}
#
# You can choose to add line numbers as well. Refer to the documentation for
# CodeRay::Encoder::HTML for values that can be passed in.
#
#  {% awesome_codeblock line_number_format:"inline" %}
#  code goes here
#  {% endawesome_codeblock %}
#
# You can choose to highlight specific lines within your code block as well. Just supply
# a comma separated list of line numbers.
#
#  {% awesome_codeblock lines_to_highlight:"2,3,4,7" %}
#  code goes here
#  ...
#  {% endawesome_codeblock %}
#
# Author: Terry Schmidt
# Date: 21 May 2014
# License: [WTFPL](http://www.wtfpl.net/about/)
#
require 'liquid'
require 'coderay'

module Author
  module Plugins
    class AwesomeCodeblock < Liquid::Block
      
      attr_accessor :title, :language, :markup, :options, :code
      
      DEFAULTS = {
        css: :class
      }
      
      def initialize(tag_name, markup, tokens)
        @markup = markup
        super
      end
      
      def render(context)
        @code = super
        output = ''
        output += header
        output += tableized_code(code)
        output += footer
        output
      end
      
      private
      
      def header
        %Q[<figure class="#{css_classes.join(' ')}">#{wrapped_title}<div class="CodeRay"><table class="code">]
      end
      
      def wrapped_title
        return '' unless title
        %Q[<figcaption class="code-header"><span>#{title}</span></figcaption>]
      end
      
      def title
        @title = (markup =~ /\s*title:"([^"]+)"/i) ?  $1 : nil
      end
      
      def footer
        %q[</table></div></figure>]
      end
      
      def tableized_code(code)
        lines = ''
        wrapped_code = ''
        code.strip.split("\n").each_with_index do |line, index|
          index += 1
          line = "&nbsp;" if line.empty?
          lines        += %Q[<div class="line-number#{' highlight' if lines_to_highlight && lines_to_highlight.include?(index)}">#{index}</div>]
          wrapped_code += %Q[<div class="code-part#{' highlight' if lines_to_highlight && lines_to_highlight.include?(index)}">#{line}</div>]
        end
        tr_str do
          ''.tap do |str|
            str << %Q[<td class="gutter">#{lines}</td>] if show_line_numbers?
            str << %Q[<td class="lines-of-code"><pre>#{wrapped_code}</pre></td>]
            str
          end
        end
      end
      
      def tr_str
        %Q[<tbody><tr>#{yield}</tr></tbody>]
      end
      
      def language
        @language = (markup =~ /\s*lang(?:uage)?:['"]?([^"'\s]+)*['"]?/i) ? $1 : 'text'
      end
      
      def css_classes
        ['code', language].compact
      end
      
      def show_line_numbers?
        show_line_numbers || lines_to_highlight
      end
      
      def show_line_numbers
        (markup =~ /\s*show_line_numbers:['"]?([^"'\s]+)['"]?/i) ? true : false
      end
      
      def lines_to_highlight
        (markup =~ /\s*highlight:['"]?([^"'\s]+)*['"]?/i) ? $1.split(/, ?/).map(&:to_i) : false
      end
      
    end
  end
end

Liquid::Template.register_tag('awesome_codeblock', Author::Plugins::AwesomeCodeblock)