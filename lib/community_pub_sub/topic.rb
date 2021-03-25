module CommunityPubSub
  class Topic

    def initialize
      pubsub = Google::Cloud::Pubsub.new(
          project:     ENV.fetch('GOOGLE_CLOUD_PROJECT'),
          credentials: {
              type:                        ENV.fetch('GCP_TYPE'),
              project_id:                  ENV.fetch('GCP_PROJECT_ID'),
              private_key_id:              ENV.fetch('GCP_PRIVATE_KEY_ID'),
              private_key:                 ENV.fetch('GCP_PRIVATE_KEY'),
              client_email:                ENV.fetch('GCP_CLIENT_EMAIL'),
              client_id:                   ENV.fetch('GCP_CLIENT_ID'),
              auth_uri:                    ENV.fetch('GCP_AUTH_URI'),
              token_uri:                   ENV.fetch('GCP_TOKEN_URI'),
              auth_provider_x509_cert_url: ENV.fetch('GCP_AUTH_PROVIDER_URL'),
              client_x509_cert_url:        ENV.fetch('GCP_CLIENT_CERT_URL')
          }
      )

      topic_name = ENV.fetch('GCP_TOPIC_NAME')
      @topic = pubsub.topic(topic_name) || pubsub.create_topic(topic_name)
    end

    def publish_event(event_data)
      @topic.publish(event_data)
    end

    def get_subscriber
      topic_name = ENV.fetch('GCP_TOPIC_NAME')
      @subscriber ||= @topic.get_subscription("#{topic_name}_sub") || @topic.subscribe("#{topic_name}_sub")
    end
  end
end
