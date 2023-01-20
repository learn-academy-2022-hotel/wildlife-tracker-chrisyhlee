class TimingsController < ApplicationController
    def index
        timings = Timing.all
        render json: timings
    end
    def show
        timing = Timing.find(params[:id])
        render json: timing
    end
    def create
        timing = Timing.create(timing_params)
        if timing.valid?
            render json: timing
        else
            render json: timing.errors
        end
    end
    def update
        timing = Timing.find(params[:id])
        timing.update(timing_params)
    end
    def destroy
        timing = Timing.find(params[:id])
        timing.destroy
    end

    private
    def timing_params
        params.require(:timing).permit(:meal, :date, :food_id)
    end
end
