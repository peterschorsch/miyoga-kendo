class ContentsController < ApplicationController
	before_action :set_content, only: [:update]

	def update
		respond_to do |format|
	      if @content.update(content_params)
	        format.html { redirect_to abouts_path, notice: 'Content was successfully updated.' }
	      else
	        format.html { render request.referrer, notice: 'Content was unsuccessfully updated.' }
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
	      params.require(:content).permit(:id, :heading, :subheading, :description, :index, :display_content_on_page)
	    end

end