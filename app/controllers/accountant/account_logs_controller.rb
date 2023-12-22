module Accountant
  class AccountLogsController < ApplicationController
    before_action :set_account_log, only: %i[ show update destroy ]

    # GET /account_logs
    def index
      @account_logs = AccountLog.all

      render json: @account_logs
    end

    # GET /account_logs/1
    def show
      render json: @account_log
    end

    # POST /account_logs
    def create
      @account_log = AccountLog.new(account_log_params)

      if @account_log.save
        render json: @account_log, status: :created, location: @account_log
      else
        render json: @account_log.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /account_logs/1
    def update
      if @account_log.update(account_log_params)
        render json: @account_log
      else
        render json: @account_log.errors, status: :unprocessable_entity
      end
    end

    # DELETE /account_logs/1
    def destroy
      @account_log.destroy!
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_account_log
        @account_log = AccountLog.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def account_log_params
        params.require(:account_log).permit(:account_id, :delta, :balance_after, :related_account_id, :memo)
      end
  end
end
