class SellsController < ApplicationController
  before_action :set_sell, only: [:show, :edit, :update, :destroy]

  # GET /sells
  # GET /sells.json
  def index
    @articulos = Articulo.all
    @clientes = Cliente.all
  end

  # GET /sells/1
  # GET /sells/1.json
  def show
    @productos = Detail.where("sell_id = ?", @sell.id)
  end

  # GET /sells/new
  def new
      total = 0
      @cliente = params[:cliente]
      @data = params[:data]
      @data.each do |x| 
            total = total + x["cantidad"].to_i * x["costo"].to_f
      end
      @sell = Sell.new
      @sell.user_id = current_user.id
      @sell.cliente_id = @cliente.first["id"].to_i
      @sell.total = total
      respond_to do |format|

        Sell.transaction do
          Detail.transaction do
            Articulo.transaction do
              if @sell.save
                @data.each do |x| 
                  detalle = Detail.new
                  detalle.articulo_id = x["id"].to_i 
                  detalle.sell_id = @sell.id
                  detalle.catidad = x["cantidad"].to_i
                  if detalle.save
                    @articulo = Articulo.where("id = ?", x["id"].to_i )
                    @articulo.first.update(existencia: @articulo.first.existencia - x["cantidad"].to_i)
                  end
                end
                format.html { redirect_to @sell, notice: "Venta creada satisfactoriamente" }
                format.json { render :show, status: :created, location: @sell }
              else
                format.html { render :new }
                format.json { render json: @sell.errors, status: :unprocessable_entity }
              end
            end
          end
        end
      end
  end

  # GET /sells/1/edit
  def edit
  end

  # POST /sells
  # POST /sells.json
  def create
    @sell = Sell.new(sell_params)

    respond_to do |format|
      if @sell.save
        format.html { redirect_to @sell, notice: 'Sell was successfully created.' }
        format.json { render :show, status: :created, location: @sell }
      else
        format.html { render :new }
        format.json { render json: @sell.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sells/1
  # PATCH/PUT /sells/1.json
  def update
    respond_to do |format|
      if @sell.update(sell_params)
        format.html { redirect_to @sell, notice: 'Sell was successfully updated.' }
        format.json { render :show, status: :ok, location: @sell }
      else
        format.html { render :edit }
        format.json { render json: @sell.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sells/1
  # DELETE /sells/1.json
  def destroy
    @sell.destroy
    respond_to do |format|
      format.html { redirect_to sells_url, notice: 'Sell was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sell
      @sell = Sell.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sell_params
      params.require(:sell).permit(:user_id, :cliente_id, :total)
    end
end
