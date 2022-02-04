class MembershipsController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :record_invalid


    def create
        membership = Membership.create!(mem_params)
        render json: membership, status: :created
    end

    private

    def mem_params
        params.permit(:gym_id, :client_id, :charge)
    end

    def record_invalid(invalid)
        render json: {error: invalid.record.errors.full_messages}
    end
end
