# benchmark-container

Make benchmark for existing container engine, for example, PouchContainer and Moby.

The benchmark is running by [bucketbench](https://github.com/estesp/bucketbench).
In order to make it suit for PouchContainer, 
I make a [patch](https://github.com/fuweid/bucketbench/commit/3891293c732da4102e2a86a2cdc99899a9c25f7d) in my own fork.

## TODO

Currently, the scripts only runs `run`, `stop` and `remove` actions. And it doesn't
extract the result for review.

* [ ] get more performance metrics
* [ ] extract the result in the form format
* [ ] nightly build
* [ ] slack/email notification
