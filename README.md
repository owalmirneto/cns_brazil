## Usage

Just use as any other validator:

```ruby
class User < ActiveRecord::Base
  validates :cns, cns: true
end
```
Or

```ruby
class User < ActiveRecord::Base
  validates :my_cns, cns: true
end
```

## Contributing

 - Run using Docker: `docker-compose run web bash`
 - In bash Run: `bundle install`
 - Run spec: `spec`

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
