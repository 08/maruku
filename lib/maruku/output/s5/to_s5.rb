# This module groups all functions related to HTML export.
module MaRuKu
	 
	class MDDocument
		
	# Render as an HTML fragment (no head, just the content of BODY). (returns a string)
	def to_s5(context={})
		indent = context[:indent] || -1
		ie_hack = context[:ie_hack] ||true

		doc = Document.new(nil,{:respect_whitespace =>:all})
		html = Element.new('html', doc)
		html.add_namespace('http://www.w3.org/1999/xhtml')
		html.add_namespace('svg', "http://www.w3.org/2000/svg" )
		
		head = Element.new('head', html)
			me = Element.new 'meta', head
			me.attributes['http-equiv'] = 'Content-type'
			me.attributes['content'] = 'text/html;charset=utf-8'	


			# Create title element
			doc_title = self.attributes[:title] || self.attributes[:subject] || ""
			title = Element.new 'title', head
				title << Text.new(doc_title)
		
		
		body = Element.new('body', html)
		
		slide_header = self.attributes[:slide_header]
		slide_footer = self.attributes[:slide_footer]
		slide_topleft  = self.attributes[:slide_topleft]
		slide_topright  = self.attributes[:slide_topright]
		slide_bottomleft  = self.attributes[:slide_bottomleft]
		slide_bottomright  = self.attributes[:slide_bottomright]

		dummy_layout_slide = 
		"<div class='layout'>
			<div id='controls'><!-- DO NOT EDIT --></div>
			<div id='currentSlide'><!-- DO NOT EDIT --></div>
			<div id='header'> #{slide_header}</div>
			<div id='footer'> #{slide_footer}</div>
		  <div class='topleft'> #{slide_topleft}</div>
		  <div class='topright'> #{slide_topright}</div>
		  <div class='bottomleft'> #{slide_bottomleft}</div>
		  <div class='bottomright'> #{slide_bottomright}</div>
		</div>"
		body.add_element Document.new(dummy_layout_slide, {:respect_whitespace =>:all}).root

		presentation = Element.new 'div', body
		presentation.attributes['class'] = 'presentation'
		
		first_slide="
	  <div class='slide'>
	  <h1> #{self.attributes[:title]}</h1>
	  <h2> #{self.attributes[:subtitle]}</h2>
	  <h3> #{self.attributes[:author]}</h3>
	  <h4> #{self.attributes[:company]}</h4>
	  </div>
		"
		presentation.add_element Document.new(first_slide).root

		slide_num = 0
		self.toc.section_children.each do |slide|
			slide_num += 1
			@doc.attributes[:doc_prefix] = "s#{slide_num}"
			
			puts "Slide #{slide_num}: " + slide.header_element.to_s
			div = Element.new('div', presentation)
			div.attributes['class'] = 'slide'
			
			h1 = Element.new 'h1', div
			slide.header_element.children_to_html.each do |e| h1 << e; end

			
			array_to_html(slide.immediate_children).each do |e|  div << e  end
				
			# render footnotes
			if @doc.footnotes_order.size > 0
				div << render_footnotes
				@doc.footnotes_order = []
			end
		end


		doc2 = Document.new("<div>"+S5_external+"</div>",{:respect_whitespace =>:all})
		doc2.root.children.each{ |child| head << child }

	
		add_css_to(head)

		xml  = "" 

		# REXML Bug? if indent!=-1 whitespace is not respected for 'pre' elements
		# containing code.
		html.write(xml,indent,transitive=true,ie_hack);

		Xhtml10strict + xml
	end

end 


end