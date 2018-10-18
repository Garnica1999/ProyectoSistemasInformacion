class Registers::Students::NotesController < ApplicationController
	layout 'teachers'
	def index
		@id_student = params[:student_id]
		@notes = Student.find(@id_student).notes
	end

	def edit
		@note = Note.find(params[:note_id])
	end

	def new
		@note = Note.new

	end

	def create
		@group_id = params[:note][:group_id].split("-").at(0).to_i
		@subject_id = params[:note][:subject_id].split("-").at(0).to_i
		@student_id = params[:student_id].to_i
		subject_name = Group.find(@group_id).subject.nombre
		subject = Subject.find(@subject_id).nombre
		if subject_name == subject
			@student = Student.find(@student_id)
			@note = @student.notes.new(note_params)
			@note.subject_id = @subject_id
			@note.group_id = @group_id
			if @note.save
				redirect_to registers_student_notes_path
			else
				puts @note.errors.inspect
				render :new
			end
		else
			puts 'La materia escogida no esta en el grupo seleccionado'
		end

	end

	def edit
		@note = Student.find(params[:student_id]).notes.find(params[:note_id])
	end

	def update

		@group_id = params[:note][:group_id].split("-").at(0).to_i
		@subject_id = params[:note][:subject_id].split("-").at(0).to_i
		@student_id = params[:student_id].to_i
		subject_name = Group.find(@group_id).subject.nombre
		subject = Subject.find(@subject_id).nombre
		if subject_name == subject
			@student = Student.find(@student_id)
			@note = @student.notes.find(params[:note_id])
			@note.subject_id = @subject_id
			@note.group_id = @group_id
			if @note.update(note_params)
				redirect_to registers_student_notes_path
			else
				puts @note.errors.inspect
				render :new
			end
		else
			puts 'La materia escogida no esta en el grupo seleccionado'
		end
	end

	def destroy
		@note = Student.find(params[:student_id]).notes.find(params[:note_id])
		@note.destroy
		redirect_to registers_student_notes_path
	end

	private

	def note_params
		params.require(:note).permit(:nota)
	end
end
