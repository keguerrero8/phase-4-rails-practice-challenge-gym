class ClientsController < ApplicationController

    def show
        client = Client.find(params[:id])
        render json: client, serializer: ClientMembershipSerializer
    rescue ActiveRecord::RecordNotFound
        render json: {error: "client not found"}, status: :not_found
    end

end
