class ContentsController < ApplicationController
	before_action :set_content, only: [:update, :destroy]

	def update
		respond_to do |format|
	      if @content.update!(content_params)
	        format.html { redirect_to request.referrer, notice: 'Content was successfully updated.' }
	      else
	        format.html { redirect_to request.referrer, notice: 'Content was unsuccessfully updated.' }
	      end
	    end
	end

	def destroy
		@content.display_content_on_page = false
		respond_to do |format|
			if @content.update(content_params)
				format.html { redirect_to request.referrer, notice: 'Content was successfully removed.' }
				else
				format.html { redirect_to request.referrer, notice: 'Content was successfully removed.' }
			end
		end
	end
	
	private
	    # Use callbacks to share common setup or constraints between actions.
	    def set_content
		  id = params[:id] || params[:content_id]
		  @content = Content.find(id)
	    end

	    def set_page
	      @page = @content.page
	    end

	    # Only allow a list of trusted parameters through.
	    def content_params
			params.require(:content).permit(:id, :heading, :subheading, :description, :index, :display_content_on_page,
			links_attributes: [:id, :name, :link, :image_link, :index, :display_logo, :article, :content_id, :_destroy])
	    end

end