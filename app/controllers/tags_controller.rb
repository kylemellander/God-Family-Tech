class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :edit, :update, :destroy]
  before_action :admin_auth!, except: :show

  # GET /tags/1
  def show
  end

  # GET /tags/new
  def new
    @tag = Tag.new
  end

  # GET /tags/1/edit
  def edit
  end

  # POST /tags
  def create
    @tag = Tag.new(tag_params)

    if @tag.save
      redirect_to @tag, notice: 'Tag was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /tags/1
  def update
    if @tag.update(tag_params)
      redirect_to @tag, notice: 'Tag was successfully updated.'
    else
      render :edit
    end
  end

  # # DELETE /tags/1
  # def destroy
  #   @tag.destroy
  #   redirect_to tags_url, notice: 'Tag was successfully destroyed.'
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag
      @tag = Tag.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def tag_params
      params.require(:tag).permit(:name)
    end

    def admin_auth!(opts={})
      if !current_user.nil? && current_user.admin
        opts[:scope] = :user
        warden.authenticate!(opts) if (!devise_controller? || opts.delete(:force))
      else
        redirect_to root_path, alert: "You do not have permission to do that."
      end
    end
end
