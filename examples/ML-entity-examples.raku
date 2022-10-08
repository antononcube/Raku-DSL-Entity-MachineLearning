use lib './lib';
use lib '.';
use DSL::Entity::MachineLearning;
use DSL::Entity::MachineLearning::ResourceAccess;

use Pretty::Table;
use Data::Reshapers;

#
#my DSL::Entity::MachineLearning::ResourceAccess $resource2.instance;
#
#say 'Number of resource objects:', $resource.getNumberOfInstances();

my $pCOMMAND = DSL::Entity::MachineLearning::Grammar;

$pCOMMAND.set-resources(DSL::Entity::MachineLearning::resource-access-object());

#.say for DSL::Entity::MachineLearning::resource-access-object().getNameToEntityID();
#.say for DSL::Entity::MachineLearning::resource-access-object().getKnownNames();
#.say for DSL::Entity::MachineLearning::resource-access-object().getKnownNameWords();

#use Grammar::Tracer;

say $pCOMMAND.parse('decision tree', rule => 'TOP');

say $pCOMMAND.parse('precision', rule => 'TOP');

say $pCOMMAND.parse('gradient boosted trees',
        rule => 'classifier-entity-command',
        actions => DSL::Entity::MachineLearning::Actions::WL::System.new(resources=>DSL::Entity::MachineLearning::resource-access-object())
        ).made;

#say "=" x 60;
#


my @testCommands = (
'Decision tree',
'SupportVectorMachine',
'Support vector machine',
'precision',
'accuracy',
'true positive number',
'истинско позитивно число',
'машина от поддържащи вектори'
);


my @targets = ('WL-System', 'Raku::System');

my @tbl =
        gather {
            for @testCommands -> $c {
                for @targets -> $t {
                    my $start = now;
                    my $res = ToMachineLearningEntityCode($c, $t);
                    my $timing = now - $start;
                    take %( command => $c, target => $t, :$timing, parsed => $res)
                }
            }
        };

say to-pretty-table(@tbl.sort({ -$_<timing> }), field-names=><command target parsed timing>, align=>'l');
