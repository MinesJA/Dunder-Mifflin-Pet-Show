class DogsController < ApplicationController

  before_action :get_dog, only: [:show, :edit, :update, :destroy]

  def index
    @dogs = Dog.all
    @dogs = @dogs.sort { |dog_1, dog_2| dog_2.employees.count <=> dog_1.employees.count }
  end

  def new
    @dog = Dog.new
    @employees = Employee.all
  end

  def show
    @employees = Employee.all
  end

  def create
    @dog = Dog.create(dog_params)

    if @dog.valid?
      redirect_to dog_path(@dog)
    else
      flash[:errors] = @dog.errors.full_messages
      redirect_to new_dog_path
    end
  end

  def edit
    @employees = Employee.all
  end

  def update
    @dog.update(dog_params)
    if @dog.valid?
      redirect_to dog_path(@dog)
    else
      flash[:errors] = @dog.errors.full_messages
      redirect_to new_dog_path
    end
  end

  def destroy
    @dog.destroy
    redirect_to dogs_path
  end

  private

  def get_dog
    @dog = Dog.find(params[:id])
  end

  def dog_params
    params.require(:dog).permit(:name, :breed, :age, employee_ids: [])
  end


end
