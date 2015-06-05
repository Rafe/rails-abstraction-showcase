#Rails abstraction showcase

## What is this?

Rails abstraction showcase is the todomvc for Rails abstraction frameworks.
It is an example shopping cart application that using several different abstraction framework to simplify logics.
To let user can compare different abstraction frameworks.

## Install

```
bundle install
bundle exec rake db:create db:migrate db:seed
bin/rails server
```

## Checking different abstractions

The master branch is an simple shopping cart application,
you can checkout branches to check the project refactored with differernt abstraction frameworks.

```
git branch -a
git checkout [abstraction framework name]
```

## Implemented frameworks

+ [ActiveInteraction](https://github.com/orgsync/active_interaction)
+ [Decent Exposure](https://github.com/hashrocket/decent_exposure)
+ [Interactor](https://github.com/collectiveidea/interactor)
+ [Light Service](https://github.com/adomokos/light-service)
+ todo: [Mutation](https://github.com/cypriss/mutations)
+ todo: [Surrunded](https://github.com/saturnflyer/surrounded)
+ todo: [Trialblazer](https://github.com/apotonick/trailblazer)
+ todo: [wisper](https://github.com/krisleech/wisper)
