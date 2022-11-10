# CNS Brazil
 - CNS (Cartão Nacional de Saúde) - CNS is a national health card
 - Is a validator and generator based in algorithm from https://integracao.esusab.ufsc.br/v211/docs/algoritmo_CNS.html

## Usage
### Installing
Add this line to your application's Gemfile:

    gem 'cns_brazil'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cns_brazil

### Validator
#### ActiveRecord

 - Just use as any other validator:

```ruby
class User < ActiveRecord::Base
  validates :cns, '::CnsBrazil::Cns': true
end
```
 - Use with anny column name

```ruby
class User < ActiveRecord::Base
  validates :my_cns, '::CnsBrazil::Cns': true
end
```

 - Allow blank value

```ruby
class User < ActiveRecord::Base
  validates :cns, '::CnsBrazil::Cns': true, allow_blank: true
end
```

#### Elsewhere

```ruby
require "cns_brazil"

cns_validator = CnsBrazil::Cns.new(value: '1234567891234516')

cns_validator.valid? # true || false
```

### Generator

```ruby
require "cns_brazil"

CnsBrazil::Cns.generate  # returns a valida CNS
```

### Test

Use in your tests:

```ruby
specify { is_expected.to validate_cns } # It will test the attribute :cns by default
specify { is_expected.to validate_cns(:my_cns) }
```
With blank value

```ruby
specify { is_expected.to validate_cns.allow_blank }
specify { is_expected.to validate_cns(:my_cns).allow_blank }
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
