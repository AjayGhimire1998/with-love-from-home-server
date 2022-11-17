class Api::V1::CategoriesController < ApplicationController 
    def index 
        @categories = Category.all

        render json: @categories
    end

    def show 
        @catgeory = Category.find(params[:id])
        render json: @category
    end

    # def create
    #     @category = Category.new(category_params)
  
    #     if @category.save
    #       render json: {last_product: @category}, status: :created
    #     else
    #       render json: @category.errors, status: :unprocessable_entity
    #     end
    # end
  
    # PATCH/PUT /products/1
    def update
        @catgeory = Category.find(params[:id])
      if @category.update(category_params)
        render json: @category
      else
        render json: @category.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /products/1
    def destroy
      @category.destroy
    end
    private

    def category_params 
        params.require(:category).permit(:name)
    end

    
end