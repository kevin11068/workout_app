module ApplicationHelper
	def devise_error_message!
		return "" if resources.errors.empty?
			message = resources.error.full_messages.map {
				|msg| content_tag(:li, msg) }.join

			html = <<-HTML

		<div class="alert alert-error alert-danger">
			<a href="#" class= "close" data-dismiss="alert" >&#215;</a>
			<%= content_tag :div, msg if msg.is_a?(String) %>
		</div>

		HTML
		 	html.html_safe
	end	
end
