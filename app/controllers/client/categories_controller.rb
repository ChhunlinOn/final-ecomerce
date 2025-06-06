class CategoriesController < ApplicationController
    def show
      @category = Category.find(params[:id]).includes(:products)
    end
  end