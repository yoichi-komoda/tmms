class MenusController < ApplicationController
  def index
    @menus = current_user.menus
    @menus_and_required = []
    @menus.each do |menu|
      # 予め０秒で定義しておく
      required_s = 0
      # if で そのメニューにliftが既に作成されているか
      lifts = menu.lifts
      if lifts.exists?
        # 作成されているなら計算する
        lifts.each do |lift|
          required_s += (lift.set_count * lift.interval) + (lift.set_count * 60)
        end
      end
      # 作成されていないならそのメニューの所要時間は0秒
      # 約◯分と表すので、÷60をして小数点以下切り上げを代入
      required = required_s / 60
      required = required.ceil
      # 0にmenu 1にrequired
      @menus_and_required.push([menu, required])
    end
  end

  def new
    @menu = current_user.menus.build
  end

  def show
    @menu = Menu.find(params[:id])
    @lifts = @menu.lifts.order(position: :desc)
  end

  def edit
    @menu = Menu.find(params[:id])
    @lifts = @menu.lifts.order(position: :desc)
  end
  
  def delete
    @menus = current_user.menus
  end

  def create
    menu = current_user.menus.build(menu_params)
    menu.save
    menu = Menu.last
    redirect_to main_menus_index_path
    # redirect_to edit_menu_path(menu.id)
  end

  def destroy
    deletes = params[:deletes]
    deletes.each do |delete|
      Menu.find(delete).destroy
    end
    redirect_to main_menus_index_path
  end
  
  def move_higher
    Lift.find(params[:id]).move_higher
    # positionに移動するためにインスタンスを取得する
    lift = Lift.find(params[:id])
    redirect_to lifts_position_path(id: lift.menu_id)
  end
  
  def move_lower
    Lift.find(params[:id]).move_lower
    # positionに移動するためにインスタンスを取得する
    lift = Lift.find(params[:id])
    redirect_to lifts_position_path(id: lift.menu_id)
  end
  
  private
  
  def menu_params
    params.require(:menu).permit(:name)
  end
  
end
