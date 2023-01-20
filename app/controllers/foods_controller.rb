class FoodsController < ApplicationController
    def index
        foods = Food.all
        render json: foods
    end
    def show
        food = Food.find_by(id: params[:id])
        render json: food.timings
    end
    def create
        food = Food.create(food_params)
        if food.valid?
            render json: food
        else 
            render json: food.errors
        end
    end
    def update
        food = Food.find(params[:id])
        food.update(food_params)
    end
    def destroy
        food = Food.find(params[:id])
        food.destroy
    end

    private
    def food_params
        params.require(:food).permit(:name, :calories, :protein)
    end

end
