class PurchasesController < ApplicationController
  before_action :set_panel
  before_action :set_purchase, only: [:edit, :update, :destroy]

  def create
    @panel = Panel.find(params[:panel_id])
    @purchase = @panel.purchases.build(purchase_params)

    if @purchase.save
      redirect_to @panel, notice: 'Compra adicionada com sucesso.'
    else
      render 'panels/show', status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @purchase.update(purchase_params)
      redirect_to @panel, notice: 'Compra atualizada com sucesso.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @purchase.destroy

    redirect_to @panel, notice: 'Compra removida com sucesso.'
  end

  private

  def set_panel
    @panel = Panel.find(params[:panel_id])
  end

  def set_purchase
    @purchase = @panel.purchases.find(params[:id])
  end

  def purchase_params
    params.require(:purchase)
          .permit(:description, :value, :date, :bank_id)
  end
end