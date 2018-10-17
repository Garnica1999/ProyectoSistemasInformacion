class Academics::GroupsController < ApplicationController
	layout 'teachers'
	def index
		@groups = Group.all
	end
	def show 
	    #ENCONTRAR REGISTRO POR EL ID
	  	@group = Group.find(params[:id])
	end

	def new
  		@group = Group.new
  		@groups = Group.all
  	end

	def create
		id_subject = params[:group][:subject_id].split("-").at(0).to_i
		id_teacher = params[:group][:teacher_id].split("-").at(0).to_i
		@group = Group.new(group_params)
		@group.teacher_id = id_teacher
		@group.subject_id = id_subject
	    if @group.save
	    	puts 'Registrado'
	      redirect_to academic_group_path(@group)
	    else
	      puts @group.errors.inspect
	      render :new
	    end
	end

	def update
		id_subject = params[:group][:subject_id].split("-").at(0).to_i
		id_teacher = params[:group][:teacher_id].split("-").at(0).to_i
	    @group = Group.find(params[:id])
	    if @group.update(group_params)
	      redirect_to @group
	    else
	      render :new
		end
	end

	def edit
		@group = Group.find(params[:id])
	end

	private

	def group_params
		params.require(:group).permit(:codigo)
	end
end
