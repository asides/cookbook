module MenuRenderTreeHelperHelper
	class Render
    class << self
      attr_accessor :h, :options

      def render_node(h, options)
        @h, @options = h, options

        "<li>
        	<p>#{h.link_to options[:node][:title], options[:node]}</p>
          <ol>#{ options[:children] }</ol>
        </li>"
      end

    end
  end
end
