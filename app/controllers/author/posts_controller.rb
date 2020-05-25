module Author
	class PostsController < AuthorController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :publish, :unpublish]
 
  # GET /posts
  # GET /posts.json
  def index
    @posts = current_salah.posts.most_recent
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = current_salah.posts.new
  end

  # GET /posts/1/edit
  def edit
  end

  def publish
     @post.publish
     redirect_to author_posts_url
  end
  
  def unpublish
    @post.unpublish
    redirect_to author_posts_url
  end  

  # POST /posts
  # POST /posts.json
  def create
    @post = current_salah.posts.new(post_params)
    
    respond_to do |format|
      if @post.save

        format.html { redirect_to author_post_path(@post), notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to author_post_path(@post), notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to author_posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = current_salah.posts.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :body, :description, :banner_image_url, :tag_list)
    end
end

end

