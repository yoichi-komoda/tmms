class PartsController < ApplicationController
  before_action :require_user_logged_in
  
  def edit
    @lift = Lift.find(params[:id])
    @menu = @lift.menu
    @parts = @lift.parts
  end

  def new
    @menu = Menu.find(params[:menu_id])
    @lift = Lift.find(params[:lift_id])
    @part = @lift.parts.build
    @parts = @lift.set_count.times.map { @lift.parts.build }
  end

  def create
    @lift = Lift.find(params[:lift_id])
    @parts = part_params.map { |part_params| @lift.parts.build(part_params)}
    @parts.each do |part|
      part.save
    end
    redirect_to edit_menu_path(id: @lift.menu_id)
  end

  def update
    @lift = Lift.find(params[:lift_id])
    params.require(:part).each do |key, value|
      part = Part.find(key)
      part.reps = value["reps"]
      part.weight = value["weight"]
      part.save
    end
    redirect_to edit_menu_path(id: @lift.menu_id)
  end
  
  private
  
  def part_params
    params.require(:part).map{ |part| part.permit(:reps, :weight) }
  end
end
