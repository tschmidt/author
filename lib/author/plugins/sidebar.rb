# = Sidebar
#
# This is a Liquid plugin that allows you to include sidebars into your text.
#
# == Options
#
# There are several sidebar types you can use:
#
# - :info # this is the default
# - :warning
# - :tip
#
# == Usage
#
# All of the types use the same format. All you need to do is supply the `type` you want the
# sidebar to be. This will control the styling of the sidbar box.
#
#  {% sidebar %}
#  This is the text that will appear in the sidebar
#  {% endsidebar %}
#
# Here is an example where you specify the type.
#
#  {% sidebar type:warning %}
#  This is now a warning sidebar
#  {% endsidebar %}
#
# Author: Terry Schmidt
# Date: 27 May 2014
# License: [WTFPL](http://www.wtfpl.net/about/)
#
require 'liquid'
require 'kramdown'

module Author
  module Plugins
    class Sidebar < Liquid::Block
      
      attr_accessor :markup
      
      def initialize(tag_name, markup, tokens)
        @markup = markup
        super
      end
      
      def render(context)
        sidebar_content = super
        output = ''
        output += header
        output += Kramdown::Document.new(sidebar_content, auto_ids: false).to_html
        output += footer
        output
      end
      
      def header
        %Q[<table class="sidebar sidebar-#{sidebar_type}"><tbody><tr><td class="sidebar-icon"></td><td>]
      end
      
      def footer
        %q[</td></tr></tbody></table>]
      end
      
      def sidebar_type
        markup =~ /\s*type:"?([^"\s]+)"?/i ?  $1 : 'info'
      end
      
    end
  end
end

Liquid::Template.register_tag('sidebar', Author::Plugins::Sidebar)