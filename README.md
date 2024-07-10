<div align="center">
  <a href="https://github.com/shunsock/ruby_playground">
    <img alt="ruby sorbet" src="image/ruby_sorbet.jpg">
  </a>
</div>

## <div align="center"> Ruby Playground </div>

<p align="center">
    This is a playground for Ruby with Sorbet and MiniTest.
</p>

<p align="center">
  <a href="./LICENSE">
    <img alt="LICENSE" src="https://img.shields.io/badge/license-MIT-blue.svg?maxAge=43200"></a>
  <a href="https://www.rust-lang.org/">
    <img alt="rust" src="https://img.shields.io/badge/logo-ruby-red?logo=ruby"></a>
  <a href="https://github.com/shunsock/ruby_playground/actions/workflows/fizz_buzz.yml">
    <img alt="workflow" src="https://github.com/shunsock/ruby_playground/actions/workflows/fizz_buzz.yml/badge.svg"></a>
</p>

## Getting Started (sorbet_getting_started container)
Before you start, we recommend to run `sorbet_getting_started` container to learn Sorbet.
in this container, you can learn Sorbet behavior in Ruby.

### Build and Run Docker Container
```bash
docker compose up -d
docker compose exec sorbet_getting_started bash
```

### Check Sorbet Installation
you can check the installation of Sorbet by running the following command.
```bash
bash app/sorbet_varify_installation.sh
```
Reference: [Sorbet Getting Started: Varify installation](https://sorbet.org/docs/adopting#verify-installation)

### Check Sorbet Static Typing
you can check the static typing of Sorbet by running the following command.
```bash
bundle exec srb tc
```

The output will be like this:
```bash
app/sorbet_static_example.rb:11: Not enough arguments provided for method Object#main. Expected: 1, got: 0 https://srb.help/7004
    11 |main()   # error: Not enough arguments provided
            ^^
    app/sorbet_static_example.rb:5: Object#main defined here
     5 |def main(name)
        ^^^^^^^^^^^^^^

app/sorbet_static_example.rb:12: Method man does not exist on T.class_of(<root>) https://srb.help/7003
    12 |man("")  # error: Method `man` does not exist
        ^^^
  Did you mean main? Use -a to autocorrect
    app/sorbet_static_example.rb:12: Replace with main
    12 |man("")  # error: Method `man` does not exist
        ^^^
    app/sorbet_static_example.rb:5: Defined here
     5 |def main(name)
        ^^^^^^^^^^^^^^
Errors: 2
```

### Check Sorbet Runtime Typing
you can check the runtime typing of Sorbet by running the following command.
```bash
bundle exec ruby app/sorbet_runtime_example.rb
```

The output will be like this:
```bash
/usr/local/bundle/gems/sorbet-runtime-0.5.11473/lib/types/configuration.rb:296:in `call_validation_error_handler_default': Parameter 'x': Expected type Integer, got type Array with value [] (TypeError)
Caller: app/sorbet_runtime_example.rb:13
Definition: app/sorbet_runtime_example.rb:8 (Example.main)

    raise TypeError.new(opts[:pretty_message])
          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
        from /usr/local/bundle/gems/sorbet-runtime-0.5.11473/lib/types/configuration.rb:303:in `call_validation_error_handler'
        from /usr/local/bundle/gems/sorbet-runtime-0.5.11473/lib/types/private/methods/call_validation.rb:310:in `report_error'
        from /usr/local/bundle/gems/sorbet-runtime-0.5.11473/lib/types/private/methods/call_validation.rb:218:in `block in validate_call'
        from /usr/local/bundle/gems/sorbet-runtime-0.5.11473/lib/types/private/methods/signature.rb:213:in `each_args_value_type'
        from /usr/local/bundle/gems/sorbet-runtime-0.5.11473/lib/types/private/methods/call_validation.rb:215:in `validate_call'
        from /usr/local/bundle/gems/sorbet-runtime-0.5.11473/lib/types/private/methods/_methods.rb:277:in `block in _on_method_added'
        from app/sorbet_runtime_example.rb:13:in `<main>'
```

## Getting Started (fizz_buzz_container)
in this container, you can learn how to implement code for FizzBuzz.

### Build and Run Docker Container
```bash
docker compose up -d
docker compose exec fizz_buzz bash
```

### Check FizzBuzz
you can check the FizzBuzz code by running the following command.

```bash
docker compose exec fizz_buzz bash # join the container
bundle exec ruby app/fizz_buzz.rb # run the code
```

By default, the code will print the following output.
```bash
root@84cca8c1b0b1:/usr/src/app# bundle exec ruby app/main.rb
1
2
Fizz
4
Buzz
Fizz
7
8
Fizz
Buzz
11
Fizz
13
14
FizzBuzz
16
17
Fizz
19
Buzz
Fizz
22
23
Fizz
Buzz
26
Fizz
28
29
FizzBuzz
```

Of couse, you can change the range of the FizzBuzz by changing the following code in `app/main.rb`.

```ruby
# typed: strict
require 'sorbet-runtime'
require_relative 'service/fizz_buzz_runner'

class Program
  extend T::Sig

  sig { void }
  def self.main
    loop = Loop.new(1, 30)
    fizz_buzz_runner = FizzBuzzRunner.new(loop: loop)
    fizz_buzz_runner.run
  end
end

Program.main
```

### Workflow
we are using the following workflow to run static type checking and runtime type checking.

1. check static analysis with [Sorbet CLI](https://sorbet.org/docs/cli#config-file)
2. test files with [MiniTest](https://github.com/minitest/minitest)
3. observe type of methods and variables in runtime with [Sorbet Runtime](https://sorbet.org/docs/runtime)

Following setting is in `fizz_buzz/src/workflow.sh`.

```sh
# Run static analysis
bundle exec srb tc

# Run all tests
bundle exec ruby -Itest -e 'Dir.glob("./test/**/*_test.rb") { |file| require file }'
```

