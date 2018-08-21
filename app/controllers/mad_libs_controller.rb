class MadLibsController < ApplicationController
  def new
    @mad_lib = MadLib.new
  end

  def show
    @mad_lib = MadLib.find(params[:id])
  end

  def create
    @mad_lib = MadLib.new(:text => params[:mad_lib][:text])
    if @mad_lib.save
      redirect_to @mad_lib
    else
      render 'new'
    end
  end
end
