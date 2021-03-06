class ContentsController < ApplicationController
	before_action :set_content, only: [:update, :destroy]
	before_action :set_page, only: [:create]

	def create
		@content = Content.new(content_params)
		@content.page_id = @current_page.id
		@content.user_id = current_user.id
		@content.images.in_batches.update_all(content_id: @content.id)

		respond_to do |format|
			if @content.save
				format.html { redirect_to request.referrer, notice: 'Content was successfully created.' }
			else
				format.html { redirect_back(fallback_location: root_path) }
				format.json { render json: @content.errors, status: :unprocessable_entity }
			end
		end
	end

	def update
		@content.user_id = current_user.id
		@content.links.in_batches.update_all(user_id: current_user.id)

		respond_to do |format|
			if @content.update!(content_params)
				format.html { redirect_to request.referrer, notice: 'Content was successfully updated.' }
			else
				format.html { redirect_to request.referrer, notice: 'Content was unsuccessfully updated.' }
			end
		end
	end

	def destroy
		@content.archived = true
		@content.user_id = current_user.id

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
	      @current_page = Page.named("About")
	    end

	    # Only allow a list of trusted parameters through.
	    def content_params
			params.require(:content).permit(:id, :heading, :subheading, :description, :index, :archived, :article,
			images_attributes: [:id, :image, :link_id, :content_id, :_destroy],
			links_attributes: [:id, :name, :link, :index, :image, :content_id, :_destroy, image_attributes: [:id, :image, :link_id, :_destroy]])
	    end

end