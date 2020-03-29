# TinyMCE AWS File Upload

This gem basically includes TinyMCE 4 (thanks to gem [tinymce-rails](https://github.com/spohlenz/tinymce-rails/tree/tinymce-4)) and adds a File Upload functionality to it.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tinymce_aws_file_upload', git: 'git@github.com:PHCruz-Software/tinymce_aws_file_upload.git'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tinymce_aws_file_upload

## Usage

### On your application.js add the line:

```javascript
//= require tinymce-aws-file-upload
```

### You need to configure your AWS bucket but setting these environment variables:

> Don't forget to set the bucket permissions [adding CORS configuration.](https://docs.aws.amazon.com/AmazonS3/latest/dev/cors.html#how-do-i-enable-cors)

1. AWS_ACCESS_KEY_ID
2. AWS_SECRET_ACCESS_KEY
3. AWS_BUCKET
4. AWS_AREA
5. HOST (development will be http://localhost:3000/)

> If you need help to configure environment variables at development, Heroku has a nice [tutorial](https://devcenter.heroku.com/articles/getting-started-with-rails4).
> To configure them on Heroku, you can see it [here](https://devcenter.heroku.com/articles/config-vars)

### In your coffeescript files add

```coffeescript
root = exports ? this
root.initTinyMCE('class')
```
where class is a class you should add to all textareas which you want to add the Tinymce rich text editor.

### Loading

If the function root.start_loading() and root.stop_loading() exists, those will be called when the file starts uploading and when it ends, respectively.

### Author

This gem was originally created by [Ariel Schvartz](https://github.com/arielschvartz)

## Contributing

1. Fork it ( http://github.com/arielschvartz/tinymce_aws_file_upload/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
