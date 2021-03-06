class DataNotesController < ApplicationController
  # GET /data_notes
  # GET /data_notes.json
  def index
    @data_notes = DataNote.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @data_notes }
    end
  end

  # GET /data_notes/1
  # GET /data_notes/1.json
  def show
    @data_note = DataNote.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @data_note }
    end
  end

  # GET /data_notes/new
  # GET /data_notes/new.json
  def new
    @data_note = DataNote.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @data_note }
    end
  end

  # GET /data_notes/1/edit
  def edit
    @data_note = DataNote.find(params[:id])
  end

  # POST /data_notes
  # POST /data_notes.json
  def create
    @data_source = DataSource.find(params[:data_source_id])

    @data_note = @data_source.data_notes.create(params[:data_note])

    redirect_to data_source_path(@data_source)
  end

  # PUT /data_notes/1
  # PUT /data_notes/1.json
  def update
    @data_note = DataNote.find(params[:id])

    respond_to do |format|
      if @data_note.update_attributes(params[:data_note])
        format.html { redirect_to @data_note.data_source, notice: 'Data note was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @data_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /data_notes/1
  # DELETE /data_notes/1.json
  def destroy
    @data_note = DataNote.find(params[:id])
    @data_note.destroy

    respond_to do |format|
      format.html { redirect_to data_sources_url }
      format.json { head :no_content }
    end
  end
end
