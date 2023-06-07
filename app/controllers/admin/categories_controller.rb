class Admin::CategoriesController < ApplicationController

  http_basic_authenticate_with name: ENV['AUTHENTICATION_USERNAME'], password: ENV['AUTHENTICATION_PASSWORD']

    def index
      @categories = Category.all
    end
  
    def new
      @category = Category.new
    end
  
    def create
      @category = Category.new(category_params)
  
      if @category.save
        redirect_to admin_categories_path, notice: 'Category created successfully.'
      else
        render :new
      end
    end
  
    private
  
    def category_params
      params.require(:category).permit(:name)
    end
  end
  