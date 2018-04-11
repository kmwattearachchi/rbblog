class Admin::CategoriesController < ApplicationController
    before_action :authenticate_user!,  only: [:new,  :create ]
    before_action :set_category, only: [:edit, :update, :destroy]

    # GET /admin/categories
    def index
      @filterrific = initialize_filterrific(
          Category,
          params[:filterrific]
      ) or return
      @categories = @filterrific.find.page(params[:page]).per_page(ENV['ADMIN_PER_PAGE'].to_i)

      respond_to do |format|
        format.html
        format.js
      end

    end

    # GET /admin/categories/new
    def new
      @category = Category.new
    end

    # POST /admin/categories
    def create
      @category = Category.new(category_params)
      respond_to do |format|
        if @category.save
          format.html { redirect_to admin_categories_url, notice: 'Article category was successfully created.' }
        else
          format.html { render :new }
        end
      end
    end

    # GET /admin/categories/1/edit
    def edit
    end

    # PATCH/PUT /admin/categories/1
    def update
      respond_to do |format|
        if @category.update(category_params)
          format.html { redirect_to admin_categories_url, notice: 'Article category was successfully updated.' }
        else
          format.html { render :edit }
        end
      end
    end

    # DELETE /admin/categories/1
    def destroy
      @category.destroy
      respond_to do |format|
        format.html { redirect_to [:admin,  @category], notice: 'Article category was successfully destroyed.' }
      end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:category_name)
    end
end
