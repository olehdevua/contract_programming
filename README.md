# ContractProgramming

This small gem make contract programming in ruby more convenient

## Installation

In console

    user:~$ git clone https://github.com/OlegTsyba/contract_programming
    user:~$ cd contract_programming
    user:~$ gem build contract_programming.gemspec
    user:~$ gem install contract_programming-0.0.1.gem

Add this line to your application's Gemfile:

    gem 'contract_programming'

And then execute:

    $ bundle install

## Usage

```ruby
class Ex
  extend ContractProgramming

  contract def meth(num)
    num.to_s
  end

  def pre_meth(num)
    check_it 'must be a num', Fixnum === num
  end

  def post_meth(result)
    check_it 'must be a string', String === result
  end
end

Ex.new.meth 1   # successfully
Ex.new.meth '1' # raise ArgumentError, 'must be a num'

class Ex
  def meth(num)
    num
  end
end

Ex.new.meth 1   # raise ArgumentError, 'must be a string'
```

## Contributing

1. Fork it ( https://github.com/OlegTsyba/contract_programming/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
