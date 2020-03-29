Rails.application.routes.draw do
  get 'tinymce_aws_file_upload/signed_urls' => 'tinymce_aws_file_upload/signed_urls#index', as: :signed_urls
end
