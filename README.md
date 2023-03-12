# Harkness

A full-featured and painstakingly documented library for working (playing) with the [Marvel API](https://developer.marvel.com/docs).

![main](https://github.com/duffn/harkness/actions/workflows/test.yml/badge.svg) [![codecov](https://codecov.io/gh/duffn/harkness/branch/main/graph/badge.svg?token=9XUA33QIM2)](https://codecov.io/gh/duffn/harkness) [![Gem Version](https://badge.fury.io/rb/harkness.svg)](https://badge.fury.io/rb/harkness)

## Installation

Install the gem and add to the application's Gemfile by executing:

```
bundle add harkness
```

If bundler is not being used to manage dependencies, install the gem by executing:

```
gem install harkness
```

## Usage

- Get your Marvel API public key and private key on your [Marvel developer account](https://developer.marvel.com/account).

- Set your public key and private key as environment variables using your preferred method.

```bash
export MARVEL_PUBLIC_KEY=my_public_key
export MARVEL_PRIVATE_KEY=my_private_key
```

- Create a Harkness client.

```ruby
require "harkness"

client = Harkness::Client.new(public_key: ENV["MARVEL_PUBLIC_KEY"], private_key: ENV["MARVEL_PRIVATE_KEY"])
```

- Use the client to access API resources.

  - Use `list` on any resource to get all, paginated, items for that resource.

    - Pass any [valid parameters](https://developer.marvel.com/docs) to the `list` method.

    ```ruby
    client.characters.list(nameStartsWith: "Ant-", limit: 10, orderBy: "-modified")
    ```

  - Use `retrieve` to get a single resource by ID.
  - Get related resources, too!
    - Ex. `client.comics.characters(comic_id: 1234)` will get all characters for the comic with ID `1234`.

- All resources are classes in the `Harkness` module and attributes can be easily accessed just as you would access them normally.

```
irb(main):001:0> client = Harkness::Client.new(public_key: ENV["MARVEL_PUBLIC_KEY"], private_key: ENV["MARVEL_PRIVATE_KEY"])
=>
#<Harkness::Client:0x00000001083a93d8
...
irb(main):002:0> character = client.characters.list(nameStartsWith: "Ant-", limit: 1, orderBy: "modified")
=>
#<Harkness::CharacterDataWrapper:0x0000000108c740f8
...
irb(main):003:0> character.data.results[0].name
=> "Ant-Man (Eric O'Grady)"
```

### Resources

#### Characters

```ruby
client.characters.list
client.characters.retrieve(character_id: 1234)
client.characters.comics(character_id: 1234)
client.characters.events(character_id: 1234)
client.characters.series(character_id: 1234)
client.characters.stories(character_id: 1234)
```

#### Comics

```ruby
client.comics.list
client.comics.retrieve(comic_id: 1234)
client.comics.characters(comic_id: 1234)
client.comics.creators(comic_id: 1234)
client.comics.events(comic_id: 1234)
client.comics.stories(comic_id: 1234)
```

#### Creators

```ruby
client.creators.list
client.creators.retrieve(comic_id: 1234)
client.creators.comics(creator_id: 1234)
client.creators.events(creator_id: 1234)
client.creators.series(creator_id: 1234)
client.creators.stories(creator_id: 1234)
```

#### Events

```ruby
client.events.list
client.events.retrieve(event_id: 1234)
client.events.comics(event_id: 1234)
client.events.series(event_id: 1234)
client.events.creators(event_id: 1234)
client.events.characters(event_id: 1234)
client.events.stories(event_id: 1234)
```

#### Series

```ruby
client.series.list
client.series.retrieve(series_id: 1234)
client.series.comics(series_id: 1234)
client.series.events(series_id: 1234)
client.series.creators(series_id: 1234)
client.series.characters(series_id: 1234)
client.series.stories(series_id: 1234)
```

#### Stories

```ruby
client.stories.list
client.stories.retrieve(story_id: 1234)
client.stories.comics(story_id: 1234)
client.stories.events(story_id: 1234)
client.stories.creators(story_id: 1234)
client.stories.characters(story_id: 1234)
client.stories.series(story_id: 1234)
```

## Docs

- Browse the painstakingly documented [RubyDoc](https://rubydoc.info/gems/harkness).
- View the interactive [API tester at Marvel](https://developer.marvel.com/docs).

## Contributing

See [contributing](CONTRIBUTING.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting with the Harkness project is expected to follow the [code of conduct](https://github.com/duffn/harkness/blob/main/CODE_OF_CONDUCT.md).
