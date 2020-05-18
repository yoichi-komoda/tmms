class LiftsController < ApplicationController
  before_action :require_user_logged_in
  
  def edit
    @lift = Lift.find(params[:lift_edit])
    @menu = Menu.find(@lift.menu_id)
  end

  def new
    @menu = Menu.find(params[:id])
    @lift = @menu.lifts.build
    @position = params[:position]
  end
  
  def delete
    @menu = Menu.find(params[:id])
    @lifts = @menu.lifts.order(position: :desc)
  end

  def position
    @menu = Menu.find(params[:id])
    @lifts = @menu.lifts.order(position: :desc)
  end

  def create
    @menu = Menu.find(params[:menu_id])
    @lift = @menu.lifts.build(lift_params)
    # binding.pry
    if Lift.exists?(menu_id: @menu.id)
      max_position = @menu.lifts.maximum(:position)
      max_position += 1
    else
      max_position = 1
    end
    @lift.position = max_position
    # binding.pry
    @lift.save
    @lift.insert_at(params[:position].to_i)
    # binding.pry
    redirect_to new_part_path(lift_id: @lift.id, menu_id: @menu.id)
  end

  def update
    @lift = Lift.find(params[:id])
    @lift.update(lift_params)
    redirect_to edit_part_path(id: params[:id])
  end
  
  def destroy
    deletes = params[:deletes]
    deletes.each do |delete|
      Lift.find(delete).destroy
    end
    redirect_to edit_menu_path(id: params[:menu_id])
  end
  
  private
  
  def lift_params
    params.require(:lift).permit(:name, :set_count, :interval)
  end
end
