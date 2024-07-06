# Ruby Playground
This is a playground for Ruby. In this repository, I will show you some examples of Ruby code.

## Getting Started
### Build and Run Docker Container
```bash
docker compose up -d
docker compose exec ruby bash
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

## Files and Directories
Notice that `sorbet_runtime_example.rb` could not be raised an error, Because `type: false` is set on the top of the file.

```bash
.
├── Dockerfile
├── README.md
├── compose.yml
└── src
    ├── Gemfile
    ├── Gemfile.lock
    ├── app
    │   ├── sorbet_runtime_example.rb
    │   ├── sorbet_static_example.rb
    │   └── sorbet_varify_installation.sh
    ├── bin
    │   └── tapioca
    └── sorbet
```
