class Admin::CategoriesController < ApplicationController
  before_action :set_category, only: [:edit, :update, :destroy]
  layout 'admin'
  def index
    @admin_categories = Category.all
    @category = Category.new
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    respond_to do |format|
      if @category.save
        format.turbo_stream
        format.html { redirect_to categories_path, notice: "Category created." }
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace("category_form", partial: "form", locals: { category: @category }) }
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @category.update(category_params)
        format.turbo_stream
        format.html { redirect_to categories_path, notice: "Category updated." }
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace("category_form_#{@category.id}", partial: "form", locals: { category: @category }) }
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @category.destroy
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to categories_path, notice: "Category deleted." }
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end