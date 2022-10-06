# Raku DSL::Entity::MachineLearning

Raku grammar classes for Machine Learning (ML) entities (names.)

------

## Installation

```shell
zef install https://github.com/antononcube/Raku-DSL-Entity-MachineLearning.git
```

------

## Examples

```perl6
use DSL::Entity::MachineLearning;
use DSL::Entity::MachineLearning::ResourceAccess;

my $pCOMMAND = DSL::Entity::MachineLearning::Grammar;
$pCOMMAND.set-resources(DSL::Entity::MachineLearning::resource-access-object());

say $pCOMMAND.parse('DecisionTree', rule => 'machine-learning-entity-command');
say $pCOMMAND.parse('gradient boosted trees', rule => 'machine-learning-entity-command');
say $pCOMMAND.parse('roc curve', rule => 'machine-learning-entity-command');
```
```
# ｢DecisionTree｣
#  classifier-entity-command => ｢DecisionTree｣
#   entity-classifier-name => ｢DecisionTree｣
#    0 => ｢DecisionTree｣
#     word-value => ｢DecisionTree｣
# ｢gradient boosted trees｣
#  classifier-entity-command => ｢gradient boosted trees｣
#   entity-classifier-name => ｢gradient boosted trees｣
#    0 => ｢gradient boosted trees｣
#     word-value => ｢gradient｣
#     word-value => ｢boosted｣
#     word-value => ｢trees｣
# ｢roc curve｣
#  classifier-property-entity-command => ｢roc curve｣
#   entity-classifier-property-name => ｢roc curve｣
#    0 => ｢roc curve｣
#     word-value => ｢roc｣
#     word-value => ｢curve｣
```

------

## References

### Classify and methods

[WRI1] Wolfram Research, Inc.,
[Classify](https://reference.wolfram.com/language/ref/Classify.html).

[WRI2] Wolfram Research, Inc.,
[Machine Learning Methods](https://reference.wolfram.com/language/guide/MachineLearningMethods.html).

### Repositories

[AAr1] Anton Antonov,
[DSL::English::ClassificationWorkflows Raku package](https://github.com/antononcube/Raku-DSL-English-ClassificationWorkflows),
(2020-2022),
[GitHub/antononcube](https://github.com/antononcube).

[AAr2] Anton Antonov,
[DSL::Shared Raku package](https://github.com/antononcube/Raku-DSL-Shared),
(2020),
[GitHub/antononcube](https://github.com/antononcube).

[AAr3] Anton Antonov,
[DSL::Entity::Geographics Raku package](https://github.com/antononcube/Raku-DSL-Entity-Geographics),
(2021),
[GitHub/antononcube](https://github.com/antononcube).

[AAr4] Anton Antonov,
[DSL::Entity::Jobs Raku package](https://github.com/antononcube/Raku-DSL-Entity-Jobs),
(2021),
[GitHub/antononcube](https://github.com/antononcube).

[AAr5] Anton Antonov,
[DSL::Entity::Foods Raku package](https://github.com/antononcube/Raku-DSL-Entity-Foods),
(2021),
[GitHub/antononcube](https://github.com/antononcube).

[AAr6] Anton Antonov,
[DSL::Entity::Metadata Raku package](https://github.com/antononcube/Raku-DSL-Entity-Metadata),
(2021),
[GitHub/antononcube](https://github.com/antononcube).