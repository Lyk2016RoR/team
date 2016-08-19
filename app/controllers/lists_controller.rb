class ListsController < ApplicationController


  def new
    @list = List.new
    load_data
  end

  def index
    @lists = List.all
  end

  def create
    @list = current_user.lists.build(list_params)

    if @list.save!
      redirect_to list_path(@list), notice: "List Saved"
    else
      load_data
      render 'lists/new'
    end
  end

  def destroy
    set_list
    @list.destroy
    redirect_to lists_path
  end

  def show
    set_list
  end


  private

  def list_params
    params.require(:list).permit(:name, book_ids: [])
  end

  def set_list
    @list = List.find(params[:id])
  end

  def load_data
    @books = Book.all.collect {|b| [b.name, b.id]}
  end
end
