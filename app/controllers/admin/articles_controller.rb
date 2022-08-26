class Admin::ArticlesController < Admin::BaseController
  before_action :set_article, only: %i[ show edit update destroy ]

  # GET /admin/articles or /admin/articles.json
  def index
    @articles = Article.all
  end

  # GET /admin/articles/1 or /admin/articles/1.json
  def show
  end

  # GET /admin/articles/new
  def new
    @article = Article.new
  end

  # GET /admin/articles/1/edit
  def edit
  end

  # POST /admin/articles or /admin/articles.json
  def create
    slug = process_slug(params[:article][:title], params[:article][:slug])
    @article = Article.new(article_params.merge(slug: slug))

    respond_to do |format|
      if @article.save
        format.html { redirect_to admin_article_url(@article), notice: "Article was successfully created." }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/articles/1 or /admin/articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to admin_article_url(@article), notice: "Article was successfully updated." }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/articles/1 or /admin/articles/1.json
  def destroy
    @article.destroy

    respond_to do |format|
      format.html { redirect_to admin_articles_url, notice: "Article was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(%i[title subtitle content spotlight_until status cover tag_list])
    end

    def process_slug(title, slug)
      return slug if slug.present?

      title.split(' ')
      title.map {|i| i.downcase}.join('_')
    end
end
