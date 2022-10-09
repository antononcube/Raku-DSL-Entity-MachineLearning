# DSL::Entity::MachineLearning (Raku package)

Raku grammar classes for Machine Learning (ML) entities (names.)

The package does entity name recognition using regexes over a set of 
hashes (dictionaries) that map entity name phrases into entity Identifiers (IDs).
The hashes are obtained from [the resource files](./resources).

In short, we say that the package has grammar-resource-based architecture. 
The same architecture is used in the Domain Specific Language (DSL) entity packages [AAr3-AAr6]. 

**Remark:** It is assumed that the associations between entity name phrases and entity IDs
placed in the resource files are going to be changed in the future, because of classifier
systems updates, or usage feedback. This is one of the main reasons to use grammar-resource-based 
architecture: subsequent package versions would have better, fuller associations.

------

## Installation

```shell
zef install https://github.com/antononcube/Raku-DSL-Entity-MachineLearning.git
```

------

## Usage examples

```perl6
use DSL::Entity::MachineLearning;
use DSL::Entity::MachineLearning::ResourceAccess;

my $pCOMMAND = DSL::Entity::MachineLearning::Grammar;
$pCOMMAND.set-resources(DSL::Entity::MachineLearning::resource-access-object());

say $pCOMMAND.parse('DecisionTree', rule => 'machine-learning-entity-command');
say $pCOMMAND.parse('gradient boosted trees', rule => 'machine-learning-entity-command');
say $pCOMMAND.parse('roc curve', rule => 'machine-learning-entity-command');
```

------

## Command line interface

The package provide as Command Line Interface (CLI) to its functionalities:

```shell
> ToMachineLearningEntityCode --help 
# Usage:
#   ToMachineLearningEntityCode <command> [--target=<Str>] [--user=<Str>] -- Conversion of (natural) DSL machine learning entity name into code.
#   ToMachineLearningEntityCode <target> <command> [--user=<Str>] -- Both target and command as arguments.
#   
#     <command>         natural language command (DSL commands)
#     --target=<Str>    target language/system/package (defaults to 'WL-System') [default: 'WL-System']
#     --user=<Str>      user identifier (defaults to '') [default: '']
#     <target>          Programming language.
```

**Remark:** (Currently) the CLI script always returns results in JSON format. 

------

## Resource files

The resource file:

1. ["ClassifierNameToEntityID_EN.csv"](./resources/ClassifierNameToEntityID_EN.csv),
   was derived from the Mathematica function page for 
   [`Classify`](https://reference.wolfram.com/language/ref/Classify.html), [WRI1].

2. ["ClassifierMeasurementNameToEntityID_EN.csv"](./resources/ClassifierMeasurementNameToEntityID_EN.csv) 
   was derived using Mathematica's built-in function 
   [`ClassifierMeasurements`](https://reference.wolfram.com/language/ref/ClassifierMeasurements.html), [WRI3].
   Some additional associations were put in following [WK1].

3. ["ClassifierPropertyNameToEntityID_EN.csv"](./resources/ClassifierPropertyNameToEntityID_EN.csv),
   was derived using Mathematica's built-in function
   [`Information`](https://reference.wolfram.com/language/ref/Information.html), [WRI4].

4. ["ROCFunctionNameToEntityID_EN.csv"](./resources/ROCFunctionNameToEntityID_EN.csv)
   uses the names and mappings in [WK1]. (See also the related package [AAr7].)


The initial versions Bulgarian versions of the resource files with name suffix "_BG.csv" were 
derived by automatic translations of the corresponding English content.
Afterwards the Bulgarian mappings were reviewed and manually modified.

------

## References

### Articles

[WK1] Wikipedia entry, ["Receiver operating characteristic"](https://en.wikipedia.org/wiki/Receiver_operating_characteristic).

### Wolfram Language (WL) articles and functions

[WRI1] Wolfram Research (2014), 
[Classify](https://reference.wolfram.com/language/ref/Classify.html), 
Wolfram Language function, https://reference.wolfram.com/language/ref/Classify.html (updated 2021).

[WRI2] Wolfram Research, Inc.,
[Machine Learning Methods](https://reference.wolfram.com/language/guide/MachineLearningMethods.html).

[WRI3] Wolfram Research (2014), 
[ClassifierMeasurements](https://reference.wolfram.com/language/ref/ClassifierMeasurements.html), 
Wolfram Language function, https://reference.wolfram.com/language/ref/ClassifierMeasurements.html (updated 2021).

[WRI4] Wolfram Research (1988), 
[Information](https://reference.wolfram.com/language/ref/Information.html), 
Wolfram Language function, https://reference.wolfram.com/language/ref/Information.html (updated 2021).

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

[AAr7] Anton Antonov,
[ML::ROCFunctions Raku package](https://github.com/antononcube/Raku-ML-ROCFunctions),
(2022),
[GitHub/antononcube](https://github.com/antononcube).