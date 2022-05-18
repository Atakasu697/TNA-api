module V1
  class WorkRecordsController < ApplicationController
    before_action :set_work_record, only: [:show, :update, :destroy]

    def index
      work_records = WorkRecord.order(created_at: :desc)
      render json: {status: 'SUCCESS', message: 'Loaded work_records', data: work_records}
    end

    def show
      render json: {status: 'SUCCESS', message: 'Loaded the work_record', data: @work_record}
    end

    def create
      logger.debug('===============test log create================')
      work_record = WorkRecord.new(work_record_params)
      logger.debug(work_record)
      if work_record.save
        render json: {states: 'SUCCESS', data: work_record}
      else
        render json: {status: 'ERROR', data: work_record.errors}
      end
    end

    def destroy
      @work_record.destroy
      render json: {status: 'SUCCESS', message: 'Deleted the work_record', data: @work_record}
    end

    def update
      if @work_record.update(work_record_params)
        render json: {status: 'SUCCESS', message: 'Updated the work_record', data: @work_record}
      else
        render json: {status: 'ERROR', message: 'Not updated', data: @work_record.errors }
      end
    end

    private

    def set_work_record
      @work_record = WorkRecord.find(params[:id])
    end

    def work_record_params
      params.permit(:name)
    end
  end
end
