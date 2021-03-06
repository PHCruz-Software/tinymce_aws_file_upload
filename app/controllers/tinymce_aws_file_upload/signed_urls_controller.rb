module TinymceAwsFileUpload
  class SignedUrlsController < ApplicationController
    def index
      respond_to do |format|
        format.json do
          render json: {
            policy: s3_upload_policy_document,
            signature: s3_upload_signature,
            key: "uploads/#{SecureRandom.uuid}/#{params[:doc][:title]}",
            success_action_redirect: ENV['HOST'],
            access_key_id: ENV['AWS_ACCESS_KEY_ID'],
            bucket: ENV['AWS_BUCKET'],
            s3_area: ENV['AWS_AREA']
          }
        end
      end
    end

    private

      # generate the policy document that amazon is expecting.
      def s3_upload_policy_document
        Base64.encode64(
          {
            expiration: 10.hours.from_now.utc.strftime("%Y-%m-%dT%H:%M:%S0Z"),
            conditions: [
              { bucket: ENV['AWS_BUCKET'] },
              ["starts-with", "$key", "uploads/"],
              { acl: 'public-read' },
              ["starts-with", "$Content-Type", ""]
            ]
          }.to_json
        ).gsub("\n", "")
      end

      # sign our request by Base64 encoding the policy document.
      def s3_upload_signature
        Base64.encode64(
          OpenSSL::HMAC.digest(
            OpenSSL::Digest.new('sha1'),
            ENV['AWS_SECRET_ACCESS_KEY'],
            s3_upload_policy_document
          )
        ).gsub("\n","")
      end
  end
end
