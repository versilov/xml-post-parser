class StaticController < ApplicationController
  def new
    @barcode = Barcode.new
  end
  def create
    @barcode = Barcode.new(barcode_params)
    if @barcode.save
      flash[:success] = @barcode
    else
      flash[:danger] = @barcode.errors.full_messages.to_sentence
    end
    redirect_to "/"
  end

  private
  def barcode_params
    params.require(:barcode).permit(:xmlbarcode)
  end

end
