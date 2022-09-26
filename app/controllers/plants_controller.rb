class PlantsController < ApplicationController
    def index
		render(json: Plant.all, status: :ok)
	end

	def create
		plant = Plant.create(plant_params)
		render(json: plant, status: :created)
	end

	def show
		plant = Plant.all.find_by(id: params[:id])
		if (plant)
			render(json: plant, status: :ok)
		else
			render(json: {error: "We could not find what you are looking for"}, status: :not_found)
		end
	end

	private
	def plant_params
		params.permit(:name, :image, :price)
	end
end
