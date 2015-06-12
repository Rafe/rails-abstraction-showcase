#Rails abstraction showcase

[Blog link](http://neethack.com/2015/06/rails-abstraction-showcase/)

## What is this?

Rails abstraction showcase is the todomvc for Rails abstraction frameworks.
It is an example shopping cart application that using several different abstraction framework to extract business logics from controller and model,
to let user can compare the difference in between abstraction frameworks.

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
+ [Mutation](https://github.com/cypriss/mutations)
+ [Surrunded](https://github.com/saturnflyer/surrounded)
+ [Trialblazer](https://github.com/apotonick/trailblazer)
+ [wisper](https://github.com/krisleech/wisper)
