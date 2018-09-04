class MadLibsController < ApplicationController
  def index
    @mad_libs = MadLib.all
  end

  def new
    @mad_lib = MadLib.new
  end

  def create
    @mad_lib = MadLib.new(:text => params[:mad_lib][:text])
    if @mad_lib.save
      flash[:notice] = 'New Mad Lib created'
      redirect_to @mad_lib
    else
      render 'new'
    end
  end

  def show
    @mad_lib = MadLib.find(params[:id])
    @solution = @mad_lib.solutions.new
  end
end
