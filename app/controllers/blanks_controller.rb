class BlanksController < ApplicationController
	skip_before_filter :check_login
	def index
	end
	def about
	end

	def terms
	end

	def faq
	end

	def contact
	end
end
