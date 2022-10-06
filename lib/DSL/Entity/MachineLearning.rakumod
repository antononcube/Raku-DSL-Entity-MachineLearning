
=begin pod

=head1 DSL::Entity::MachineLearning

C<DSL::Entity::MachineLearning> package has grammar and action classes for the parsing and
interpretation of natural language commands that specify metadata.

=head1 Synopsis

    use DSL::Entity::MachineLearning;
    my $rcode = ToMachineLearningEntityCode('NearestNeighbors');

=end pod

unit module DSL::Entity::MachineLearning;

use DSL::Shared::Utilities::CommandProcessing;

use DSL::Entity::MachineLearning::Grammar;
use DSL::Entity::MachineLearning::ResourceAccess;

use DSL::Entity::MachineLearning::Actions::Raku::System;
use DSL::Entity::MachineLearning::Actions::WL::Entity;
use DSL::Entity::MachineLearning::Actions::WL::System;

use DSL::Entity::MachineLearning::Actions::Bulgarian::Standard;

#-----------------------------------------------------------
my %targetToAction =
        "Mathematica"      => DSL::Entity::MachineLearning::Actions::WL::System,
        "Raku"             => DSL::Entity::MachineLearning::Actions::Raku::System,
        "Raku-System"      => DSL::Entity::MachineLearning::Actions::Raku::System,
        "WL"               => DSL::Entity::MachineLearning::Actions::WL::System,
        "WL-System"        => DSL::Entity::MachineLearning::Actions::WL::System,
        "WL-Entity"        => DSL::Entity::MachineLearning::Actions::WL::Entity,
        "Bulgarian"        => DSL::Entity::MachineLearning::Actions::Bulgarian::Standard;

my %targetToAction2{Str} = %targetToAction.grep({ $_.key.contains('-') }).map({ $_.key.subst('-', '::').Str => $_.value }).Hash;
%targetToAction = |%targetToAction , |%targetToAction2;

#| Target to separators rules
my Str %targetToSeparator{Str} = DSL::Shared::Utilities::CommandProcessing::target-separator-rules();

#-----------------------------------------------------------
my DSL::Entity::MachineLearning::ResourceAccess $resourceObj;

#| Get the resources access object.
our sub resource-access-object(--> DSL::Entity::MachineLearning::ResourceAccess) { return $resourceObj; }

#-----------------------------------------------------------
#| Named entity recognition for machine learning. (proto)
proto ToMachineLearningEntityCode(Str $command, Str $target = 'WL-System', | ) is export {*}

#| Named entity recognition for machine learning
multi ToMachineLearningEntityCode( Str $command, Str $target = 'WL-System', *%args ) {

    my $pCOMMAND = DSL::Entity::MachineLearning::Grammar;
    $pCOMMAND.set-resources(DSL::Entity::MachineLearning::resource-access-object());

    my $ACTOBJ = %targetToAction{$target}.new(resources => DSL::Entity::MachineLearning::resource-access-object());

    DSL::Shared::Utilities::CommandProcessing::ToWorkflowCode( $command,
                                                               grammar => $pCOMMAND,
                                                               actions => $ACTOBJ,
                                                               separator => %targetToSeparator{$target},
                                                               |%args )
}

#-----------------------------------------------------------
$resourceObj := BEGIN {
    my DSL::Entity::MachineLearning::ResourceAccess $obj .= new;
    $obj.ingest-resource-files();
    $obj
}